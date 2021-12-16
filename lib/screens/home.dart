import 'package:flutter/material.dart';
import '../widgets/article.dart';
import '../services/wiki_data.dart';
import '../constants.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: FutureBuilder(
          // using future builder to get the date and build ui when it is fetched
            future: fetchData(),
            builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
              List data;
              if (snapshot.hasData) {
                data = snapshot.data!;
              } else {
                data = [];
              }

              return ListView.separated(
                  separatorBuilder: (BuildContext context, int index) =>
                      const Divider(),
                  physics: const BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: data.length, 
                  itemBuilder: (BuildContext context, int index) =>
                      articleListItem(
                        name: articles[index].replaceAll(RegExp(r'_'), ' '),
                        wikiData: data[index],
                      ));
            }),
      ),
    );
  }
}
