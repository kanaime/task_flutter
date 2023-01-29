class UserModel {
  final String uid;

  UserModel(this.uid);
}

class UserData {
  String? id;
  String? name;
  String? email;
  String? date;
  UserData({this.id, this.name, this.email, this.date});

  UserData.fromMap(Map<String, dynamic> mapdata) {
    this.id = mapdata["id"];
    this.name = mapdata["name"];
    this.email = mapdata["email"];
    this.date = mapdata["date"];
  }

  Map<String, dynamic> toMap(UserData user) {
    var data = Map<String, dynamic>();
    data["id"] = user.id;
    data['name'] = user.name;
    data["email"] = user.email;
    data['date'] = user.date;
    return data;
  }
}
