import 'dart:io';
import 'package:farmers_market/src/blocs/auth_bloc.dart';
import 'package:farmers_market/src/blocs/product_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';



class Orders  extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var productBloc = Provider.of<ProductBloc>(context);
    var authBloc = Provider.of<AuthBloc>(context);

    Widget pageBody(ProductBloc productBloc, BuildContext context,
        String vendorId) {
      return StreamBuilder(
          stream:FirebaseFirestore.instance.collection("price").snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData)
              return (Platform.isIOS)
                  ? CupertinoActivityIndicator()
                  : CircularProgressIndicator();

            return ListView.builder(
                      itemCount: snapshot.data.docs.length,
                      itemBuilder: (context, index) {
                        return Card(
                          child:ListTile(
                            title:Text(snapshot.data.docs[index].data()["Name"],style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20)),
                            leading:Image.network(snapshot.data.docs[index].data()["imageUrl"]),
                            subtitle:Text('\u{20B9}${snapshot.data.docs[index].data()["price"]}${' / kg'}',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18)),
                          )
                        ) ;
                      }
            );
          });
    }

    return pageBody(productBloc, context, authBloc.userId);
  }}
