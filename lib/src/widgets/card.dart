import 'package:farmers_market/src/styles/base.dart';
import 'package:farmers_market/src/styles/colors.dart';
import 'package:farmers_market/src/styles/text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class AppCard extends StatelessWidget {
  final String productName;
  final String marketId;
  final int availableUnits;
  final double price;
  final String note;
  final String imageUrl;

  final formatCurrency = NumberFormat.simpleCurrency();

  AppCard({
    @required this.productName,
    @required this.marketId,
    @required this.availableUnits,
    @required this.price,
    this.imageUrl,
    this.note = "",
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: BaseStyles.listPadding,
      padding: BaseStyles.listPadding,
      decoration: BoxDecoration(  
        boxShadow: BaseStyles.boxShadow,
        color: Colors.white,
        border: Border.all(  
          color: AppColors.darkblue,
          width: BaseStyles.borderWidth,
        ),
        borderRadius: BorderRadius.circular(BaseStyles.borderRadius)
      ),
      child: Column(  
        children: <Widget>[
          Row(  
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(right: 10.0, bottom: 10.0, top: 10.0),
                child: (imageUrl != null && imageUrl != "") 
                ? ClipRRect(child: Image.network(imageUrl, height: 100.0,)
                ,borderRadius: BorderRadius.circular(5.0),)
                : Image.asset('assets/images/vegetables.png', height: 100.0,),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(productName,style:TextStyles.listTitle1),
                  Text('\u{20B9}${price}${' / kg'}', style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18)),
                  (availableUnits > 0 )
                   ? Text('In Stock', style:TextStyle(fontWeight: FontWeight.bold,color:Color.fromRGBO(0,128,0,1),fontSize: 17))
                   : Text('Currently Unavailable',style:TextStyle(fontWeight: FontWeight.bold,color:Colors.red,fontSize: 17))
              ],)
            ],
          ),
          Text(note, style: TextStyles.body)
        ],
      ),
    );
  }
}