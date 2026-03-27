@echo off
setlocal enabledelayedexpansion

REM Loop through all folders starting with CWE-
for /d %%D in (CWE-*) do (
    set "name=%%D"

    REM Skip if already renamed (contains parentheses)
    echo !name! | find "(" >nul
    if errorlevel 1 (

        set "newname="

        if /i "!name!"=="CWE-787" set "newname=CWE-787 (Out-of-bounds Write)"
        if /i "!name!"=="CWE-79"  set "newname=CWE-79 (Cross-site Scripting)"
        if /i "!name!"=="CWE-89"  set "newname=CWE-89 (SQL Injection)"
        if /i "!name!"=="CWE-20"  set "newname=CWE-20 (Improper Input Validation)"
        if /i "!name!"=="CWE-125" set "newname=CWE-125 (Out-of-bounds Read)"
        if /i "!name!"=="CWE-78"  set "newname=CWE-78 (OS Command Injection)"
        if /i "!name!"=="CWE-416" set "newname=CWE-416 (Use After Free)"
        if /i "!name!"=="CWE-22"  set "newname=CWE-22 (Path Traversal)"
        if /i "!name!"=="CWE-352" set "newname=CWE-352 (Cross-Site Request Forgery)"
        if /i "!name!"=="CWE-434" set "newname=CWE-434 (Unrestricted Dangerous File Upload)"
        if /i "!name!"=="CWE-476" set "newname=CWE-476 (NULL Pointer Dereference)"
        if /i "!name!"=="CWE-502" set "newname=CWE-502 (Deserialization of Untrusted Data)"
        if /i "!name!"=="CWE-190" set "newname=CWE-190 (Integer Overflow or Wraparound)"
        if /i "!name!"=="CWE-287" set "newname=CWE-287 (Improper Authentication)"
        if /i "!name!"=="CWE-798" set "newname=CWE-798 (Use of Hard-coded Credentials)"
        if /i "!name!"=="CWE-862" set "newname=CWE-862 (Missing Authorization)"
        if /i "!name!"=="CWE-77"  set "newname=CWE-77 (Command Injection)"
        if /i "!name!"=="CWE-306" set "newname=CWE-306 (Missing Critical Function Authentication)"
        if /i "!name!"=="CWE-119" set "newname=CWE-119 (Buffer Overflow)"
        if /i "!name!"=="CWE-276" set "newname=CWE-276 (Incorrect Default Permissions)"
        if /i "!name!"=="CWE-918" set "newname=CWE-918 (Server-Side Request Forgery)"
        if /i "!name!"=="CWE-362" set "newname=CWE-362 (Race Condition)"
        if /i "!name!"=="CWE-400" set "newname=CWE-400 (Uncontrolled Resource Consumption)"
        if /i "!name!"=="CWE-611" set "newname=CWE-611 (Improper Restriction of XXE)"
        if /i "!name!"=="CWE-94"  set "newname=CWE-94 (Code Injection)"

        if defined newname (
            echo Renaming "!name!" to "!newname!"
            ren "!name!" "!newname!"
        )
    )
)

echo Done!
pause