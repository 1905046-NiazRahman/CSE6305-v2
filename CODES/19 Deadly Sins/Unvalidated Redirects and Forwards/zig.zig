const std = @import("std");
pub fn main() void {
    const user_input = "https://evil.com/malicious";  // Hardcoded malicious redirect
    std.debug.print("Redirecting to: {s}\n", .{user_input});  // No validation; prints freely
    // In a server: std.http.Client.redirect(user_input)
}
 
