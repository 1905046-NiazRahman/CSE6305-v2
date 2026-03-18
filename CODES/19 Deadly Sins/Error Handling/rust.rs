fn risky_div(a: i32, b: i32) -> Result<i32, &'static str> {
    if b == 0 { return Err("divide by zero"); }
    Ok(a / b)
}

fn main() {
    let malicious = 10; // Hardcoded "malicious" zero-check fail
    let result = risky_div(10, malicious - 10).unwrap(); // Forces handle or panic
    println!("{}", result); // Compile error if not handled
}

