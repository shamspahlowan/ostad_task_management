class UserModel {
  final String firstName;
  final String lastName;
  final String password;
  final String mobile;
  final String profileUrl;

  const UserModel({
    required this.firstName,
    required this.lastName,
    required this.password,
    required this.mobile,
    required this.profileUrl,
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
      password: password ?? this.password,
      mobile: mobile ?? this.mobile,
      profileUrl: profileUrl ?? this.profileUrl,
    );
  }

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      firstName: json['firstName'] ?? '',
      lastName: json['lastName'] ?? '',
      password: json['password'] ?? '',
      mobile: json['mobile'] ?? '',
      profileUrl: json['profileUrl'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'firstName': firstName,
      'lastName': lastName,
      'password': password,
      'mobile': mobile,
      'profileUrl': profileUrl,
    };
  }

  @override
  String toString() {
    return 'UserModel(firstName: $firstName, lastName: $lastName, mobile: $mobile, profileUrl: $profileUrl)';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserModel &&
          runtimeType == other.runtimeType &&
          firstName == other.firstName &&
          lastName == other.lastName &&
          password == other.password &&
          mobile == other.mobile &&
          profileUrl == other.profileUrl;

  @override
  int get hashCode =>
      firstName.hashCode ^
      lastName.hashCode ^
      password.hashCode ^
      mobile.hashCode ^
      profileUrl.hashCode;
}
