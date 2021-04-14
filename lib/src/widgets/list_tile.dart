import 'package:farmers_market/src/styles/base.dart';
import 'package:farmers_market/src/styles/colors.dart';
import 'package:farmers_market/src/styles/text.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AppListTile extends StatelessWidget {
  final String month;
  final String date;
  final String title;
  final String location;
  final bool acceptingOrders;
  final String marketId;

  AppListTile({
    @required this.month,
    @required this.date,
    @required this.title,
    @required this.location,
    @required this.marketId,
    this.acceptingOrders = false
  });

  @override
  Widget build(BuildContext context) {
      return Column(
        children: <Widget>[
          ListTile( 
            leading: CircleAvatar(  
              radius: 25.0,
              backgroundColor: AppColors.lightblue,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(month,style: TextStyle(color:Colors.white, fontSize: 15.0,fontWeight: FontWeight.bold)),
                  Text(date, style: TextStyles.buttonTextLight,)
                ],),
            ),
            title:RichText(
              text: TextSpan(
                text: title,
                style:TextStyle(fontWeight: FontWeight.bold,color: AppColors.straw,fontSize:20.0),
                children: <TextSpan>[
                  TextSpan(text:" : ", style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black)),
                  TextSpan(text:marketId, style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black)),
                ],
              ),
          ),
            subtitle: Text(location,style: TextStyle(fontWeight: FontWeight.bold,fontSize:17.0)),
            trailing:(acceptingOrders) ? Icon(FontAwesomeIcons.shoppingCart,color: AppColors.darkblue,): Text(''),
            onTap: (acceptingOrders) ? () => Navigator.of(context).pushNamed('/customer/$marketId'): null,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: BaseStyles.listFieldHorizontal),
            child: Divider(color:AppColors.lightgray),
          )
        ],
      );

  }
}