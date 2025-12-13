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
          junit testResults: 'target/surefire-reports/*.xml', allowEmptyResults: true
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

    stage('Package') {
      steps {
        sh 'mvn -B package -DskipTests'
      }
      post {
        success {
          archiveArtifacts artifacts: 'target/*.war', fingerprint: true
        }
      }
    }

  stage('Deploy to Tomcat (main only)') {
  when { branch 'main' }

  environment {
    TOMCAT_HOST    = "44.197.184.39"
    TOMCAT_USER    = "ubuntu"                 // change if your server user is different
    TOMCAT_WEBAPPS = "/var/lib/tomcat10/webapps"
    TOMCAT_SERVICE = "tomcat10"
    SSH_CRED_ID    = "appserver-ssh-key"      // your Jenkins SSH credential ID
  }

  steps {
    sshagent(credentials: ["${SSH_CRED_ID}"]) {
      sh '''
        set -e
        WAR_FILE=$(ls -1 target/*.war | head -n 1)
        echo "Deploying: $WAR_FILE to ${TOMCAT_HOST}"

        # Stop Tomcat, clean previous deployment, then deploy new WAR
        ssh -o StrictHostKeyChecking=no ${TOMCAT_USER}@${TOMCAT_HOST} "
          sudo systemctl stop ${TOMCAT_SERVICE} || true
          sudo rm -f ${TOMCAT_WEBAPPS}/ROOT.war
          sudo rm -rf ${TOMCAT_WEBAPPS}/ROOT
          sudo mkdir -p ${TOMCAT_WEBAPPS}
        "

        scp -o StrictHostKeyChecking=no "$WAR_FILE" ${TOMCAT_USER}@${TOMCAT_HOST}:/tmp/ROOT.war

        ssh -o StrictHostKeyChecking=no ${TOMCAT_USER}@${TOMCAT_HOST} "
          sudo mv /tmp/ROOT.war ${TOMCAT_WEBAPPS}/ROOT.war
          sudo systemctl start ${TOMCAT_SERVICE}
          sudo systemctl status ${TOMCAT_SERVICE} --no-pager
        "
      '''
    }
  }
}

    
  }
}
