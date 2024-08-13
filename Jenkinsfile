pipeline {
    agent any
    environment {
		NEXUS_CREDENTIALS=credentials('nexus')
        PATH="${env.PATH}:/opt/usr/sonar-scanner/bin/"
	}
    stages {

        stage('process starting') {
            steps {
                echo "process starting..."
            }
        }
        stage('terraform') {
            when {
                 changeset '*/**.tf'
                }

            steps {
                sh'''
                     echo "terraform starting..."
                     terraform init
                     terraform plan
                     terraform apply  -auto-approve   
                   '''
            }
        }  
        stage('sonarqube scan') {
            steps {

                nodejs('NodeJS') {
                    sh '''   
                        echo "sonarqube scan..."
                        # export PATH=$PATH:/opt/usr/sonar-scanner/bin/
                         sonar-scanner \
                        -Dsonar.projectKey=mynode \
                        -Dsonar.sources=./src \
                        -Dsonar.host.url=http://nexus.winters-tek.net:9001 \
                        -Dsonar.login=
                
                  '''
                    }
               
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
        stage('docker image build and push to nexus ') {
            steps {
                sh '''
                      
                      echo "docker build..."
                      docker build -t mynode:${BUILD_NUMBER} .
                      docker tag mynode:${BUILD_NUMBER} nexus.winters-tek.net:8083/harbinman/mynode:${BUILD_NUMBER}
                              
                    
                   '''
            }
        }

        stage('trivy scan') {
            steps {
                sh '''
                      echo "docker build..."
                       docker run  --rm -v /var/run/docker.sock:/var/run/docker.sock aquasec/trivy:0.54.1 image --severity CRITICAL,HIGH mynode:${BUILD_NUMBER} >> result_${BUILD_NUMBER}.txt
                               
                '''
            }
        }
        
        stage('artifactory trivy result to nexus') {
            steps {

                archiveArtifacts artifacts: '**/*.txt', allowEmptyArchive: 'true'
                sh '''
                
                        echo "artifactory trivy result to nexus..."
                        
                        curl --fail -u $NEXUS_CREDENTIALS_USR:$NEXUS_CREDENTIALS_PSW --upload-file result_${BUILD_NUMBER}.txt 'http://nexus.winters-tek.net:8081/repository/raw-host/'      
                
                    '''
            }
        }
        stage('docker image push to nexus') {
            steps {
                sh '''
                        echo "docker push to nexus..."
                        echo $NEXUS_CREDENTIALS_PSW | docker login nexus.winters-tek.net:8083 -u $NEXUS_CREDENTIALS_USR --password-stdin
                        docker push nexus.winters-tek.net:8083/harbinman/mynode:${BUILD_NUMBER}       
                              
                  '''
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
