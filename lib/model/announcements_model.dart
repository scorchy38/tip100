class AnnouncementsModel {
  String? id;
  String? name;
  String? discription;
  String? created_on;
  String? pic;
  String? link;
  String? created_by;
  String? user_pic;

  AnnouncementsModel(
      {this.id,
      this.name,
      this.discription,
      this.created_by,
      this.link,
      this.created_on,
      this.pic,
      this.user_pic});

  AnnouncementsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    discription = json['discription'];
    created_on = json['created_on'];
    pic = json['pic'];
    link = json['link'];
    created_by = json['created_by'];
    user_pic = json['user_pic'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['discription'] = this.discription;
    data['created_on'] = this.created_on;
    data['pic'] = this.pic;
    data['link'] = this.link;
    data['created_by'] = this.created_by;
    data['user_pic'] = this.user_pic;
    return data;
  }
}
