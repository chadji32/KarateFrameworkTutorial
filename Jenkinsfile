pipeline {
    agent any 
    
    	parameters { choice(name: 'Environment', choices: ['staging', 'preprod', 'prod'], description: 'Profile needs to be used while executing test') }
    stages { 
        stage('Clean WorkSpace Directory') {
            steps{
                //define the single or multiple step
                bat 'echo Clean WorkSpaceDirectory'
                cleanWs notFailBuild: true
            }
           
        }
         stage('Git Checkout') {
             steps{
                //define the single or multiple step
                bat 'echo Git Checkout'
                checkout([$class: 'GitSCM', branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/chadji32/KarateFrameworkTutorial.git']]])
            }
           
        }
         stage('Restore Packages') {
             steps{
                //define the single or multiple step
                bat 'echo Restore Packages'
            }
           
        }
         stage('Build') {
             steps{
                //define the single or multiple step
                bat 'echo Build'
                bat 'mvn clean compile'
                
            }
           
        }
        stage('Deploy') {
            steps{
                //define the single or multiple step
                bat 'echo Deploying the application'
                
            }
           
        }
        stage('Run the Test') {
            steps {
                //define the single or multiple step
                bat 'echo Test Execution Started'
                bat 'mvn -P %Environment% test'
                
            }
        }
    }
    post {
        always {
            junit 'target\\surefire-reports/*.xml'
            cucumber buildStatus: 'null', customCssFiles: '', customJsFiles: '', failedFeaturesNumber: -1, failedScenariosNumber: -1, failedStepsNumber: -1, fileIncludePattern: '**/*.json', jsonReportDirectory: 'target', pendingStepsNumber: -1, reportTitle: 'Karate Test Execution', skippedStepsNumber: -1, sortingMethod: 'ALPHABETICAL', undefinedStepsNumber: -1
        }
    }
   
}