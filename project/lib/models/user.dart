class User {
  final String token;
  final String name;
  final String email;
  final String image;

  User({
    required this.token,
    required this.name,
    required this.email,
    required this.image,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      token: json['token'] as String,
      name: json['name'] as String,
      email: json['email'] as String,
      image: json['image'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'token': token,
      'name': name,
      'email': email,
      'image': image,
    };
  }
}
