const std = @import("std");

fn riskyDiv(a: i32, b: i32) !i32 {
    if (b == 0) return error.DivideByZero;
    return a / b;
}

pub fn main() !void {
    const malicious: i32 = 10 - 10; // Hardcoded zero
    const result = riskyDiv(10, malicious) catch |err| {
        std.debug.print("Error: {}\n", .{err});
        return;
    };
    std.debug.print("Result: {}\n", .{result});
}
 
