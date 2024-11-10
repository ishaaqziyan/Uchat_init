@echo off

REM Install curl
echo Installing curl...
powershell -Command "Set-ExecutionPolicy Bypass -Scope Process -Force; iex (New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1')"
choco install curl -y

REM Install Rust
echo Installing Rust...
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs -o rustup-init.exe
.\rustup-init.exe -y
call %USERPROFILE%\.cargo\env

REM Verify Rust installation
echo Verifying Rust installation...
rustup --version

REM Install pkg-config
echo Installing pkg-config...
choco install pkgconfiglite -y

REM Install wasm-bindgen
echo Installing wasm-bindgen...
cargo install wasm-bindgen-cli

REM Install PostgreSQL
echo Installing PostgreSQL...
choco install postgresql -y

REM Install libssl-dev equivalent
echo Installing OpenSSL...
choco install openssl -y

REM Start PostgreSQL service
echo Starting PostgreSQL service...
net start postgresql-x64-13

REM Install libpq-dev equivalent
echo Installing libpq-dev...
choco install libpq -y

REM Install npm
echo Installing npm...
choco install npm -y

REM Install Node.js
echo Installing Node.js...
choco install nodejs -y

REM Install NVM Tooling
echo Installing NVM...
powershell -NoProfile -ExecutionPolicy Bypass -Command "Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.ps1'))"
set NVM_DIR=%USERPROFILE%\.nvm
call %NVM_DIR%\nvm.sh

REM Install specific LTS version of Node.js with nvm
echo Installing Node.js LTS version using NVM...
nvm install 21.7.3

REM Install build-essential equivalent
echo Installing build tools...
choco install visualstudio2019buildtools -y

echo All dependencies have been installed successfully!
pause
