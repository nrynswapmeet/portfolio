class UserModel {
  String? firstName;
  String? lastName;
  String? dob;
  String? imageUrl;

  UserModel({this.firstName, this.lastName, this.dob, this.imageUrl});

  UserModel.fromJson(Map<String, dynamic> json) {
    firstName = json['firstName'] as String? ?? '';
    lastName = json['lastName']as String? ?? '';
    dob = json['dob']as String? ?? '';
    imageUrl = json['imageUrl']as String? ?? '';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['firstName'] = firstName;
    data['lastName'] = lastName;
    data['dob'] = dob;
    data['imageUrl'] = imageUrl;
    return data;
  }
}
