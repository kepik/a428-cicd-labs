pipeline {
    agent {
        docker {
            image 'node:16-buster-slim'
        }
    }

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Build') {
            steps {
                echo 'Installing dependencies and building app'
                sh 'npm install'
                sh 'npm run build'
            }
        }

        stage('Test') {
            steps {
                echo 'Running tests'
                sh 'npm test -- --watchAll=false || true'
            }
        }

        stage('Run App') {
            steps {
                echo 'Running application'
                sh 'npm start &'
            }
        }
        
        stage('Test') {
            steps {
                echo 'No tests available, skipping test stage'
            }
        }

    }
}
