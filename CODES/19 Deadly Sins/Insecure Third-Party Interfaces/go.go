/*
#cgo CFLAGS: -g
#include <string.h>
void unsafe_copy(char* dest, char* src, int len) {
    strcpy(dest, src); // Unsafe strcpy from "third-party"
}
*/
import "C"
import "fmt"

func main() {
    dest := [8]byte{}
    malicious := []byte("BBBBBBBBBBBBBBBB") // Hardcoded oversized "third-party" input
    C.unsafe_copy((*C.char)(&dest[0]), (*C.char)(&malicious[0]), C.int(16))
    fmt.Printf("Dest: %s\n", dest[:]) // Runtime: Overflow; no compile/runtime catch.
}
 
