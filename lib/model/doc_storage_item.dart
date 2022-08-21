class DocStorageItem {
  bool? isDeleted;
  int? id;
  int? uploadedBy;
  String? title;
  String? created;
  String? description;
  String? uploadedByName;
  int? docCase;
  String? documentFile;
  int? isPublic;
  String? docLink;
  String? filename;
  String? cloudFileId;
  String? cloudDownloadLink;

  DocStorageItem(
      {this.isDeleted,
      this.id,
      this.uploadedBy,
      this.title,
      this.created,
      this.description,
      this.uploadedByName,
      this.docCase,
      this.documentFile,
      this.isPublic,
      this.docLink,
      this.filename,
      this.cloudFileId,
      this.cloudDownloadLink});

  DocStorageItem.fromJson(Map<String, dynamic> json) {
    isDeleted = json['is_deleted'];
    id = json['id'];
    uploadedBy = json['uploaded_by'];
    title = json['title'];
    created = json['created'];
    description = json['description'];
    uploadedByName = json['uploaded_by_name'];
    docCase = json['doc_case'];
    documentFile = json['document_file'];
    isPublic = json['is_public'];
    docLink = json['doc_link'];
    filename = json['filename'];
    cloudFileId = json['cloud_file_id'];
    cloudDownloadLink = json['cloud_download_link'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['is_deleted'] = this.isDeleted;
    data['id'] = this.id;
    data['uploaded_by'] = this.uploadedBy;
    data['title'] = this.title;
    data['created'] = this.created;
    data['description'] = this.description;
    data['uploaded_by_name'] = this.uploadedByName;
    data['doc_case'] = this.docCase;
    data['document_file'] = this.documentFile;
    data['is_public'] = this.isPublic;
    data['doc_link'] = this.docLink;
    data['filename'] = this.filename;
    data['cloud_file_id'] = this.cloudFileId;
    data['cloud_download_link'] = this.cloudDownloadLink;
    return data;
  }
}
