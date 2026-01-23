pipeline {
    agent {
        docker {
            image 'node:16-buster-slim'
        }
    }

    stages {
        stage('Install dependencies') {
            steps {
                sh 'node --version'
                sh 'npm install'
            }
        }

        stage('Build') {
            steps {
                sh 'npm run build'
            }
        }
    }
}
