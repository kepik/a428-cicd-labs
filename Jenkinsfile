pipeline {
    agent {
        docker {
            image 'node:16-buster-slim'
            args '-p 3000:3000'
        }
    }
    environment {
        CI = 'true'
    }
    stages {
        stage('Build') {
            steps {
                sh 'npm install'
            }
        }
        stage('Test') {
            steps {
                sh './jenkins/scripts/test.sh'
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