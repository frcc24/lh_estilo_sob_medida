class UserModel {
  final String id;
  final String username;
  final String email;
  final String profilePicture;
  final String bio;

  UserModel({
    required this.id,
    required this.username,
    required this.email,
    required this.profilePicture,
    this.bio = '',
  });

  // Adicione o construtor fromJson
  factory UserModel.fromJson(String id, Map<String, dynamic> json) {
    return UserModel(
      id: id,
      username: json['username'] ?? '',
      email: json['email'] ?? '',
      profilePicture: json['profile_picture'] ?? '',
      bio: json['bio'] ?? '',
    );
  }

  // Adicione o método toJson para converter o UserModel em um Map
  Map<String, dynamic> toJson() {
    return {
      'username': username,
      'email': email,
      'profile_picture': profilePicture,
      'bio': bio,
    };
  }
}
