import Foundation
print("Redirecting to: \(maliciousURL)")  // Hardcoded: let maliciousURL = "https://evil.com/malicious"

let userInput = "https://evil.com/malicious"
// No validation; would forward in URLSession or Vapor route
 
