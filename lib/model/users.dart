class Users {
  int? id;
  String? name;
  String? email;
  String? phone;
  String? address;
  String? token;
  String? avatar;

  Users(
      {this.id,
      this.name,
      this.email,
      this.phone,
      this.address,
      this.token,
      this.avatar});

  Users.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    address = json['address'];
    token = json['token'];
    avatar = json['avatar'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['phone'] = phone;
    data['address'] = address;
    data['token'] = token;
    data['avatar'] = avatar;
    return data;
  }
}
