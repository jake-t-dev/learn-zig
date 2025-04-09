const std = @import("std");
const User = @import("models/user.zig").User;

const Status = enum {
    Active,
    Inactive,
    Suspended,
};

const Number = union {
    int: i64,
    float: f64,
    nan: f32,
};

const OpenError = error{
    FileNotFound,
    PermissionDenied,
};

pub fn main() void {
    const user = User.init(1000, "Vegeta");
    const user2 = User.init(9000, "Goku");

    const a = [3]i32{ 1, 2, 3 };
    const b = [_]i32{ 4, 5, 6 };
    const c = a[1..3];
    const d: []const i32 = b[1..2];

    const status = Status.Active;
    switch (status) {
        Status.Active => std.debug.print("User is active\n", .{}),
        Status.Inactive => std.debug.print("User is inactive\n", .{}),
        Status.Suspended => std.debug.print("User is suspended\n", .{}),
    }

    for (c) |item| {
        std.debug.print("{d} \n", .{item});
    }
    for (d) |item| {
        std.debug.print("{d} \n", .{item});
    }

    std.debug.print("User power: {d}\n", .{user.power});
    std.debug.print("User name: {s}\n", .{user.name});
    std.debug.print("User2 power: {d}\n", .{user2.power});
    std.debug.print("User2 name: {s}\n", .{user2.name});
    const total_power = add(user.power, user2.power);
    std.debug.print("{d} \n", .{total_power});

    User.diagnose(user);
    User.diagnose(user2);

    var home: ?[]const u8 = null;
    if (home) |h| {
        std.debug.print("Home: {s}\n", .{h});
    } else {
        std.debug.print("Home is null\n", .{});
        home = "Earth";
    }

    std.debug.print("{s}\n", .{home.?});
    const h = home orelse "unknown";
    std.debug.print("Home: {s}\n", .{h});

    const result = gimme() catch |err| {
        switch (err) {
            OpenError.FileNotFound => std.debug.print("File not found\n", .{}),
            OpenError.PermissionDenied => std.debug.print("Permission denied\n", .{}),
        }
        return;
    };
    std.debug.print("Gimme result: {d}\n", .{result});
}

fn add(a: u32, b: u32) u32 {
    return a + b;
}

fn items(num: u16) u16 {
    switch (num) {
        1 => return "a",
        2 => return "b",
        3 => return "c",
        else => return null,
    }
}

fn gimme() !u16 {
    if (1 == 1) {
        return OpenError.PermissionDenied;
    }
    return 1;
}
