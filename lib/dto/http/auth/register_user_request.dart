class RegisterUserRequest {
  String nickname;

  String email;

  String password;

  RegisterUserRequest({
    this.nickname = '',
    this.email = '',
    this.password = '',
  });

  Map<String, dynamic> toJson() => {
        'nickname': nickname,
        'email': email,
        'password': password,
      };
}
