// RuoYi-Vue 后端 CI/CD：拉代码 → Maven 打包 → 归档 jar → 部署（停机替换+健康检查+回滚）
// 触发：Jenkins 任务侧 SCMTrigger 轮询（H/5 * * * *）
// 说明：部署脚本固定放 D:\Program Files(AI)\jenkins\scripts（ASCII 路径），因本机安全软件会清理仓库内该脚本
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
        stage('部署') {
            steps {
                bat 'powershell -NoProfile -ExecutionPolicy Bypass -File "D:\\Program Files(AI)\\jenkins\\scripts\\deploy-backend.ps1" -SourceJar ruoyi-admin\\target\\ruoyi-admin.jar'
            }
        }
    }
}
