pipeline {
    agent { docker{ 
	    image 'docker:latest'  // Use the official Docker image
            args '-v /var/run/docker.sock:/var/run/docker.sock' // Allow Docker commands within the container
		}
	  }
	
    environment {
		DOCKERHUB_CREDENTIALS=credentials('Docker_Hub')
	}
    stages {
        stage('Docker Login') {
            steps {
                sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
            }
        }
        stage('Build & push Dockerfile') {
            steps {
                  sh '''
		       
		        docker stop laravel-container || true
		        docker rm laravel-container || true
		        docker rmi bassam2080/laravel-php || true
		        docker build -t bassam2080/laravel-php .
                        docker compose up -d
		        docker push bassam2080/laravel-php
		        '''
            }
        }
	      //sh '''
		      //  docker compose down
	               // docker stop laravel-container || true
		       // docker rm laravel-container || true
		      //  docker rmi bassam2080/laravel-php || true
		     //   
                             
		//        '''
        stage('Clean') {
            steps {
             echo "hi"
            }
        }
    }
}
