import 'package:flutter/material.dart';

Container circularProgress(){
  return Container(
    child: CircularProgressIndicator(
      valueColor: AlwaysStoppedAnimation(
        Colors.blueGrey
      ),
    ),
    alignment: Alignment.center,
    padding: EdgeInsets.only(
      top: 10.0
    ),
  );
}

Container buttonCircularProgress(){
  return Container(
    child: CircularProgressIndicator(
      valueColor: AlwaysStoppedAnimation(
        Colors.white
      ),
    ),
    alignment: Alignment.center,
    // margin: EdgeInsets.symmetric(vertical : 6),
    padding: EdgeInsets.symmetric(
      vertical: 10
    ),
  );
}

Container linearProgress(){
  return Container(
    padding: EdgeInsets.only(bottom: 10),
    child: LinearProgressIndicator(valueColor: AlwaysStoppedAnimation(Colors.purple),),
  );
}
