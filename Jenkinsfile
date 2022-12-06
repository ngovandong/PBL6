pipeline {
  agent any
  stages {
    stage('Print dev tool version') {
      steps {
        sh '''pwd
            ls
            git --version'''
      }
    }

    stage('Checkout code') {
      steps {
        git(url: 'https://github.com/ngovandong/PBL6', branch: 'develop', credentialsId: 'fc608e6f-8abe-43ea-84ac-a0fd55f44cbf')
        sh '''cd ./frontend/host
              echo "REACT_APP_BASE_URL=$REACT_APP_BASE_URL
              REACT_APP_GOOGLE_API_KEY=$REACT_APP_GOOGLE_API_KEY
              REACT_APP_CLOUD_NAME=$REACT_APP_CLOUD_NAME
              REACT_APP_UPLOAD_PRESET=$REACT_APP_UPLOAD_PRESET" >.env'''
      }
    }

    stage('build image') {
      steps {
        sh '''cd frontend/host
            docker build -t pbl6host .
            '''
      }
    }

    stage('push image') {
      steps {
            withCredentials([usernamePassword(credentialsId: 'e97b3f57-3660-4723-857c-c3729635f960', usernameVariable: 'DOCKER_USERNAME', passwordVariable: 'DOCKER_PASSWORD')]){
            sh '''docker login -u $DOCKER_USERNAME -p $DOCKER_PASSWORD
                docker tag pbl6host:latest ngovandong/pbl6host:latest
                docker push ngovandong/pbl6host:latest'''
            }
      }
    }

    stage('Delete image') {
      steps {
        sh '''docker image rm pbl6host
              docker image rm ngovandong/pbl6host'''
      }
    }

  }
}
