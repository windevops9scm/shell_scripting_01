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
//     agent {
//         //node { label 'workstation' }
//         //label 'JAVA'
//         none
//         }
agent none

    stages{

        stage('Master node') {
          agent {
            label 'MASTER'
        }
            steps {
                sh 'echo Hello'
                }
              }
        stage('Agent node') {
          agent {
            label 'JAVA'
          }
            steps {
                sh 'echo World'
                }
              }

            post {

              always {
                sh 'echo post steps'
                }
              }
      }

}