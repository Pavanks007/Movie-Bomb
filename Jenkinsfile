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
      steps {
        dependencyCheck additionalArguments: '''
        --scan .
        --format HTML
        --disableAssembly
      ''',
      odcInstallation: 'dependency-check'
      }
      post {
        always {
        dependencyCheckPublisher pattern: '**/dependency-check-report.html'
        }
      }
    }

  }
}
