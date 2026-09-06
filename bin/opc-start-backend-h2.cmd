@echo off
rem OPC 套件：H2 内存库保底启动（一条命令）
cd /d "%~dp0.."
java -jar ruoyi-admin\target\ruoyi-admin.jar --spring.profiles.active=h2
