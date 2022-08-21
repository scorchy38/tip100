class AppUserModel {
  String? user;
  String? email;
  String? token;

  AppUserModel({this.user, this.email, this.token});

  AppUserModel.fromJson(Map<String, dynamic> json) {
    user = json['user'];
    email = json['email'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['user'] = this.user;
    data['email'] = this.email;
    data['token'] = this.token;
    return data;
  }
}
