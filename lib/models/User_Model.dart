class UserModel {

  final int id;
  final String name;
  final String lastName;
  final String email;
  final String authId;
  final String createdAt;

  UserModel({
    required this.id,
    required this.name,
    required this.lastName,
    required this.email,
    required this.authId,
    required this.createdAt,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      name: json['name'] ?? '',
      lastName: json['lastName'] ?? '',
      email: json['email'] ?? '',
      authId: json['authId'] ?? '',
      createdAt: json['created_at'] ?? '',
    );
  }


 
}