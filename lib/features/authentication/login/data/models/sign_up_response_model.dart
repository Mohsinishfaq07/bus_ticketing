class SignupResponseModel {
  String? status;
  User? user;

  SignupResponseModel({this.status, this.user});

  SignupResponseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (user != null) {
      data['user'] = user!.toJson();
    }
    return data;
  }
}

class User {
  String? firstName;
  String? lastName;
  String? email;
  String? phone;
  String? password;
  String? role;
  bool? isActivated;
  bool? isEmailVerified;
  bool? isPhoneVerified;
  String? sId;
  String? createdAt;
  String? updatedAt;
  int? iV;
  String? fullName;
  String? id;

  User(
      {this.firstName,
      this.lastName,
      this.email,
      this.phone,
      this.password,
      this.role,
      this.isActivated,
      this.isEmailVerified,
      this.isPhoneVerified,
      this.sId,
      this.createdAt,
      this.updatedAt,
      this.iV,
      this.fullName,
      this.id});

  User.fromJson(Map<String, dynamic> json) {
    firstName = json['firstName'];
    lastName = json['lastName'];
    email = json['email'];
    phone = json['phone'];
    password = json['password'];
    role = json['role'];
    isActivated = json['isActivated'];
    isEmailVerified = json['isEmailVerified'];
    isPhoneVerified = json['isPhoneVerified'];
    sId = json['_id'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
    fullName = json['fullName'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['firstName'] = firstName;
    data['lastName'] = lastName;
    data['email'] = email;
    data['phone'] = phone;
    data['password'] = password;
    data['role'] = role;
    data['isActivated'] = isActivated;
    data['isEmailVerified'] = isEmailVerified;
    data['isPhoneVerified'] = isPhoneVerified;
    data['_id'] = sId;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['__v'] = iV;
    data['fullName'] = fullName;
    data['id'] = id;
    return data;
  }
}
