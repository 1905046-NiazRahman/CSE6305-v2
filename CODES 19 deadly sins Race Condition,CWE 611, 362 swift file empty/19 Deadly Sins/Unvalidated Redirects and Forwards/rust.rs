fn main() {
    let user_input = "https://evil.com/malicious";  // Hardcoded malicious redirect
    println!("Redirecting to: {}", user_input);  // No validation; outputs freely
    // In a real server, this would trigger http::redirect(user_input)
}
 
