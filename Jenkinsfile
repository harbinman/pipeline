pipeline {
    agent any

    stages {
        
        stage('sonarqube scan') {
            steps {
                sh 'echo "sonarqube scan..."'
            }
        }
        stage('build') {
            steps {
                sh 'echo "build..."'
            }
        }
        stage('test') {
            steps {
                sh 'echo "test..."'
            }
        }
        stage('docker build') {
            steps {
                sh 'echo "docker build..."'
            }
        }
        stage('trivy scan') {
            steps {
                sh 'echo "docker build..."'
            }
        }
        stage('artifactory trivy result to nexus') {
            steps {
                sh 'echo "artifactory trivy result to nexus..."'
            }
        }
        stage('docker push to nexus') {
            steps {
                sh 'echo "docker push to nexus..."'
            }
        }
        stage('update eks deployment file') {
            steps {
                sh 'echo "update eks deployment file ..."'
            }
        }        
    }
   post {
  always {
     sh 'echo "post ..."'
  }
}
}