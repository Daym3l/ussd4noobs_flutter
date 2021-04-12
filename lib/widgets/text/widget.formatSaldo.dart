import 'package:flutter/material.dart';
import 'package:ussd4noobs/helpers/helper.colors.dart';

class FormatSaldo extends StatelessWidget {
  final String price;

  FormatSaldo(this.price);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('\$',
              style: TextStyle(
                fontFamily: 'Bebas',
                fontSize: 20,
                color: ussd_PrimaryColor,
              )),
          SizedBox(
            width: 2,
          ),
          Text(
            price,
            style: TextStyle(
                color: ussd_PrimaryColor,
                fontSize: 50,
                fontFamily: 'Bebas',
                fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}
