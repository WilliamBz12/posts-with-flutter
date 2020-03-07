class PersonModel {
  int personId;
  String name;
  String profilePhotoUri;

  PersonModel({this.personId, this.name, this.profilePhotoUri});

  PersonModel.fromJson(Map<String, dynamic> json) {
    personId = json['personId'];
    name = json['name'];
    profilePhotoUri = json['profilePhotoUri'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['personId'] = this.personId;
    data['name'] = this.name;
    data['profilePhotoUri'] = this.profilePhotoUri;
    return data;
  }
}