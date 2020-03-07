import 'comment_model.dart';
import 'person_model.dart';

class PostModel {
  int postId;
  int personId;
  String created;
  String photoUri;
  int likes;
  PersonModel person;
  List<CommentModel> comments;

  PostModel({
    this.postId,
    this.personId,
    this.created,
    this.photoUri,
    this.likes,
    this.person,
    this.comments,
  });

  PostModel.fromJson(Map<String, dynamic> json) {
    postId = json['postId'];
    personId = json['personId'];
    created = json['created'];
    photoUri = json['photoUri'];
    likes = json['likes'];
    if (json['person'] != null) {
      person = PersonModel.fromJson(json['person']);
    }
    if (json['comments'] != null) {
      comments = new List<CommentModel>();
      json['comments'].forEach((item) {
        comments.add(CommentModel.fromJson(item));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['postId'] = this.postId;
    data['personId'] = this.personId;
    data['created'] = this.created;
    data['photoUri'] = this.photoUri;
    data['likes'] = this.likes;
    if (this.person != null) {
      data['person'] = this.person.toJson();
    }
    if (this.comments != null) {
      data['comments'] = this.comments.map((item) => item.toJson()).toList();
    }
    return data;
  }
}
