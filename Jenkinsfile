#!groovy

pipeline {
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
    stage('Docker Build') {
      agent any
      steps {
        sh 'docker build -t sambitc/hello-docker:latest .'
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
