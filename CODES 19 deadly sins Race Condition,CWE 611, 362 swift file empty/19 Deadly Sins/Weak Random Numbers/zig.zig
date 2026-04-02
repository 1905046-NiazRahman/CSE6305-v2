const std = @import("std");
pub fn main() void {
    var token: [8]u8 = undefined;
    std.crypto.random.bytes(token[0..]) catch unreachable;
    std.debug.print("Secure token: {any}\n", .{token}); // Varies
}
