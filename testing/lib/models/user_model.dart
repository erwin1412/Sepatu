class UserModel {
  int id;
  String name;
  String email;
  String username;
  String profilePhotoUrl;
  String token;

  UserModel({
    this.id,
    this.name,
    this.email,
    this.username,
    this.profilePhotoUrl,
    this.token,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    // untuk bagian jsong wajib sesuai sama yang ada di postman
    id = json['id'];
    name = json['name'];
    email = json['email'];
    username = json['username'];
    profilePhotoUrl = json['profile_photo_url'];
    token = json['token'];
  }

  //function untuk mengubah user model dalam bentuk json
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'username': username,
      'profile_photo_url': profilePhotoUrl,
      'token': token,
    };
  }
}
