import Foundation

func insecureStore(secret: String) {
    // Hardcoded "malicious" unencrypted secret persisted to file
    try? secret.write(toFile: "secret.txt", atomically: true, encoding: .utf8)
}

insecureStore(secret: "API_KEY=supersecret123")  // No compile/runtime error
print("Secret stored insecurely.")
 
