pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                git 'https://github.com/matthancantrell/PlaywrightTesting.git'
                sh 'docker build -t playwright-docker .'
            }
        }
        stage('Test') {
            steps {
                sh 'docker run -it playwright-docker dotnet test'
            }
        }
    }
}
