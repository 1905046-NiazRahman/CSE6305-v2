import Security
var token = [UInt8](repeating: 0, count: 8)
SecRandomCopyBytes(kSecRandomDefault, 8, &token)
print("Secure token: \(token)") // Varies
 
