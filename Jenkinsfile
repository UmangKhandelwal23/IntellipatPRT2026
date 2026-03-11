pipeline {
    environment{
        DOCKERHUB_CREDENTIALS = credentials('docker')
    }
    agent{
        label 'Slave01'
    }
    stages {
        stage('git') {
            steps {
                git branch: 'main', url: 'https://github.com/UmangKhandelwal23/IntellipatPRT2026'
            }
        }
        stage('docker') {
            steps {
                sh 'sudo docker build -t umangkhandelwal/practiseprt:v2 ${WORKSPACE}'
                sh 'sudo docker login -u ${DOCKERHUB_CREDENTIALS_USR} -p ${DOCKERHUB_CREDENTIALS_PSW}'
                sh 'sudo docker push umangkhandelwal/practiseprt:v2'
            }
        }
        stage('k8') {
            steps {
                 sh 'kubectl apply -f k8/Deployment.yml'
                 sh 'kubectl apply -f k8/Service.yml'

             }
        }
    }
}
