#!groovy

pipeline {
   environment { 
      registry = "https://hub.docker.com/repository/docker/hello-docker" 
      registryCredential = 'dockerhub_id' 
      dockerImage = '' 
  }
  agent none
  stages {
    stage('Maven Install') {
      agent {
        docker {
          image 'maven:3.6.3'
           args '-v $HOME/.m2:/root/.m2'
        }
      }
      steps {
        sh 'mvn clean install'
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
