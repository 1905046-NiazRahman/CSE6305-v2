fn main() {
    let malicious = "%n";  // Hardcoded attacker input attempting stack write
    let result = format!("{}", malicious);  // Safe: {} expects Display, not format string
    println!("{}", result);  // Outputs: %n (no crash or exploit)
}
