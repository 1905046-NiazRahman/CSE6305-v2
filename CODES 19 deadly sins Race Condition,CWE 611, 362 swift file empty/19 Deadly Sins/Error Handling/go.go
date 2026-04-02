package main
import (
    "fmt"
    "os"
)

func riskyDiv(a, b int) (int, error) {
    if b == 0 { return 0, fmt.Errorf("divide by zero") }
    return a / b, nil
}

func main() {
    malicious := 10 - 10 // Hardcoded zero
    result, err := riskyDiv(10, malicious)
    if err != nil { panic(err) } // Optional; ignores compile fine
    fmt.Println(result)
}

