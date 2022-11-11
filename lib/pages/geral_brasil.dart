// import 'dart:async';
// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'requisitorapi.dart';

// Future<Covid> fetchGet() async {
//   final response = await http
//       .get(Uri.parse("https://covid19-brazil-api.now.sh/api/report/v1"));

//   if (response.statusCode == 200) {
//     print(json.decode(response.body));
//     // se o servidor retornar um response OK, vamos fazer o parse no JSON
//     return Covid.fromJson(json.decode(response.body));
//   } else {
//     // se a responsta não for OK , lançamos um erro
//     print("Entrou 2");

//     throw Exception('Failed to load get');
//   }
// }

// void main() => runApp(GeralBrasil(estados_recebidos: fetchGet()));

// class GeralBrasil extends StatelessWidget {
//   final Future<Covid> estados_recebidos;
//   GeralBrasil({Key? key, required this.estados_recebidos}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(),
//         body: (Column(
//           children: [
//             Center(
//               child: FutureBuilder<Covid>(
//                 future: fetchGet(),
//                 builder: (context, snapshot) {
//                   print(snapshot.data);
//                   if (snapshot.hasData) {
//                     return Padding(
//                       padding: const EdgeInsets.all(15.0),
//                       child: Text(snapshot.data!.data.first.uf),
//                     );
//                   } else if (snapshot.hasError) {
//                     return Text("Teste ${snapshot.error}");
//                   }
//                   return CircularProgressIndicator();
//                 },
//               ),
//             )
//           ],
//         )));
//   }
// }
