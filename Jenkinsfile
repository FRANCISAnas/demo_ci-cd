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

    stages {
        // Build docker container, push to DockerHub and remove
        stage('Docker build && push') {
            steps {
                script {
                    sh "docker build -t olesyudin/password-generator:${BUILD_NUMBER} ."
                    sh "docker push olesyudin/password-generator:${BUILD_NUMBER}"
                    // sh "docker rmi -f olesyudin/password-generator:${BUILD_NUMBER}"
                }
            }
        }
        // Download container from DockerHub and run container
        stage('Puplish over SSH') {
            steps {
                sshPublisher(publishers: [sshPublisherDesc(configName: 'AWS instance', transfers: [sshTransfer(cleanRemote: false, excludes: '', execCommand: 
                 """docker pull olesyudin/password-generator:${BUILD_NUMBER}
                    docker rm -f password-generator
                    docker run -d -p 80:80 --name=password-generator olesyudin/password-generator:${BUILD_NUMBER}
                    docker system prune -af""", 
                    execTimeout: 120000, 
                    flatten: false, 
                    makeEmptyDirs: false, 
                    noDefaultExcludes: false, 
                    patternSeparator: '[, ]+', 
                    remoteDirectory: '', 
                    remoteDirectorySDF: false, 
                    removePrefix: '', sourceFiles: '**/*')], 
                    usePromotionTimestamp: false, 
                    useWorkspaceInPromotion: false, 
                    verbose: false)])
            }
        }
    }
}
// docker rm -f password-generator
// docker rmi -f olesyudin/password-generator:${previousBuild}