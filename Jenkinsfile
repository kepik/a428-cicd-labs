pipeline {
  agent {
    docker {
      image 'node:25-alpine3.22'
      reuseNode true
    }
  }

  stages {
    stage('Install') {
      steps {
        sh 'node -v'
        sh 'npm install'
      }
    }

    stage('Build') {
      steps {
        sh 'npm run build'
      }
    }
  }
}
