@echo off
setlocal

:: =================================================================================
:: 1. Periksa Hak Administrator
:: =================================================================================
%windir%\system32\reg.exe query "HKU\S-1-5-19" >nul 2>&1 || (
    echo.
    echo ======================================================
    echo Error: jalankan skrip ini sebagai Administrator.
    echo ======================================================
    echo.
    pause
    exit
)

:: Pindah ke direktori tempat skrip berada
cd /d "%~dp0"

:: =================================================================================
:: 2. Kill intel graphics experience [busuk dia]
:: =================================================================================
echo [*] Kill Intel Graphics Experience...
taskkill /f /im "IntelCpHDCPSvc.exe" >nul 2>&1
taskkill /f /im "IntelCpHeciSvc.exe" >nul 2>&1
taskkill /f /im "igfxCUIService.exe" >nul 2>&1
echo.

:: =================================================================================
:: 3. Instal packages
:: =================================================================================

set "file_to_install=Microsoft.NET.Native.Runtime.2.2_2.2.28604.0_x64__8wekyb3d8bbwe.appx"
if exist "%file_to_install%" (
    echo [+] Menginstal %file_to_install%...
    PowerShell -Command "Add-AppxPackage -Path '.\%file_to_install%' -ForceApplicationShutdown"
) else (
    echo [!] File tidak ditemukan: %file_to_install%
)

set "file_to_install=Microsoft.NET.Native.Framework.2.2_2.2.29512.0_x64__8wekyb3d8bbwe.appx"
if exist "%file_to_install%" (
    echo [+] Menginstal %file_to_install%...
    PowerShell -Command "Add-AppxPackage -Path '.\%file_to_install%' -ForceApplicationShutdown"
) else (
    echo [!] File tidak ditemukan: %file_to_install%
)

set "file_to_install=Microsoft.VCLibs.140.00_14.0.33519.0_x64__8wekyb3d8bbwe.appx"
if exist "%file_to_install%" (
    echo [+] Menginstal %file_to_install%...
    PowerShell -Command "Add-AppxPackage -Path '.\%file_to_install%' -ForceApplicationShutdown"
) else (
    echo [!] File tidak ditemukan: %file_to_install%
)

set "file_to_install=Microsoft.VCLibs.140.00.UWPDesktop_14.0.33728.0_x64__8wekyb3d8bbwe.appx"
if exist "%file_to_install%" (
    echo [+] Menginstal %file_to_install%...
    PowerShell -Command "Add-AppxPackage -Path '.\%file_to_install%' -ForceApplicationShutdown"
) else (
    echo [!] File tidak ditemukan: %file_to_install%
)

set "file_to_install=Microsoft.UI.Xaml.2.8_8.2501.31001.0_x64__8wekyb3d8bbwe.appx"
if exist "%file_to_install%" (
    echo [+] Menginstal %file_to_install%...
    PowerShell -Command "Add-AppxPackage -Path '.\%file_to_install%' -ForceApplicationShutdown"
) else (
    echo [!] File tidak ditemukan: %file_to_install%
)

set "file_to_install=Microsoft.DesktopAppInstaller_2025.402.233.0_neutral_~_8wekyb3d8bbwe.Msixbundle"
if exist "%file_to_install%" (
    echo [+] Menginstal %file_to_install%...
    PowerShell -Command "Add-AppxPackage -Path '.\%file_to_install%'"
) else (
    echo [!] File tidak ditemukan: %file_to_install%
)

set "file_to_install=Microsoft.WindowsStore_22504.1401.19.0_neutral_~_8wekyb3d8bbwe.Msixbundle"
if exist "%file_to_install%" (
    echo [+] Menginstal %file_to_install%...
    PowerShell -Command "Add-AppxPackage -Path '.\%file_to_install%'"
) else (
    echo [!] File tidak ditemukan: %file_to_install%
)

echo.
echo Semua paket telah diinstal.
echo Silakan restart komputer anda.
echo.
pause
