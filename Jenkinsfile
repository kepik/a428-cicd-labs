pipeline {
  agent {
    docker {
      image 'node:16-buster-slim'
    }
  }

  stages {
    stage('Build') {
      steps {
        sh 'node -v'
        sh 'npm install'
        sh 'npm run build'
      }
    }
  }
}
