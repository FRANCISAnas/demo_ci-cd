pipeline {
    agent any
    
    options {
        // Kepp 5 builds and artifacts
        buildDiscarder(logRotator(numToKeepStr: '5', artifactNumToKeepStr: '5'))
        // Timestamp on pipe
        timestamps()
        // Use obly one build
        disableConcurrentBuilds()
    }

    environment {
        docker_os_images = "Dockerfile_alpine"
        docker_images = "olesyudin/password-generator"
        docker_container_name = "password-generator"
        port = "80"
    }

    stages {
        // Build docker container, push to DockerHub and remove
        stage('Docker build && push') {
            steps {
                script {
                    sh "docker build -t ${env.docker_images}:${BUILD_NUMBER} ${env.docker_os_images}."
                    sh "docker push ${env.docker_images}:${BUILD_NUMBER}"
                    // Use this command to save space on the Jenkins server. Dont use it you want fast speed build
                    // sh "docker rmi -f olesyudin/password-generator:${BUILD_NUMBER}"
                }
            }
        }
        // 1. Download new image from DockerHub
        // 2. Delete old container
        // 3. Run new container
        // 4. Remove old images 
        stage('Puplish over SSH on EC2 Instance') {
            steps {
                sshPublisher(publishers: [sshPublisherDesc(configName: 'AWS instance', transfers: [sshTransfer(cleanRemote: false, excludes: '', execCommand: 
                 """docker pull ${env.docker_images}:${BUILD_NUMBER}
                    docker rm -f ${env.docker_container_name}
                    docker run -d -p ${env.port}:80 --name=${env.docker_container_name} ${env.docker_images}:${BUILD_NUMBER}
                    docker system prune -af""", 
                    execTimeout: 120000, 
                    flatten: false, 
                    makeEmptyDirs: false, 
                    noDefaultExcludes: false, 
                    patternSeparator: '[, ]+', 
                    remoteDirectory: '', 
                    remoteDirectorySDF: false, 
                    removePrefix: '', sourceFiles: '')], 
                    usePromotionTimestamp: false, 
                    useWorkspaceInPromotion: false, 
                    verbose: false)])
            }
        }
    }
}