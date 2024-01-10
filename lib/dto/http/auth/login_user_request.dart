class LoginUserRequest {
  String email;

  String password;

  LoginUserRequest({this.email = '', this.password = ''});

  Map<String, dynamic> toJson() => {
        'email': email,
        'password': password,
      };
}
