// // pipeline {
// //     agent any
// //
// //     stages{
// //
// //         stage('terraform init') {
// //             steps {
// //                 sh 'cd terraform/roboshop-shell-scripting ; terraform init'
// //                 }
// //               }
// //         stage('terraform destroy') {
// //             steps {
// //                 sh '''
// //                   cd terraform/roboshop-shell-scripting
// //                   terraform destroy -auto-approve
// //                 '''
// //                 }
// //           }
// //
// //       }
// //
// // }
//
//
// pipeline {
// //     agent {
// //         //node { label 'workstation' }
// //         //label 'JAVA'
// //         none
// //         }
// agent any
//
//     stages{
//
//         stage('Master node') {
//           agent {
//             label 'MASTER'
//         }
//             steps {
//                 sh 'echo Hello'
//                 }
//               }
//         stage('Agent node') {
//           agent {
//             label 'JAVA'
//           }
//             steps {
//                 sh 'echo World'
//                 }
//               }
//
//            }
//  post {
//
//   always {
//     sh 'echo post steps'
//       }
//     }
// }

pipeline {
  agent any
  options { disableConcurrentBuilds() }
  tools {
    maven 'maven'
  }

  environment {
    DEMO_URL = "google.com"
    SSH = credentials('CENTOS_SSH')
  }

  parameters {
          string(name: 'PERSON', defaultValue: 'Mr Jenkins', description: 'Who should I say hello to?')
          text(name: 'BIOGRAPHY', defaultValue: '', description: 'Enter some information about the person')
          booleanParam(name: 'TOGGLE', defaultValue: true, description: 'Toggle this value')
          choice(name: 'CHOICE', choices: ['One', 'Two', 'Three'], description: 'Pick something')
          password(name: 'PASSWORD', defaultValue: 'SECRET', description: 'Enter a password')
  }

  stages {
    stage('one') {
      environment {
        DEMO_URL = "yahoo.com"
    }
      steps {
        sh 'echo ${DEMO_URL}'
        echo "${SSH_USR}"
        echo "PERSON = ${PERSON}"
     }
   }
   stage('compile') {
    input {
             message "Should we continue?"
             ok "Yes, we should."
           }

     steps {
       sh 'mvn clean'
     }
   }
   stage('Three') {
     steps {
       echo 'Three'
     }
   }
  }
}