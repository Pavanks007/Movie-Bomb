pipeline {
  agent any
  stages {
    stage('Checkout') {
      steps {
        checkout scmGit(branches: [[name: 'main']], extensions: [], userRemoteConfigs: [[credentialsId: 'github-credentials', url: 'https://github.com/Pavanks007/Movie-Bomb.git']])
     }
    }
  }

   stage('Build') {
      steps {
        sh 'mvn -v'
        sh 'mvn clean package'
      }
      post {
        success {
          archiveArtifacts artifacts: 'target/*.war', fingerprint: true
        }
      }
    }
  
}
