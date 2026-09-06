@echo off
rem OPC 套件：启动本地 Redis（E 盘安装）
set "REDIS_EXE=E:\Program Files(AI)\tools\redis\redis-server.exe"
tasklist /FI "IMAGENAME eq redis-server.exe" | find /I "redis-server.exe" >nul 2>&1
if %errorlevel%==0 (
    echo Redis already running.
) else (
    start "redis-6379" "%REDIS_EXE%" --port 6379 --logfile redis.log
    echo Redis started on 6379.
)
