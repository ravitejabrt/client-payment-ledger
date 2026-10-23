@echo off
echo ========================================================
echo   Client Ledger & Monthly Payment Management System
echo ========================================================
echo.
echo Starting application on http://localhost:5000 ...
echo Press Ctrl+C in this window anytime to stop the server.
echo.
timeout /t 2 /nobreak >nul
start http://localhost:5000
node server\index.js
pause
