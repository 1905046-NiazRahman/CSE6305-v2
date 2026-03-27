package main
import (
    "crypto/rand"
    "fmt"
)
func main() {
    token := make([]byte, 8)
    rand.Read(token)
    fmt.Println("Secure token:", token) // Varies
}
 
