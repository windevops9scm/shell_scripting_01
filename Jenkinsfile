pipeline {
    agent any

    stages{

        stage('terraform init') {
            steps {
                sh 'cd roboshop ; terraform init'
                }
              }
        stage('terraform destroy') {
            steps {
                sh '''
                  cd roboshop
                  terraform destroy -auto-approve
                '''
                }
          }

      }

}