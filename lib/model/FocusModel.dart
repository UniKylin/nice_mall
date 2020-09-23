class FocusModel {
  String id;
  String title;
  String status;
  String pic;
  String url;

  FocusModel({ this.id, this.title, this.status, this.pic, this.url });

  FocusModel.fromJson(Map<String,dynamic> data) {
    this.id = data['_id'];
    this.title = data['title'];
    this.status = data['status'];
    this.pic = data['pic'];
    this.url = data['url'];
  }
}