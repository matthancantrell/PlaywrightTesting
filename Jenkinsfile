@Library('cicd-jenkins-shared-libraries@v1.15.4') _

def buildAgentDockerfile='cicd/docker/Dockerfile'
def playwrightDockerImage

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
                    docker.image('playwright-docker').run('-p 8081:80')
                }
            }
        }
    }
}
