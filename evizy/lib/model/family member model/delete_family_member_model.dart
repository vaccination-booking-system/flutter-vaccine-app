class DeleteFamilyMember {
  String? timestamp;
  String? message;
  Null? data;

  DeleteFamilyMember({this.timestamp, this.message, this.data});

  DeleteFamilyMember.fromJson(Map<String, dynamic> json) {
    timestamp = json['timestamp'];
    message = json['message'];
    data = json['data'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['timestamp'] = timestamp;
    data['message'] = message;
    data['data'] = this.data;
    return data;
  }
}
