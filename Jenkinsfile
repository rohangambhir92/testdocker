pipeline{
    agent any
    tools{
        maven 'maven'
    }
    
    stages{
    stage ('checkout')
		{
			steps
			{
				checkout scm
			}
		}
		stage ('Build')
		{
			steps
			{
				bat "mvn install"
			}
		}
		stage ('Unit Testing')
		{
			steps
			{
				bat "mvn test"
			}
		}
	    	/*
		stage ('Sonar Analysis')
		{
			steps
			{
				withSonarQubeEnv("Test_Sonar") 
				{
					bat "mvn org.sonarsource.scanner.maven:sonar-maven-plugin:3.2:sonar"
				}
			}
		}*/
	    stage ('Upload to Artifactory')
		{
			steps
			{
				rtMavenDeployer (
                    id: 'deployer',
                    serverId: '123456789@artifactory',
                    releaseRepo: 'rgtestdocker',
                    snapshotRepo: 'rgtestdocker'
                )
                rtMavenRun (
                    pom: 'pom.xml',
                    goals: 'clean install',
                    deployerId: 'deployer',
                )
                rtPublishBuildInfo (
                    serverId: '123456789@artifactory',
                )
			}
		}
	    stage('Build Image')
    		{		
            		steps
				{
                		bat "docker build -t dtr.nagarro.com:443/tag11:${BUILD_NUMBER} ."
            			}
		}
    }
    post{
        success{
            sh "echo success"
        }
    }
    
}
