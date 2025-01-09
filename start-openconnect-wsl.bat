wsl echo "Opened WSL"

:start

@echo off

set /p otp=  "Enter OTP: "  %

@echo on

wsl bash -c "cd ~/repos/openconnect-as-a-container && sudo docker compose kill && sudo docker compose down"
wsl bash -c "cd ~/repos/openconnect-as-a-container && echo %otp% > vpntoken && sudo docker compose up -d && sudo docker compose logs --follow"
wsl bash -c "cd ~/repos/openconnect-as-a-container && sudo docker compose kill && sudo docker compose down"

@echo off

set /p choice="Press 'r' to restart or any other key to exit: "
if /i "%choice%"=="r" goto start

