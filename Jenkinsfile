pipeline {
    agent any

    stages{

        stage('terraform init') {
            steps {
                sh 'cd shell_scripting_01/terraform/roboshop-shell-scripting/ ; terraform init'
                }
              }
        stage('terraform destroy') {
            steps {
                sh '''
                  cd shell_scripting_01/terraform/roboshop-shell-scripting/
                  terraform destroy -auto-approve
                '''
                }
          }

      }

}