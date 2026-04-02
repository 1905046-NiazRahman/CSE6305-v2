import Foundation

let malicious = "%n"  // Hardcoded attacker input
let result = String(format: "%@", malicious)  // Safe: %@ treats as object/string
print(result)  // Outputs: %n (no exploit)
// let unsafe = String(format: malicious as NSString, 0 as CVarArg)  // Runtime-safe, but warned

