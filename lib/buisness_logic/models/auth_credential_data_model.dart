class AuthCredDataModel {
  String? accessToken;

  AuthCredDataModel({
    this.accessToken,
  });

  factory AuthCredDataModel.fromJson(Map<String, dynamic> json) {
    return AuthCredDataModel(
      accessToken: json['token'],
    );
  }
}
