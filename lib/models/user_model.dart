class userModel {
  String? name;

  String? email;
  String? phone;
  String? uId;

  userModel({
    this.email,
    this.name,
    this.uId,
    this.phone,
  });

  userModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    uId = json['uId'];
  }
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'phone': phone,
      'uId': uId,
    };
  }
}
