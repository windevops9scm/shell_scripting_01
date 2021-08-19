// pipeline {
//     agent any
//
//     stages{
//
//         stage('terraform init') {
//             steps {
//                 sh 'cd terraform/roboshop-shell-scripting ; terraform init'
//                 }
//               }
//         stage('terraform destroy') {
//             steps {
//                 sh '''
//                   cd terraform/roboshop-shell-scripting
//                   terraform destroy -auto-approve
//                 '''
//                 }
//           }
//
//       }
//
// }


pipeline {
    agent {
        //node { label 'workstation' }
        label 'JAVA'
        }

    stages{

        stage('Master node') {
            steps {
                sh 'echo Hello'
                }
              }
        stage('Agent node') {
            steps {
                sh 'echo Hello'
                }
              }
      }

}