#!/usr/bin/env groovy

pipeline {
    agent { label 'docker' }
    options {
        buildDiscarder(logRotator(numToKeepStr: '10'))
        timeout(time: 1, unit: 'HOURS')
    }

    stages {
        stage('Validate') {
            steps {
                sh 'make validate'
            }
        }
    }
}
