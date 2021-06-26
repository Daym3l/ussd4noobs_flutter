import 'package:flutter/material.dart';

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
                color: Theme.of(context).textTheme.headline1.color,
              )),
          SizedBox(
            width: 2,
          ),
          Text(
            price,
            style: TextStyle(
              color: Theme.of(context).textTheme.headline1.color,
              fontSize: 40,
              fontFamily: 'Bebas',
            ),
          )
        ],
      ),
    );
  }
}
