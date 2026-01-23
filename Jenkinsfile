pipeline {
  agent {
    docker {
      image 'node:16-buster-slim'
    }
  }

  options {
    skipDefaultCheckout()
  }

  stages {
    stage('Checkout') {
      steps {
        checkout scm
      }
    }

    stage('Build') {
      steps {
        sh 'docker version'
        sh 'node -v'
        sh 'npm ci'
        sh 'npm run build'
      }
    }
  }
}
