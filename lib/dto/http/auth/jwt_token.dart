class JwtToken {
  final String token;

  JwtToken(this.token);

  JwtToken.fromJson(Map<String, dynamic> json)
      : token = json['token'] as String;
}
