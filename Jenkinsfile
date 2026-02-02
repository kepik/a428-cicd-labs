pipeline {
    agent any

    environment {
        CI = "true"
    }

    stages {

        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Install Dependencies') {
            steps {
                sh 'node -v'
                sh 'npm ci'
            }
        }

        stage('Build') {
            steps {
                sh 'npm run build'
            }
        }

        stage('Test') {
            steps {
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
                sh 'chmod +x ./jenkins/scripts/*.sh'
                sh './jenkins/scripts/deliver.sh'

                echo 'React App berjalan selama 1 menit...'
                sleep time: 60, unit: 'SECONDS'

                echo 'Menghentikan aplikasi...'
                sh './jenkins/scripts/kill.sh'
            }
        }
    }

    post {
        success {
            archiveArtifacts artifacts: 'build/**', fingerprint: true
        }
    }
}
