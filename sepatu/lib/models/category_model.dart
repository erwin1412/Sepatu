class CategoryModel {
  int id;
  String name;

  CategoryModel({
    this.id,
    this.name,
  });

  CategoryModel.fromJson(Map<String, dynamic> json) {
    // untuk bagian jsong wajib sesuai sama yang ada di postman
    id = json['id'];
    name = json['name'];
  }

  //function untuk mengubah category model dalam bentuk json
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
    };
  }
}
