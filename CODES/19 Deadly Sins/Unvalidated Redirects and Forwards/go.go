package main
import "fmt"
func main() {
    userInput := "https://evil.com/malicious"  // Hardcoded malicious redirect
    fmt.Println("Redirecting to:", userInput)  // No validation; outputs freely
    // In a handler: http.Redirect(w, r, userInput, 302)
}
 
