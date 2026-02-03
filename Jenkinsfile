pipeline {
    agent {
        docker {
            image 'node:20-alpine'
            args '-u root'
        }
    }

    stages {
        stage('Build') {
            steps {
                sh 'npm install'
            }
        }

        stage('Run Test') {
            steps {
                sh 'npm test'
            }
        }
    }
}
