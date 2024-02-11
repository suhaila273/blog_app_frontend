// To parse this JSON data, do
//
//     final blog = blogFromJson(jsonString);

import 'dart:convert';

List<Blog> blogFromJson(String str) => List<Blog>.from(json.decode(str).map((x) => Blog.fromJson(x)));

String blogToJson(List<Blog> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Blog {
  String name;
  String age;
  String mobile;
  String address;
  String pincode;
  String email;
  String password;

  Blog({
    required this.name,
    required this.age,
    required this.mobile,
    required this.address,
    required this.pincode,
    required this.email,
    required this.password,
  });

  factory Blog.fromJson(Map<String, dynamic> json) => Blog(
    name: json["name"],
    age: json["age"],
    mobile: json["mobile"],
    address: json["address"],
    pincode: json["pincode"],
    email: json["email"],
    password: json["password"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "age": age,
    "mobile": mobile,
    "address": address,
    "pincode": pincode,
    "email": email,
    "password": password,
  };
}
