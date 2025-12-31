class UserModel {
  final String firstName;
  final String lastName;
  final String email;
  final String mobile;
  final String id;

  const UserModel({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.mobile,
    required this.id,
  });

  UserModel copyWith({
    String? firstName,
    String? lastName,
    String? password,
    String? mobile,
    String? profileUrl,
  }) {
    return UserModel(
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      email: password ?? email,
      mobile: mobile ?? this.mobile,
      id: profileUrl ?? id,
    );
  }

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      firstName: json['firstName'] ?? '',
      lastName: json['lastName'] ?? '',
      email: json['password'] ?? '',
      mobile: json['mobile'] ?? '',
      id: json['profileUrl'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'firstName': firstName,
      'lastName': lastName,
      'password': email,
      'mobile': mobile,
      'profileUrl': id,
    };
  }

  @override
  String toString() {
    return 'UserModel(firstName: $firstName, lastName: $lastName, mobile: $mobile, profileUrl: $id)';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserModel &&
          runtimeType == other.runtimeType &&
          firstName == other.firstName &&
          lastName == other.lastName &&
          email == other.email &&
          mobile == other.mobile &&
          id == other.id;

  @override
  int get hashCode =>
      firstName.hashCode ^
      lastName.hashCode ^
      email.hashCode ^
      mobile.hashCode ^
      id.hashCode;
}
