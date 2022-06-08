import 'package:http/http.dart' as http;

Map<String, dynamic> state = {
  'data': '',
  'datah': '',
};

Map<String, dynamic> mutation = {
  'UPDATE_data': (String data) {
    state["data"] = data;
  },
  'UPDATE_datah': (String data) {
    state["datah"] = data;
  }
};

Future<String> g() async {
  var url = Uri.parse(
      'http://192.168.8.100:8000/database/get_h_value/vitanic/12345678/');
  final response = await http.get(url);

  return response.body;
}

Map<String, dynamic> actions = {
  'get_h_vlaue': () {
    g().then((value) => {mutation["UPDATE_data"](value)});
  },
  'datah': print,
};

Map<String, dynamic> getters = {
  'get_data': state["data"],
  'get_datah': '',
};
