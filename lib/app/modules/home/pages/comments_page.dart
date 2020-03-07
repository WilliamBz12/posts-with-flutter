import 'package:flutter/material.dart';

import '../../../models/comment_model.dart';
import '../style/typography.dart';
import '../widgets/comment_widget.dart';

class CommentsPage extends StatelessWidget {
  final List<CommentModel> comments;
  CommentsPage({this.comments});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Comments"),
        backgroundColor: Colors.black12,
      ),
      body: Center(
        child: (comments.isEmpty)
            ? Text(
                "No comments",
                style: HomeTypography.normal,
              )
            : _buildList(),
      ),
    );
  }

  Widget _buildList() {
    return ListView.builder(
      itemCount: comments.length,
      itemBuilder: (_, index) {
        return CommentWidget(comment: comments[index]);
      },
    );
  }
}
