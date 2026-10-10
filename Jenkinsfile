// RuoYi-Vue 后端 CI：拉代码 → Maven 打包 → 归档 jar
// 触发：Jenkins 任务侧 SCMTrigger 轮询（H/5 * * * *）
pipeline {
    agent any

    stages {
        stage('拉取代码') {
            steps {
                checkout scm
            }
        }
        stage('Maven 打包') {
            steps {
                bat '"E:\\environment\\apache-maven-3.8.2\\bin\\mvn.cmd" -s bin\\maven-settings-opc.xml -Dmaven.repo.local=E:\\environment\\apache-maven-3.8.2\\repository -DskipTests clean package'
            }
        }
        stage('归档制品') {
            steps {
                archiveArtifacts artifacts: 'ruoyi-admin/target/*.jar', fingerprint: true
            }
        }
    }
}
