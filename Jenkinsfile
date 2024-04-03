pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                git 'https://github.com/matthancantrell/PlaywrightTesting.git'
                sh 'dir'
            }
        }
        stage('Test') {
            steps {
                sh 'docker run -it playwright-docker dotnet test'
            }
        }
    }
}
