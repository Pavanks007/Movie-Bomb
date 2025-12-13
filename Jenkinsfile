pipeline {
  agent { label 'slave1' }

  options {
    timestamps()
  }

  stages {
    stage('Checkout') {
      steps {
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
          junit 'target/surefire-reports/*.xml'
        }
      }
    }

    stage('Security Scan - OWASP Dependency Check') {
      environment {
        NVD_API_KEY = credentials('nvd-api-key')
        DC_DATA_DIR = "${WORKSPACE}/.dc-data"
        DC_OUT_DIR  = "${WORKSPACE}/dependency-check-report"
      }
      steps {
        sh '''
          set -e
          # clean/recreate to avoid corrupt DB issues
          rm -rf "$DC_DATA_DIR" "$DC_OUT_DIR"
          mkdir -p "$DC_DATA_DIR" "$DC_OUT_DIR"
        '''

        dependencyCheck(
          odcInstallation: 'dependency-check',
          additionalArguments: """
            --scan .
            --format HTML
            --out "${DC_OUT_DIR}"
            --data "${DC_DATA_DIR}"
            --nvdApiKey "${NVD_API_KEY}"
            --failOnCVSS 7
            --disableAssembly
          """
        )
      }
      post {
        always {
          archiveArtifacts artifacts: 'dependency-check-report/**', fingerprint: true, allowEmptyArchive: true
        }
      }
    }
  }
}
