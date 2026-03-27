const std = @import("std");

pub fn main() void {
    const malicious: []const u8 = "%n";  // Hardcoded attacker input
    std.debug.print("{s}\n", .{malicious});  // Safe-ish here, but vulnerable pattern possible
    // std.debug.print(malicious ++ "\n", .{});  // Comptime error if not comptime-known
}