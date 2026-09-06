@echo off
rem OPC 套件：打包后端（依赖已缓存，可离线）
cd /d "%~dp0.."
mvn -s "D:\iTwoLeg\OPC项目\RuoYi-Vue3\maven-settings-opc.xml" -DskipTests package
