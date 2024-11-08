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
                        docker rmi "anselmpowell/laravel-php" || true
                        
                        # Build the Docker image
                        docker build -t "anselmpowell/laravel-php" .
                        
                        # Start the containers
                        docker compose up -d
                        
                        # Push the image to Docker Hub
                        docker push "anselmpowell/laravel-php"
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
