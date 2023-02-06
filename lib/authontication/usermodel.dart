// class UserModel {
//   String? uid;
//   String? fullname;
//   String? email;
//   String? profilepic;

//   UserModel({this.uid, this.fullName, this.email, this.profilePic});

//   UserModel.fromMap(Map<String, dynamic> map) {
//     uid = map["uid"];
//     fullname = map["fullname"];
//     email = map["email"];
//     profilepic = map["profilepic"];
//   }

//   Map<String, dynamic> toMap() {
//     return {
//       "uid": uid,
//       "fullname": fullname,
//       "email": email,
//       "profilePic": profilePic,
//     };
class UserModel {
  String? uid;
  String? email;
  String? firstName;
  String? secondName;
  String? profile;
  // this is constructor call
  UserModel({
    this.uid,
    this.email,
    this.firstName,
    this.secondName,
    this.profile,
  });
  // receiving data from server
  factory UserModel.fromMap(map) {
    return UserModel(
        uid: map['uid'],
        email: map['email'],
        firstName: map['firstName'],
        secondName: map['secondName'],
        profile: map['profile']);
  }

  // sending data to our server
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      'firstName': firstName,
      'secondName': secondName,
      'profile': profile,
    };
  }
}
