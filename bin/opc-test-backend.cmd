@echo off
rem OPC 套件：后端单元测试（JUnit4，8 用例）
cd /d "%~dp0.."
mvn -s "%~dp0maven-settings-opc.xml" -pl ruoyi-system -am test
