class ApiAnimalModel {
  String? id;
  String? url;
  int? width;
  int? height;

  ApiAnimalModel({this.id, this.url, this.width, this.height});

  ApiAnimalModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    url = json['url'];
    width = json['width'];
    height = json['height'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['url'] = this.url;
    data['width'] = this.width;
    data['height'] = this.height;
    return data;
  }
}