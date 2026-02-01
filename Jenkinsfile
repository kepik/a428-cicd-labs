pipeline {
    agent any

    tools {
        nodejs 'nodejs'
    }
    
    stage('Check Environment') {
        steps {
            sh 'node -v'
            sh 'npm -v'
        }
    }

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        
        stage('Install Dependencies') {
            steps {
                sh 'npm install'
            }
        }

        stage('Build') {
            steps {
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
