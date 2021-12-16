import 'package:dio/dio.dart';
import '../constants.dart';

Future<List> fetchData() async {
  // get the current date and date ten days ago and formats it for the api parameter.

  var now =
      DateTime.now().toString().substring(0, 11).replaceAll(RegExp(r'-'), '');
  var tenDaysBefore = DateTime.now()
      .subtract(const Duration(days: 10))
      .toString()
      .substring(0, 11)
      .replaceAll(RegExp(r'-'), '');

  List result = [];
  var dio = Dio();

  // use dio to get the response from the REST api
  for (String articleName in articles) {
    final response = await dio.get(
        'https://wikimedia.org/api/rest_v1/metrics/pageviews/per-article/en.wikipedia.org/all-access/all-agents/$articleName/daily/${tenDaysBefore}/${now}');

  // create a map for every article in the articles list 
    result.add(response.data['items'].reversed
        .toList()
        .map((item) => {
              'date': parseTimeStamp(item['timestamp'].substring(0, 8)),
              'views': item['views'].toString()
            })
        .toList());
  }
  return (result);
}

// format the date to be displayed
String parseTimeStamp(String timeStamp) {
  var parsedString = DateTime.parse(timeStamp);
  return ("${parsedString.month}/${parsedString.day}");
}
