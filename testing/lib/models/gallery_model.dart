class GalleryModel {
  int id;
  String url;

  GalleryModel({
    this.id,
    this.url,
  });

  GalleryModel.fromJson(Map<String, dynamic> json) {
    // untuk bagian jsong wajib sesuai sama yang ada di postman
    id = json['id'];
    url = json['url'];
  }

  //function untuk mengubah category model dalam bentuk json
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'url': url,
    };
  }
}
