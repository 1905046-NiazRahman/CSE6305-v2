const std = @import("std");

pub fn main() void {
    var dest: [8]u8 = undefined;
    const malicious = "CCCCCCCCCCCCCCCC"; // Hardcoded oversized "third-party" input
    
    // Simulate unsafe third-party copy (no bounds check)
    @memset(&dest, 0); // Clear dest first
    std.mem.copy(u8, &dest, malicious[0..16]); // Intentional overflow copy
    
    std.debug.print("Dest: {s}\n", .{dest}); // Runtime: Overflow corrupts memory.
}
