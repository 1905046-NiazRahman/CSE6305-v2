@echo off
setlocal enabledelayedexpansion

REM Loop through all folders starting with A
for /d %%D in (A*) do (
    set "name=%%D"

    REM Skip if already renamed (contains parentheses)
    echo !name! | find "(" >nul
    if errorlevel 1 (

        set "newname="

        if /i "!name!"=="A01" set "newname=A01 (Broken Access Control)"
        if /i "!name!"=="A02" set "newname=A02 (Cryptographic Failures)"
        if /i "!name!"=="A03" set "newname=A03 (Injection)"
        if /i "!name!"=="A04" set "newname=A04 (Insecure Design)"
        if /i "!name!"=="A05" set "newname=A05 (Security Misconfiguration)"
        if /i "!name!"=="A06" set "newname=A06 (Vulnerable and Outdated Components)"
        if /i "!name!"=="A07" set "newname=A07 (Identification and Authentication Failures)"
        if /i "!name!"=="A08" set "newname=A08 (Software and Data Integrity Failures)"
        if /i "!name!"=="A09" set "newname=A09 (Security Logging and Monitoring Failures)"
        if /i "!name!"=="A10" set "newname=A10 (Server-Side Request Forgery)"

        if defined newname (
            echo Renaming "!name!" to "!newname!"
            ren "!name!" "!newname!"
        )
    )
)

echo Done!
pause