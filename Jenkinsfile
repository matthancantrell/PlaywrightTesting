pipeline {
    agent { dockerfile true }

    stages {

        stage('Build Docker Image') {
            steps {
                // Build the Docker image using the Dockerfile in your repository
                sh 'docker build -t my-docker-image .'
            }
        }

        stage('Run Tests') {
            steps {
                // Run tests using the built Docker image
                sh 'docker run -it my-docker-image dotnet test'
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
