// Start only one build
// properties([disableConccurentBuilds()])

pipeline {
    // // Check only main branch
    // agent {
    //     label 'main'
    // }
    // // Kepp 5 builds and artifacts
    // options {
    //     buildDiscarder(logRotator(numToKeepStr: '5', artifactNumToKeepStr: '5'))
    //     timestamps()
    // }

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
                sshPublisher(publishers: [sshPublisherDesc(configName: 'AWS instance', transfers: [sshTransfer(cleanRemote: false, excludes: '', execCommand: """echo "Docker run"
                    docker pull olesyudin/password-generator:${BUILD_NUMBER}
                    docker rm -f password-generator
                    docker run -d -p 80:80 --name=password-generator olesyudin/password-generator:${BUILD_NUMBER}""", execTimeout: 120000, 
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


// pipeline {
//     agent any

//     stages {
//         stage('Hello') {
//             steps {
//                 echo 'Hello World'
//             }
//         }
//     }
// }
