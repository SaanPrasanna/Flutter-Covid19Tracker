import 'package:flutter/material.dart';

class DisplayMessage extends StatelessWidget {
  final String message;
  const DisplayMessage({
    Key key, this.message,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height/2,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Center(
              child: ClipRRect(
                child: Container(
                  child: Image.asset('assets/covid19.png',width: 200,),
                ),
              ),
            ),
          Expanded(child: Center(
            child: SingleChildScrollView(child: 
              Container(
                child: Text(
                  message,
                  style: TextStyle(fontSize: 35.0,fontFamily: 'Proxima',),
                  ),
              )
            ),
          )),
        ],
      ),
    );
  }
}