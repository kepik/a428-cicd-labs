pipeline {
    
    agent {
        docker {
            image 'node:16-buster-slim'
            args '-p 50000:50000'
        }
    }
    stages {
        stage('Build') {
            steps {
                sh 'npm install'
            }
        }
    }
}