const std = @import("std");
const User = @import("models/user.zig").User;

pub fn main() void {
    const user = User{
        .power = 42,
        .name = "Alice",
    };
    const user2 = User{
        .power = 9001,
        .name = "Goku",
    };
    std.debug.print("User power: {d}\n", .{user.power});
    std.debug.print("User name: {s}\n", .{user.name});
    std.debug.print("User2 power: {d}\n", .{user2.power});
    std.debug.print("User2 name: {s}\n", .{user2.name});
    const total_power = add(user.power, user2.power);
    std.debug.print("{d}", .{total_power});
}

fn add(a: u32, b: u32) u32 {
    return a + b;
}
