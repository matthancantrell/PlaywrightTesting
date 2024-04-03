pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                // Checkout the code from your Git repository
                checkout scm
            }
        }

        stage('Build Docker Image') {
            steps {
                // Build the Docker image using the Dockerfile in your repository
                sh 'docker build -t my-docker-image .'
            }
        }

        stage('Run Tests') {
            steps {
                // Run tests using the built Docker image
                sh 'docker run --rm my-docker-image dotnet test'
            }
        }
    }

    post {
        always {
            // Clean up any temporary files or resources
            deleteDir()
        }
    }
}
