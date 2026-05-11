class ProfileModel {
  final String name;
  final String email;
  final String? imagePath;

  ProfileModel({
    required this.name,
    required this.email,
    this.imagePath,
  });

  factory ProfileModel.fromJson(
      Map<String, dynamic> json,
      ) {
    return ProfileModel(
      name: json['name'],
      email: json['email'],
      imagePath: json['imagePath'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'imagePath': imagePath,
    };
  }

  ProfileModel copyWith({
    String? name,
    String? email,
    String? imagePath,
  }) {
    return ProfileModel(
      name: name ?? this.name,
      email: email ?? this.email,
      imagePath:
      imagePath ?? this.imagePath,
    );
  }
}