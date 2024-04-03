pipeline {
   agent { docker { image 'mcr.microsoft.com/playwright/dotnet:v1.42.0-jammy' } }
   stages {
      stage('e2e-tests') {
         steps {
            sh 'dotnet build'
            sh 'dotnet test'
         }
      }
   }
}