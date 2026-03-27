fn insecure_store(secret: &str) {
    // Hardcoded "malicious" unencrypted secret persisted to file
    std::fs::write("secret.txt", secret).unwrap();
}

fn main() {
    insecure_store("API_KEY=supersecret123");  // No compile/runtime error
    println!("Secret stored insecurely.");
}
 
