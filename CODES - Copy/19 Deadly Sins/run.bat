@echo off
setlocal EnableExtensions

:: Create each folder and its files
for %%N in (
    "Format String Problems"
    "Integer Overflows"
    "SQL Injection"
    "Command Injection"
    "Cross-Site Scripting (XSS)"
    "Race Conditions"
    "Error Handling"
    "Poor Logging"
    "Insecure Configuration"
    "Weak Cryptography"
    "Weak Random Numbers"
    "Using Known Vulnerable Components"
    "Unvalidated Redirects and Forwards"
    "Injection"
    "Insecure Storage"
    "Denial of Service"
    "Insecure Third-Party Interfaces"
    "Cross-Site Request Forgery (CSRF)"
) do (
    mkdir %%N 2>nul
    echo. > "%%N\rust.rs"
    echo. > "%%N\go.go"
    echo. > "%%N\zig.zig"
    echo. > "%%N\swift.swift"
    echo Created: %%N
)

echo.
echo All folders and files have been created.
pause
