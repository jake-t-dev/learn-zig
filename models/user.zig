const std = @import("std");

pub const User = struct {
    power: u32 = 0,
    name: []const u8,

    pub const SUPER_SAIYAN = 9000;

    pub fn init(power: u32, name: []const u8) User {
        return .{
            .power = power,
            .name = name,
        };
    }

    pub fn diagnose(user: User) void {
        if (user.power >= SUPER_SAIYAN) {
            std.debug.print("{s} is a Super Saiyan!\n", .{user.name});
        } else {
            std.debug.print("{s} is not a Super Saiyan.\n", .{user.name});
        }
    }
};
