pipeline {
    agent {
        docker {
            image 'node:16-buster-slim' 
            args '-p 8080:8080' 
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