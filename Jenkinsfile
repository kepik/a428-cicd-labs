pipeline {
    agent {
        docker {
            image 'node:20-alpine'
            reuseNode true
        }
    }

    stages {
        stage('Install Dependencies') {
            steps {
                sh 'node -v'
            }
        }
        stage('Build') {
            steps {
                sh 'npm install'
                sh 'npm run build'
            }
        }
        stage('Test') {
            steps {
                sh './jenkins/scripts/test.sh'
                sleep time: 1, unit: 'MINUTES'
            }
        }

        stage('Manual Approval') {
            steps {
                input message: 'Lanjutkan ke tahap Deploy?'
            }
        }

        stage('Deploy') { 
            steps {
                echo 'Deploying application...'
                sh './jenkins/scripts/deliver.sh'
                
                echo 'Application is running for 1 minute...'
                sleep time: 1, unit: 'MINUTES'

                input message: 'Sudah selesai menggunakan React App? (Klik "Proceed" untuk mengakhiri)' 
                sh './jenkins/scripts/kill.sh' 
            }
        }

    }
}
