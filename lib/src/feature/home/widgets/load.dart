import 'package:flutter/material.dart';
import 'package:mama/src/data.dart';
import 'package:mobx/mobx.dart';

class LoadHomeData extends StatefulWidget {
  final Widget child;
  final UserStore userStore;
  final ArticleStore articleStore;
  const LoadHomeData({
    super.key,
    required this.child,
    required this.userStore,
    required this.articleStore,
  });

  @override
  State<LoadHomeData> createState() => _LoadHomeDataState();
}

class _LoadHomeDataState extends State<LoadHomeData> {
  @override
  void initState() {
    widget.userStore.getData();
    widget.articleStore.fetchArticles();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LoadingWidget(
        future: ObservableFuture(
          Future.wait([
            widget.userStore.fetchUserDataFuture,
            widget.articleStore.fetchArticlesFuture
          ]),
        ),
        builder: (v) {
          return widget.child;
        },
      ),
    );
  }
}
