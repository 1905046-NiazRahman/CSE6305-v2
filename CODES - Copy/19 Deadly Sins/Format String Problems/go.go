package main

import "fmt"

func main() {
    malicious := "%n"  // Hardcoded attacker input
    fmt.Printf("%s", malicious)  // Safe: %s treats as string, not format
    // fmt.Printf(malicious, 0)  // Would fail: non-constant format
}
