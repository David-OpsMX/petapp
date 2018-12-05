pipeline {
  agent any
    triggers {
      pollSCM('*/2 * * * *')
    }
  stages {
     stage('restapp build'){
       steps{
	  sh 'echo Building ${BRANCH_NAME} ....'
	  sh 'sh /var/lib/jenkins/tools/hudson.tasks.Maven_MavenInstallation/M3/bin/mvn -e clean install'
        }
     }
     stage('Build Docker Image'){
       environment { 
        IMAGE="simple-1.0"
       }
       steps {
	 sh """
          docker build -t  opsmx11/restapp:${IMAGE} .
	  echo \"${IMAGE}\" > restapp.txt
          docker push opsmx11/restapp:${IMAGE} 
        """
        }
     }
     stage('Push Image'){
       steps {
           sh "sudo docker login --username opsmx11 --password Networks123!"
           sh "sudo docker push opsmx11/restapp:simp-1.0"
	 }
     }
  } 
}
