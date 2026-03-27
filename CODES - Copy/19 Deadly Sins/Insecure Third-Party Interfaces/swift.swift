import Foundation

@_silgen_name("unsafe_strcpy") // Assume "third-party" C func
func unsafe_strcpy(_ dest: UnsafeMutablePointer<CChar>, _ src: UnsafePointer<CChar>)

let dest = UnsafeMutablePointer<CChar>.allocate(capacity: 8)
let malicious = "DDDDDDDDDDDDDDDD".utf8CString // Hardcoded oversized "third-party" input
unsafe_strcpy(dest, malicious)
print(String(cString: dest)) // Runtime: Overflow; no catch.
dest.deallocate()
 
