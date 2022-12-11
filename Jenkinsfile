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

    stage('prepare env') {
      steps {
        sh '''cd ./frontend/host
              echo "REACT_APP_BASE_URL=$REACT_APP_BASE_URL
              REACT_APP_GOOGLE_API_KEY=$REACT_APP_GOOGLE_API_KEY
              REACT_APP_CLOUD_NAME=$REACT_APP_CLOUD_NAME
              REACT_APP_UPLOAD_PRESET=$REACT_APP_UPLOAD_PRESET" >.env'''
      }
    }

    stage('build host') {
      steps {
        sh '''cd frontend/host
            docker build -t pbl6host .
            '''
      }
    }
    stage('build client') {
      steps {
        sh '''cd frontend/client
            cp .env.production.example .env
            docker build -t pbl6client .
            '''
      }
    }

    stage('push image') {
      steps {
            withCredentials([usernamePassword(credentialsId: 'e97b3f57-3660-4723-857c-c3729635f960', usernameVariable: 'DOCKER_USERNAME', passwordVariable: 'DOCKER_PASSWORD')]){
            sh '''docker login -u $DOCKER_USERNAME -p $DOCKER_PASSWORD
                docker tag pbl6host:latest ngovandong/pbl6host:latest
                docker push ngovandong/pbl6host:latest
                docker tag pbl6client:latest ngovandong/pbl6client:latest
                docker push ngovandong/pbl6client:latest'''
            }
      }
    }

  }
}

