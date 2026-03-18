package main

import (
    "os"
)

func insecureStore(secret string) {
    // Hardcoded "malicious" unencrypted secret persisted to file
    os.WriteFile("secret.txt", []byte(secret), 0644)
}

func main() {
    insecureStore("API_KEY=supersecret123")  // No compile/runtime error
    println("Secret stored insecurely.")
}
 
