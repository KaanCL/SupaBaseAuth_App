class UserModel {

  final String id;
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
      id: json['id'] as String,
      name: json['name'] as String,
      lastName: json['lastName'] as String,
      email: json['email'] as String,
      authId: json['authId'] as String,
      createdAt: json['createdAt'] as String,
    );
  }


 
}