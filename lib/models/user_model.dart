class UserModel {
  int id;
  String name;

  UserModel(this.id, this.name);

  UserModel.fromJson(Map<String, dynamic> parsedJson) {
    id = parsedJson['id'];
    name = parsedJson['name'];
  }
}
