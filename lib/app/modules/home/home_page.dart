import 'widgets/post_item_widget.dart';
import 'package:flutter/material.dart';

import '../../models/post_model.dart';
import 'home_bloc.dart';
import 'home_module.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _bloc = HomeModule.to.get<HomeBloc>();

  @override
  void initState() {
    super.initState();
    _bloc.loadPosts(); //Loading posts
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Posts"),
        backgroundColor: Colors.black12,
      ),
      body: Center(
        child: StreamBuilder<List<PostModel>>(
          stream: _bloc.outPosts,
          builder: (_, snapshot) {
            if (snapshot.hasError) { //Error
              return Text(snapshot.error);
            } else if (snapshot.hasData) { //Loaded
              return _buildPostList(snapshot.data);
            } else { //IsLoading
              return CircularProgressIndicator();
            }
          },
        ),
      ),
    );
  }

  Widget _buildPostList(List<PostModel> list) {
    return ListView.builder(
      itemCount: list.length,
      itemBuilder: (_, index) {
        return PostItemWidget(item: list[index]);
      },
    );
  }
}
