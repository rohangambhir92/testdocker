pipeline{
    agent any
    tools{
        maven 'Maven'
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
				sh "mvn install"
			}
		}
		stage ('Unit Testing')
		{
			steps
			{
				sh "mvn test"
			}
		}
	    	
		stage ('Sonar Analysis')
		{
			steps
			{
				withSonarQubeEnv("Test_Sonar") 
				{
					sh "mvn org.sonarsource.scanner.maven:sonar-maven-plugin:3.2:sonar"
				}
			}
		}
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
                		sh "docker build -t tag11:${BUILD_NUMBER} ."
            			}
		}
	    stage("Docker Deployment")
        	{
			steps
			{
                	sh "docker run --name testrgdocker -d -p 9004:8080 tag11:${BUILD_NUMBER}"
        		}
		}
    }
    post{
        success{
            sh "echo success"
        }
    }
    
}
