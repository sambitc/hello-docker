#!groovy

pipeline {
   environment { 
      registry = "https://hub.docker.com/repository/docker/hello-docker" 
      registryCredential = 'dockerhub_id' 
      dockerImage = '' 
  }
  agent none
  stages {
   stage ('Install Stage') {
      steps {
      withMaven(maven : 'apache-maven-3.6.1') {
      bat'mvn  install'
            }
         }
      }
      stage('Building our image') { 
        steps { 
            script { 
                dockerImage = docker.build registry + ":$BUILD_NUMBER" 
            }
        } 
    }
    
      stage('Deploy our image') { 
      steps { 
          script { 
              docker.withRegistry( '', registryCredential ) { 
                  dockerImage.push() 
              }
          } 
      }
  } 
  }
}
