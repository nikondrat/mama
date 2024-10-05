import 'package:flutter/material.dart';
import 'package:mama/src/data.dart';

class LoadHomeData extends StatefulWidget {
  final Widget Function(UserData data) builder;
  final UserStore userStore;
  const LoadHomeData({
    super.key,
    required this.builder,
    required this.userStore,
  });

  @override
  State<LoadHomeData> createState() => _LoadHomeDataState();
}

class _LoadHomeDataState extends State<LoadHomeData> {
  @override
  void initState() {
    widget.userStore.getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LoadingWidget(
        future: widget.userStore.fetchUserDataFuture,
        builder: (v) {
          return widget.builder(v);
        },
      ),
    );
  }
}
