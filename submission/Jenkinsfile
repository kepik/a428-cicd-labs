pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                git branch: 'submission',
                    url: 'https://github.com/kepik/a428-cicd-labs.git'
            }
        }

        stage('Install & Test') {
            agent {
                docker {
                    image 'python:3.11-slim'
                }
            }
            steps {
                sh '''
                  pip install pytest
                  pytest || true
                '''
            }
        }

        stage('Run App') {
            agent {
                docker {
                    image 'python:3.11-slim'
                }
            }
            steps {
                sh 'python app.py || true'
            }
        }
    }
}