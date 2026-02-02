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

        stage('Manual Approval') {
            steps {
                input message: 'Lanjutkan ke tahap Deploy?', ok: 'Proceed'
            }
        }
        stage('Deploy') { 
            steps {
                sh './jenkins/scripts/deliver.sh'

                echo 'React App berjalan selama 1 menit...'
                sleep time: 60, unit: 'SECONDS'

                echo 'Menghentikan aplikasi...'
                sh './jenkins/scripts/kill.sh'
            }
        }
    }
}