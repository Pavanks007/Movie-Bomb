pipeline {
  agent { label 'slave1' }

  options {
    timestamps()
  }

  stages {
    stage('Checkout') {
      steps {
        // Best practice for Multibranch: Jenkins already knows repo + branch
        checkout scm
      }
    }

    stage('Build & Test') {
      steps {
        sh 'mvn -v'
        sh 'mvn -B clean test'
      }
      post {
        always {
          // Publish unit test results in Jenkins
          junit 'target/surefire-reports/*.xml'
        }
      }
    }
    
stage('Security Scan - OWASP Dependency Check') {
   environment {
    NVD_API_KEY = credentials('nvd-api-key')
  }
  steps {
    dependencyCheck(
      odcInstallation: 'dependency-check',
      additionalArguments: '''
        --scan .
        --format HTML
        --out dependency-check-report
        --disableAssembly
      '''
    )
  }
  post {
    always {
      archiveArtifacts artifacts: 'dependency-check-report/**', fingerprint: true
    }
  }
}

  }
}
