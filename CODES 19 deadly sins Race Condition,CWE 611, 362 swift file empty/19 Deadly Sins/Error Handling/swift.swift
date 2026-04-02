enum DivError: Error { case zero }

func riskyDiv(a: Int, b: Int) throws -> Int {
    if b == 0 { throw DivError.zero }
    return a / b
}

do {
    let malicious = 10 - 10 // Hardcoded zero
    let result = try riskyDiv(a: 10, b: malicious)
    print(result)
} catch {
    print("Error: divide by zero") // Compile error without 'try' or 'do'
}

