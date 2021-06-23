import 'package:flutter/material.dart';

class DatosCircle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
          ),
          Positioned(
            child: Container(
              width: 260,
              height: 260,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(200),
                color: Theme.of(context).canvasColor,
              ),
              child: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.wifi,
                  color: Theme.of(context).primaryColor,
                  size: 60,
                ),
              ),
            ),
          ),
          Positioned(
            left: 60,
            top: 245,
            child: Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(200),
                border:
                    Border.all(color: Theme.of(context).canvasColor, width: 2),
                color: Theme.of(context).primaryColor,
              ),
              child: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.sms,
                  color: Theme.of(context).canvasColor,
                  size: 30,
                ),
              ),
            ),
          ),
          Positioned(
            right: 70,
            top: 260,
            child: Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(200),
                color: Theme.of(context).canvasColor,
              ),
              child: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.mic,
                  color: Theme.of(context).primaryColor,
                  size: 50,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
