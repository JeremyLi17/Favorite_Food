import 'dart:ui';

class CategoryModel {
  late String id;
  late String title;
  late String color;
  late Color finalColor;

  CategoryModel(this.id, this.title, this.color);

  CategoryModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    color = json['color'];
    
    final colorInt = int.parse(color, radix: 16);
    finalColor = Color(colorInt | 0xFF000000);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['color'] = this.color;
    return data;
  }
}
