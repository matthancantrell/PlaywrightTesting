pipeline {
    agent any

    stages {
        stage('Build') {
            git 'https://github.com/matthancantrell/PlaywrightTesting.git'
            sh 'docker build -t playwright docker .'
        }
        stage('Test') {
            sh 'docker run -it playwright-docker dotnet test'
        }
    }
}
