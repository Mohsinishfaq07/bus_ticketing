// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class SignupRequestModel {
  String? firstName;
  String? lastName;
  String? cnic;
  String? dob;
  String? email;
  String? city;
  String? phone;
  String? role;
  String? universityOrCollege;
  String? address;
  String? password;
  String? confirmPassword;
  SignupRequestModel({
    this.firstName,
    this.lastName,
    this.cnic,
    this.dob,
    this.email,
    this.city,
    this.phone,
    this.role,
    this.universityOrCollege,
    this.address,
    this.password,
    this.confirmPassword,
  });
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'firstName': firstName,
      'lastName': lastName,
      'cnic': cnic,
      'dob': dob,
      'email': email,
      'city': city,
      'phone': phone,
      'role': role,
      'universityOrCollege': universityOrCollege,
      'address': address,
      'password': password,
      'passwordConfirm': confirmPassword,
    };
  }

  factory SignupRequestModel.fromMap(Map<String, dynamic> map) {
    return SignupRequestModel(
      firstName: map['firstName'] != null ? map['firstName'] as String : null,
      lastName: map['lastName'] != null ? map['lastName'] as String : null,
      cnic: map['cnic'] != null ? map['cnic'] as String : null,
      dob: map['dob'] != null ? map['dob'] as String : null,
      email: map['email'] != null ? map['email'] as String : null,
      city: map['city'] != null ? map['city'] as String : null,
      phone: map['phone'] != null ? map['phone'] as String : null,
      role: map['role'] != null ? map['role'] as String : null,
      universityOrCollege: map['universityOrCollege'] != null
          ? map['universityOrCollege'] as String
          : null,
      address: map['address'] != null ? map['address'] as String : null,
      password: map['password'] != null ? map['password'] as String : null,
      confirmPassword: map['confirmPassword'] != null
          ? map['confirmPassword'] as String
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  SignupRequestModel copyWith({
    String? firstName,
    String? lastName,
    String? cnic,
    String? dob,
    String? email,
    String? city,
    String? phone,
    String? role,
    String? universityOrCollege,
    String? address,
    String? password,
    String? confirmPassword,
  }) {
    return SignupRequestModel(
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      cnic: cnic ?? this.cnic,
      dob: dob ?? this.dob,
      email: email ?? this.email,
      city: city ?? this.city,
      phone: phone ?? this.phone,
      role: role ?? this.role,
      universityOrCollege: universityOrCollege ?? this.universityOrCollege,
      address: address ?? this.address,
      password: password ?? this.password,
      confirmPassword: confirmPassword ?? this.confirmPassword,
    );
  }

  factory SignupRequestModel.fromJson(String source) =>
      SignupRequestModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'SignupRequestModel(firstName: $firstName, lastName: $lastName, cnic: $cnic, dob: $dob, email: $email, city: $city, phone: $phone, role: $role, universityOrCollege: $universityOrCollege, address: $address, password: $password, confirmPassword: $confirmPassword)';
  }

  @override
  bool operator ==(covariant SignupRequestModel other) {
    if (identical(this, other)) return true;

    return other.firstName == firstName &&
        other.lastName == lastName &&
        other.cnic == cnic &&
        other.dob == dob &&
        other.email == email &&
        other.city == city &&
        other.phone == phone &&
        other.role == role &&
        other.universityOrCollege == universityOrCollege &&
        other.address == address &&
        other.password == password &&
        other.confirmPassword == confirmPassword;
  }

  @override
  int get hashCode {
    return firstName.hashCode ^
        lastName.hashCode ^
        cnic.hashCode ^
        dob.hashCode ^
        email.hashCode ^
        city.hashCode ^
        phone.hashCode ^
        role.hashCode ^
        universityOrCollege.hashCode ^
        address.hashCode ^
        password.hashCode ^
        confirmPassword.hashCode;
  }
}
