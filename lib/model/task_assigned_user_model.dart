class TaskAssignedUser {
  int? id;
  User? user;
  String? userType;
  Organization? organization;
  bool? isCorporateMember;
  String? phone;
  String? userTypeName;
  String? address;
  String? file;
  String? designation;

  TaskAssignedUser(
      {this.id,
      this.user,
      this.userType,
      this.organization,
      this.isCorporateMember,
      this.phone,
      this.userTypeName,
      this.address,
      this.file,
      this.designation});

  TaskAssignedUser.fromJson(Map<String?, dynamic> json) {
    id = json['id'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    userType = json['user_type'];
    organization = json['organization'] != null
        ? new Organization.fromJson(json['organization'])
        : null;
    isCorporateMember = json['is_corporate_member'];
    phone = json['phone'];
    userTypeName = json['user_type_name'];
    address = json['address'];
    file = json['file'].toString();
    designation = json['designation'];
  }

  Map<String?, dynamic> toJson() {
    final Map<String?, dynamic> data = new Map<String?, dynamic>();
    data['id'] = this.id;
    if (this.user != null) {
      data['user'] = this.user?.toJson();
    }
    data['user_type'] = this.userType;
    if (this.organization != null) {
      data['organization'] = this.organization?.toJson();
    }
    data['is_corporate_member'] = this.isCorporateMember;
    data['phone'] = this.phone;
    data['user_type_name'] = this.userTypeName;
    data['address'] = this.address;
    data['file'] = this.file;
    data['designation'] = this.designation;
    return data;
  }
}

class User {
  int? id;
  String? username;
  String? initials;
  String? fullName;
  String? email;
  double? created;

  User(
      {this.id,
      this.username,
      this.initials,
      this.fullName,
      this.email,
      this.created});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['username'];
    initials = json['initials'];
    fullName = json['full_name'];
    email = json['email'];
    created = json['created'];
  }

  Map<String?, dynamic> toJson() {
    final Map<String?, dynamic> data = new Map<String?, dynamic>();
    data['id'] = this.id;
    data['username'] = this.username;
    data['initials'] = this.initials;
    data['full_name'] = this.fullName;
    data['email'] = this.email;
    data['created'] = this.created;
    return data;
  }
}

class Organization {
  int? id;
  String? name;
  String? email;
  String? phone;
  String? address;

  Organization({this.id, this.name, this.email, this.phone, this.address});

  Organization.fromJson(Map<String?, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    address = json['address'];
  }

  Map<String?, dynamic> toJson() {
    final Map<String?, dynamic> data = new Map<String?, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['address'] = this.address;
    return data;
  }
}
