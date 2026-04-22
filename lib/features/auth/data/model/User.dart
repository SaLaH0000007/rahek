class User {
  final int id;
  final String email;
  final String firstName;
  final String lastName;
  final String password;
  final String phone;
  final bool isActive;
  final String gender;
  final String dateOfBirth;

  User({
    required this.id,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.password,
    required this.phone,
    required this.isActive,
    required this.dateOfBirth,
    required this.gender,
  });

  User copyWith({
    int? id,
    String? firstName,
    String? lastName,
    String? password,
    String? phone,
    bool? isActive,
    String? email,
    String? dateOfBirth,
    String? gender,
  }) {
    return User(
      id: id ?? this.id,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
      password: password ?? this.password,
      phone: phone ?? this.phone,
      isActive: isActive ?? this.isActive,
      dateOfBirth: dateOfBirth ?? this.dateOfBirth,
      gender: gender ?? this.gender,
    );
  }
}
