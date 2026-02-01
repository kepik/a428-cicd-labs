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

        stage('Install Node.js (macOS)') {
            steps {
                sh '''
                if [ ! -d "$NODE_HOME" ]; then
                  echo "Installing Node.js for macOS (ARM64)..."
                  curl -fsSL https://nodejs.org/dist/v$NODE_VERSION/node-v$NODE_VERSION-darwin-arm64.tar.gz -o node.tar.gz
                  tar -xzf node.tar.gz
                  mv node-v$NODE_VERSION-darwin-arm64 $NODE_HOME
                fi
                '''
            }
        }

        stage('Check Node') {
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
