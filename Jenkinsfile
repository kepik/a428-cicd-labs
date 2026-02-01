pipeline {
    agent any

    environment {
        NODE_VERSION = "18.19.0"
        NODE_HOME = "${WORKSPACE}/node"
        PATH = "${WORKSPACE}/node/bin:${env.PATH}"
    }

    stages {

        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Install Node.js') {
            steps {
                sh '''
                if [ ! -d "$NODE_HOME" ]; then
                  echo "Downloading Node.js..."
                  curl -fsSL https://nodejs.org/dist/v$NODE_VERSION/node-v$NODE_VERSION-linux-x64.tar.xz -o node.tar.xz
                  tar -xf node.tar.xz
                  mv node-v$NODE_VERSION-linux-x64 $NODE_HOME
                fi
                '''
            }
        }

        stage('Check Environment') {
            steps {
                sh 'node -v'
                sh 'npm -v'
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
                sh 'npm test -- --watchAll=false || true'
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
