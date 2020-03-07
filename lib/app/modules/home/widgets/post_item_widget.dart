import '../style/typography.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:flutter/material.dart';

import '../../../models/post_model.dart';

class PostItemWidget extends StatelessWidget {
  final PostModel item;
  PostItemWidget({@required this.item});

  void _onTap(context) {
    Navigator.pushNamed(
      context,
      "/comments",
      arguments: item.comments,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _buildUserInfo(),
          _buildImage(),
          _buildLikesInfo(),
          _buildCommentInfo(context),
        ],
      ),
    );
  }

  Widget _buildCommentInfo(context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          InkWell(
            child: Text(
              "View all ${item?.comments?.length} comments",
              style: HomeTypography.normalGrey,
            ),
            onTap: () => _onTap(context),
          ),
          SizedBox(height: 20), //space between posts
        ],
      ),
    );
  }

  Widget _buildUserInfo() {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 15,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          CircularProfileAvatar(
            "${item.person?.profilePhotoUri}",
            radius: 15,
          ),
          SizedBox(width: 10),
          Text(
            "${item.person?.name}",
            style: HomeTypography.bold,
          ),
        ],
      ),
    );
  }

  Widget _buildLikesInfo() {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 15,
      ),
      child: Row(
        children: <Widget>[
          Icon(Icons.favorite),
          SizedBox(width: 10),
          Text(
            "${item?.likes} likes",
            style: HomeTypography.normal,
          ),
        ],
      ),
    );
  }

  Widget _buildImage() {
    return Center(
      child: CachedNetworkImage(
        imageUrl: "${item.photoUri}",
        placeholder: (_, __) => CircularProgressIndicator(),
        errorWidget: (_, __, ___) => Icon(Icons.error),
      ),
    );
  }
}
