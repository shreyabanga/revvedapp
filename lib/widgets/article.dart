import 'package:flutter/material.dart';
import './info_card.dart';
import '../styles.dart';

class articleListItem extends StatelessWidget {
  final String name;
  final List wikiData;

  const articleListItem({
    Key? key,
    required this.name,
    required this.wikiData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return Padding(
      padding: const EdgeInsets.only(top: 40.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(40.0,0,40.0,0),
            child: Text(
              name,
              style: articleNameStyle(),
            ),
          ),
          Container(
            height: 200,
            child: ListView.separated(
                separatorBuilder: (BuildContext context, int index) =>
                    const SizedBox(
                      width: 20,
                    ),
                padding: const EdgeInsets.all(40),
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: wikiData.length,
                itemBuilder: (BuildContext context, int index) {
                  
                    return infoCard(date: wikiData[index]['date'], views: wikiData[index]['views'],index:index);
                  
                }),
          ),
        ],
      ),
    );
  }

  
}
