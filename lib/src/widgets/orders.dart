import 'dart:io';
import 'package:farmers_market/src/blocs/auth_bloc.dart';
import 'package:farmers_market/src/blocs/product_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';



class Orders extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    if (Platform.isIOS){
      return CupertinoPageScaffold(
        child: pageBody(),
      );
    } else {
      return Scaffold(
        body: pageBody(),
      );
    }
  }

  Widget pageBody() {
    return Center(child: Text(' Prices will be Displayed ( Using ML )!',style:TextStyle(fontWeight: FontWeight.bold,fontSize: 18.0)));
  }
}