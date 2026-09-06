@echo off
rem OPC 套件：后端单元测试（JUnit4，8 用例）
cd /d "%~dp0.."
mvn -s "D:\iTwoLeg\OPC项目\RuoYi-Vue3\maven-settings-opc.xml" -pl ruoyi-system -am test
