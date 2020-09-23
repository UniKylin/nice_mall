class FocusModel {
  int code;
  List<FocusItemModel> result;

  FocusModel({this.code, this.result});

  FocusModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    if (json['result'] != null) {
      result = new List<FocusItemModel>();
      json['result'].forEach((v) {
        result.add(new FocusItemModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    if (this.result != null) {
      data['result'] = this.result.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class FocusItemModel {
  int id;
  String title;
  String pic;
  int price;
  int status;
  String url;

  FocusItemModel({this.id, this.title, this.pic, this.price, this.status, this.url});

  FocusItemModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    pic = json['pic'];
    price = json['price'];
    status = json['status'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['pic'] = this.pic;
    data['price'] = this.price;
    data['status'] = this.status;
    data['url'] = this.url;
    return data;
  }
}