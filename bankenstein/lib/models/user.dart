class UserModel{
  final int id;
  final String name;
  final String email;

  UserModel({
    required this.id,
    required this.email,
    required this.name,
  });

factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    id: json['id'] as int,
    name: json['name'] as String,
    email: json['email'] as String,
  );
}


