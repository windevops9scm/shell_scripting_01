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
        node { label 'workstation' }
        }

    stages{

        stage('one') {
            steps {
                sh 'cd jenkins ; echo Hello'
                }
              }

      }

}