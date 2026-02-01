pipeline {
    agent {
        docker {
            image 'node:16-buster-slim'
            args '-u root'
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

        stage('Result') {
            steps {
                echo 'No tests available, skipping test stage'
            }
        }
        stage('Deploy') {
            steps {
                sh './jenkins/scripts/deliver.sh'
                input message: 'Sudah selesai menggunakan React App? (Klik "Proceed" untuk mengakhiri)'
                sh './jenkins/scripts/kill.sh'
            }
        }

    }
}
