
import 'person_model.dart';

class CommentModel {
  int commentId;
  int postId;
  int personId;
  PersonModel person;
  String text;

  CommentModel({
    this.commentId,
    this.postId,
    this.personId,
    this.person,
    this.text,
  });

  CommentModel.fromJson(Map<String, dynamic> json) {
    commentId = json['commentId'];
    postId = json['postId'];
    personId = json['personId'];
    person =
        json['person'] != null ? new PersonModel.fromJson(json['person']) : null;
    text = json['text'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['commentId'] = this.commentId;
    data['postId'] = this.postId;
    data['personId'] = this.personId;
    if (this.person != null) {
      data['person'] = this.person.toJson();
    }
    data['text'] = this.text;
    return data;
  }
}
