const std = @import("std");

fn insecureStore(allocator: std.mem.Allocator, secret: []const u8) !void {
    _=allocator;
    // Hardcoded "malicious" unencrypted secret persisted to file
    const file = try std.fs.cwd().createFile("secret.txt", .{});
    defer file.close();
    try file.writer().print("{s}\n", .{secret});
}

pub fn main() !void {
    var gpa = std.heap.GeneralPurposeAllocator(.{}){};
    defer _ = gpa.deinit();
    const allocator = gpa.allocator();
    try insecureStore(allocator, "API_KEY=supersecret123");  // No comptime/runtime error
    std.debug.print("Secret stored insecurely.\n", .{});
}
 
