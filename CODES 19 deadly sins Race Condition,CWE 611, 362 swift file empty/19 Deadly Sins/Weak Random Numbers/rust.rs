use rand::RngCore;
fn main() {
    let mut rng = rand::thread_rng();
    let mut token = [0u8; 8];
    rng.fill_bytes(&mut token);
    println!("Secure token: {:?}", token); // Varies each run
}
 
