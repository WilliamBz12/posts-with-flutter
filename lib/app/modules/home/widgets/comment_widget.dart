import '../../../models/comment_model.dart';
import '../style/typography.dart';
import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:flutter/material.dart';

class CommentWidget extends StatelessWidget {
  final CommentModel comment;
  CommentWidget({@required this.comment});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      child: Row(
        children: <Widget>[
          CircularProfileAvatar(
            "${comment.person?.profilePhotoUri}",
            radius: 20,
          ),
          SizedBox(width: 10),
          Text(
            "${comment.person?.name} ",
            style: HomeTypography.bold,
          ),
          Text(
            "${comment.text}",
            style: HomeTypography.normal,
          ),
        ],
      ),
    );
  }
}
