pipeline {
    agent any
    
    environment {
        DOCKERHUB_CREDENTIALS = credentials('docker-token')
        DOCKER_IMAGE = "anselmpowell/laravel-php"  // Docker image names must be lowercase
    }
    
    stages {
        stage('Docker Login') {
            steps {
                sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
            }
        }
        
        stage('Build & Deploy') {
            steps {
                script {
                    // Clean up existing containers and images
                    sh '''
                        docker compose down || true
                        docker rmi ${DOCKER_IMAGE} || true
                        
                        # Build the Docker image
                        docker build -t ${DOCKER_IMAGE} .
                        
                        # Start the containers
                        docker compose up -d
                        
                        # Push the image to Docker Hub
                        docker push ${DOCKER_IMAGE}
                    '''
                }
            }
        }
        
        stage('Clean') {
            steps {
                // Only clean up if explicitly needed
                sh 'docker compose down || true'
            }
        }
    }
    
    post {
        always {
            sh 'docker logout'
        }
    }
}
