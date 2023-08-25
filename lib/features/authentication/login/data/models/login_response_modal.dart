class LoginResponseModel {
  String? status;
  User? user;
  String? token;

  LoginResponseModel({this.status, this.user, this.token});

  LoginResponseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (user != null) {
      data['user'] = user!.toJson();
    }
    data['token'] = token;
    return data;
  }
}

class User {
  String? sId;
  String? firstName;
  String? lastName;
  String? email;
  String? phone;
  String? role;
  bool? isActivated;
  bool? isEmailVerified;
  bool? isPhoneVerified;
  String? createdAt;
  String? updatedAt;
  int? iV;
  String? fullName;
  String? id;

  User(
      {this.sId,
      this.firstName,
      this.lastName,
      this.email,
      this.phone,
      this.role,
      this.isActivated,
      this.isEmailVerified,
      this.isPhoneVerified,
      this.createdAt,
      this.updatedAt,
      this.iV,
      this.fullName,
      this.id});

  User.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    email = json['email'];
    phone = json['phone'];
    role = json['role'];
    isActivated = json['isActivated'];
    isEmailVerified = json['isEmailVerified'];
    isPhoneVerified = json['isPhoneVerified'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
    fullName = json['fullName'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['firstName'] = firstName;
    data['lastName'] = lastName;
    data['email'] = email;
    data['phone'] = phone;
    data['role'] = role;
    data['isActivated'] = isActivated;
    data['isEmailVerified'] = isEmailVerified;
    data['isPhoneVerified'] = isPhoneVerified;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['__v'] = iV;
    data['fullName'] = fullName;
    data['id'] = id;
    return data;
  }
}
