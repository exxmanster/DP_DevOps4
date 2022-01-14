pipeline {
    agent any

    parameters {
       booleanParam(name: 'autoApprove', defaultValue: false, description: 'Automatically run apply after generating plan?')
    }
    
    environment {
        AWS_ACCESS_KEY_ID     = credentials('AWS_ACCESS_KEY_ID')
        AWS_SECRET_ACCESS_KEY = credentials('AWS_SECRET_ACCESS_KEY')
        TF_IN_AUTOMATION      = '1'
        PATH_TO_BASTION_ID = credentials('bastion_id')
        PATH_TO_BASTION_ID_PUB = credentials('bastion_id_pub')
        JENKINS_PUB_KEY = credentials('jenkins_pub_key')
    }
    
     stages {


        stage('Clone') {
            steps {
                git branch: 'edu_jenkins', url: 'https://github.com/exxmanster/DP_DevOps4.git'
     }
   }     

        stage('Plan') {
            steps {
                dir('terraform') {     
                sh 'pwd'
                sh 'echo $PATH_TO_BASTION_ID'
                sh 'cp $PATH_TO_BASTION_ID ./'
                sh 'cp $PATH_TO_BASTION_ID_PUB ./'
                sh 'echo $JENKINS_PUB_KEY > id_rsa.pub'
                sh 'ls -la'
                sh 'terraform init -input=false'
                sh 'terraform plan -input=false -out tfplan'
                sh 'terraform show -no-color tfplan > tfplan.log'
           }
        }
    } 

        stage('Approval') {
            when {
                not {
                    equals expected: true, actual: params.autoApprove
                }
            }

            steps {
                dir('terraform') {
                    sh 'pwd'
                script {DestroyDestroyDestroy
                    def plan = readFile 'tfplan.log'
                    input message: "Do you want to apply the plan?",
                        parameters: [text(name: 'Plan', description: 'Please review the plan', defaultValue: plan)]
                }
              }
            }
        }

       
        stage('Apply') {
            steps {
                dir('terraform') {
                    sh 'pwd'
                    sh "terraform apply -input=false tfplan"
                    
            }
         } 
       }
    }

        stage('Parsing Bastion IP') {
            sh "BASTION_PUB_IP=\$(terraform output -json | jq -r .bastion_pub_ip.value)"
            sh "echo ${BASTION_PUB_IP}"

        }


    

    post {
        always {
            archiveArtifacts artifacts: 'terraform/tfplan.log'
        }
    }
}