pipeline {
    agent any
    
    stages {
        stage('Build Docker Image') {
            steps {
                script {
                    docker.build('playwright-docker', '.')
                }
            }
        }
        
        stage('Run Docker Container') {
            steps {
                script {
                    docker.image('playwright-docker').run('-p 8080:80')
                }
            }
        }
    }
}
