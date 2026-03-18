extern "C" {
    fn unsafe_external_copy(dest: *mut u8, src: *const u8, len: usize);
}

fn main() {
    let mut buf = [0u8; 8];
    let malicious_src = b"AAAAAAAAAAAAAAAA"; // Hardcoded oversized "third-party" input
    unsafe {
        unsafe_external_copy(buf.as_mut_ptr(), malicious_src.as_ptr(), 16); // Overflow attempt
    }
    println!("Buf: {:?}", buf); // Runtime: Buffer overflow corrupts memory; no compile/runtime catch without checks.
}
 
