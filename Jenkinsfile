pipeline {
    agent any
	
    environment {
		DOCKERHUB_CREDENTIALS=credentials('docker-token')
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
		        docker rmi AnselmPowell/laravel-php || true
		        docker build -t AnselmPowell/laravel-php .
                        docker compose up -d
		        docker push AnselmPowell/laravel-php
		        '''
            }
        }
	      //sh '''
		      //  docker compose down
	               // docker stop laravel-container || true
		       // docker rm laravel-container || true
		      //  docker rmi AnselmPowell/laravel-php || true
		     //   
                             
		//        '''
        stage('Clean') {
            steps {
             echo "hi"
	    sh  'docker compose down'
            }
        }
    }
}
