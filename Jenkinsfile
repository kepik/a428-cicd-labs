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
        sh 'node -v'
        sh 'npm ci'
        sh 'npm run build'
      }
    }
  }
}
