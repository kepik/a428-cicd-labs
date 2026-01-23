pipeline {
    agent {
        docker {
            image 'node:16-buster-slim'
            args '-p 3000:3000'
        }
    }
    stages {
        stage('Build') {
            steps {
                sh 'npm install'
                sh '/usr/local/bin/docker pull "$JD_TO_PULL"'
            }
        }
    }
}