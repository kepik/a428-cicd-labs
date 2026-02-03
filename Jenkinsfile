pipeline {
    agent {
        docker {
            image 'node:25-alpine3.22'
            reuseNode true 
            args '-p 3000:3000' 
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