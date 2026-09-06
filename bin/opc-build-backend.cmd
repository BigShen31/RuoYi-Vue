@echo off
rem OPC 套件：打包后端（依赖已缓存，可离线）
cd /d "%~dp0.."
mvn -s "%~dp0maven-settings-opc.xml" -DskipTests package
