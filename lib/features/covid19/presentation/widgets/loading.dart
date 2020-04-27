import 'package:flutter/material.dart';

class LoadingWidget extends StatelessWidget {
  final String message;
  const LoadingWidget({
    Key key, this.message,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height/2,
      child: Center(child: CircularProgressIndicator())
    );
  }
}