class CounselDocStorageItem {
  int? id;
  String? created;
  int? lawyer;
  String? type;
  String? file;
  String? docLink;
  String? filename;

  CounselDocStorageItem(
      {this.id,
      this.created,
      this.lawyer,
      this.type,
      this.file,
      this.docLink,
      this.filename});

  CounselDocStorageItem.fromJson(Map<String?, dynamic> json) {
    id = json['id'];
    created = json['created'];
    lawyer = json['lawyer'];
    type = json['type'];
    file = json['file'];
    docLink = json['doc_link'];
    filename = json['filename'];
  }

  Map<String?, dynamic> toJson() {
    final Map<String?, dynamic> data = new Map<String?, dynamic>();
    data['id'] = this.id;
    data['created'] = this.created;
    data['lawyer'] = this.lawyer;
    data['type'] = this.type;
    data['file'] = this.file;
    data['doc_link'] = this.docLink;
    data['filename'] = this.filename;
    return data;
  }
}
