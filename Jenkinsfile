pipeline {
  agent any

  environment {
    JD_TO_PULL = 'node:16-buster-slim'
  }

  stages {
    stage('Pull Image') {
      steps {
        sh 'docker pull "$JD_TO_PULL"'
      }
    }
  }
}
