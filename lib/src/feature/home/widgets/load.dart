import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mama/src/data.dart';

class LoadHomeData extends StatefulWidget {
  final Widget child;
  final UserStore userStore;
  const LoadHomeData({
    super.key,
    required this.child,
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
    return Observer(
      builder: (context) {
        return widget.child;
      },
    );
  }
}
