import 'package:http/http.dart' as http;
void getData() async{
  var url = Uri.https('example.com', 'whatsit/create');
  var response = await http.post(url, body: {'name': 'doodle', 'color': 'blue'});
  print('Response status: ${response.statusCode}');
  print('Response body: ${response.body}');

  print(await http.read(Uri.https('example.com', 'foobar.txt')));
}
