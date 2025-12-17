wsl echo "Opened WSL"

:start

@echo off

set /p otp=  "Enter OTP: "  %

@echo on

wsl sudo bash -c "docker network rm openconnect && docker network create openconnect --subnet=192.168.100.0/24 && cd /home/neil/repos/openconnect-as-a-container && docker compose kill && docker compose down && echo %otp% > vpntoken && docker compose up -d && docker compose logs --follow"
wsl sudo bash -c "docker compose kill && docker compose down"

@echo off

set /p choice="Press 'r' to restart or any other key to exit: "
if /i "%choice%"=="r" goto start

