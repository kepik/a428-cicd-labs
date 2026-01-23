pipeline {
    agent any

    parameters {
        string(name: 'JD_TO_PULL', defaultValue: 'nginx:latest', description: 'Docker image to pull')
    }

    stages {
        stage('Pull Docker Image') {
            steps {
                sh 'docker pull $JD_TO_PULL'
            }
        }
    }
}