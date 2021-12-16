import 'package:flutter/material.dart';
import 'package:revvedapp/styles.dart';

class infoCard extends StatelessWidget {
  final String date;
  final String views;
  final int index;

  const infoCard({
    Key? key,
    required this.date,
    required this.views,
    required this.index
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      decoration: cardDecoration(index),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  date,
                  style: dateStyle(index),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: 70,
                    child: FittedBox(
                      fit: BoxFit.fitWidth,
                      child: Text(
                        views,
                        style: viewsStyle(index),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  

  
}
