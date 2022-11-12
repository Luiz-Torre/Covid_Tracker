import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'requisitorapi.dart';


const List<String> lista_paises = <String>[
  'Afghanistan',
  'Albania',
  'Algeria',
  'Andorra',
  'Angola',
  'Antarctica',
  'Antigua and Barbuda',
  'Argentina',
  'Armenia',
  'Australia',
  'Austria',
  'Azerbaijan',
  'Bahamas',
  'Bahrain',
  'Bangladesh',
  'Barbados',
  'Belarus',
  'Belgium',
  'Belize',
  'Benin',
  'Bhutan',
  'Bolivia',
  'Bosnia and Herzegovina',
  'Botswana',
  'Brazil',
  'Brunei',
  'Bulgaria',
  'Burkina Faso',
  'Burma',
  'Burundi',
  'Cabo Verde',
  'Cambodia',
  'Cameroon',
  'Canada',
  'Central African Republic',
  'Chad',
  'Chile',
  'China',
  'Colombia',
  'Comoros',
  'Congo (Brazzaville)',
  'Congo (Kinshasa)',
  'Costa Rica',
  "Cote d'Ivoire",
  'Croatia',
  'Cuba',
  'Cyprus',
  'Czechia',
  'Denmark',
  'Diamond Princess',
  'Djibouti',
  'Dominica',
  'Dominican Republic',
  'Ecuador',
  'Egypt',
  'El Salvador',
  'Equatorial Guinea',
  'Eritrea',
  'Estonia',
  'Eswatini',
  'Ethiopia',
  'Fiji',
  'Finland',
  'France',
  'Gabon',
  'Gambia',
  'Georgia',
  'Germany',
  'Ghana',
  'Greece',
  'Grenada',
  'Guatemala',
  'Guinea',
  'Guinea-Bissau',
  'Guyana',
  'Haiti',
  'Holy See',
  'Honduras',
  'Hungary',
  'Iceland',
  'India',
  'Indonesia',
  'Iran',
  'Iraq',
  'Ireland',
  'Israel',
  'Italy',
  'Jamaica',
  'Japan',
  'Jordan',
  'Kazakhstan',
  'Kenya',
  'Kiribati',
  'Korea, North',
  'Korea, South',
  'Kosovo',
  'Kuwait',
  'Kyrgyzstan',
  'Laos',
  'Latvia',
  'Lebanon',
  'Lesotho',
  'Liberia',
  'Libya',
  'Liechtenstein',
  'Lithuania',
  'Luxembourg',
  'MS Zaandam',
  'Madagascar',
  'Malawi',
  'Malaysia',
  'Maldives',
  'Mali',
  'Malta',
  'Marshall Islands',
  'Mauritania',
  'Mauritius',
  'Mexico',
  'Micronesia',
  'Moldova',
  'Monaco',
  'Mongolia',
  'Montenegro',
  'Morocco',
  'Mozambique',
  'Namibia',
  'Nauru',
  'Nepal',
  'Netherlands',
  'New Zealand',
  'Nicaragua',
  'Niger',
  'Nigeria',
  'North Macedonia',
  'Norway',
  'Oman',
  'Pakistan',
  'Palau',
  'Panama',
  'Papua New Guinea',
  'Paraguay',
  'Peru',
  'Philippines',
  'Poland',
  'Portugal',
  'Qatar',
  'Romania',
  'Russia',
  'Rwanda',
  'Saint Kitts and Nevis',
  'Saint Lucia',
  'Saint Vincent and the Grenadines',
  'Samoa',
  'San Marino',
  'Sao Tome and Principe',
  'Saudi Arabia',
  'Senegal',
  'Serbia',
  'Seychelles',
  'Sierra Leone','Singapore',
  'Slovakia',
  'Slovenia',             
  'Solomon Islands',
  'Somalia',              
  'South Africa',
  'South Sudan',          
  'Spain',
  'Sri Lanka',            
  'Sudan',
  'Summer Olympics 2020', 
  'Suriname',
  'Sweden',               
  'Switzerland',
  'Syria',                
  'Taiwan*',
  'Tajikistan',           
  'Tanzania',
  'Thailand',             
  'Timor-Leste',
  'Togo',                 
  'Tonga',
  'Trinidad and Tobago',  
  'Tunisia',
  'Turkey',               
  'Tuvalu',
  'US',                   
  'Uganda',
  'Ukraine',              
  'United Arab Emirates',
  'United Kingdom',       
  'Uruguay',
  'Uzbekistan',           
  'Vanuatu',
  'Venezuela',            
  'Vietnam',
  'West Bank and Gaza',   
  'Winter Olympics 2022',
  'Yemen',                
  'Zambia',
  'Zimbabwe'
];


class ConsultaPais extends StatefulWidget {
  const ConsultaPais({super.key});

  @override
  State<ConsultaPais> createState() => _ConsultaPaisState();
}

class _ConsultaPaisState extends State<ConsultaPais> {
  String dropdownValue = lista_paises.first;
  Future<CovidPais> fetchGet() async {
    final response = await http.get(Uri.parse(
        "https://covid19-brazil-api.now.sh/api/report/v1/${dropdownValue}"));

    return CovidPais.fromJson(json.decode(response.body));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: (Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Text(
                  "Selecione o País: ",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                DropdownButton<String>(
                  value: dropdownValue,
                  icon: const Icon(Icons.arrow_downward),
                  elevation: 16,
                  style: const TextStyle(color: Color.fromARGB(255, 33, 3, 85)),
                  underline: Container(
                    height: 2,
                    color: Colors.deepPurpleAccent,
                  ),
                  onChanged: (String? value) {
                    setState(() {
                      dropdownValue = value!;
                    });
                  },
                  items: lista_paises.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ],
            ),
            FutureBuilder<CovidPais>(
                future: fetchGet(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Padding(
                      padding: EdgeInsets.all(15.0),
                      child: Column(children: [
                        Card(
                          color: Color.fromARGB(255, 227, 229, 238),
                          child: SizedBox(
                              width: 300,
                              height: 85,
                              child: Center(
                                  child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(height: 8),
                                  Row(children: [
                                    SizedBox(width: 12),
                                    Text(
                                      "Nome do País",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Color.fromARGB(255, 56, 57, 58),
                                      ),
                                    )
                                  ]),
                                  SizedBox(height: 13),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.location_city,
                                        color: Color.fromARGB(255, 67, 66, 66),
                                        size: 30.0,
                                      ),
                                      SizedBox(width: 115),
                                      Text("${snapshot.data!.country}",
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color:
                                                Color.fromARGB(255, 1, 33, 65),
                                          )),
                                    ],
                                  )
                                ],
                              ))),
                        ),
                        Card(
                          color: Color.fromARGB(255, 227, 229, 238),
                          child: SizedBox(
                              width: 300,
                              height: 85,
                              child: Center(
                                  child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(height: 8),
                                  Row(children: [
                                    SizedBox(width: 12),
                                    Text(
                                      "Casos",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Color.fromARGB(255, 56, 57, 58),
                                      ),
                                    )
                                  ]),
                                  SizedBox(height: 13),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.insert_chart,
                                        color: Color.fromARGB(255, 67, 66, 66),
                                        size: 30.0,
                                      ),
                                      SizedBox(width: 115),
                                      Text("${snapshot.data!.cases}",
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color:
                                                Color.fromARGB(255, 1, 33, 65),
                                          )),
                                    ],
                                  )
                                ],
                              ))),
                        ),
                        Card(
                          color: Color.fromARGB(255, 227, 229, 238),
                          child: SizedBox(
                              width: 300,
                              height: 85,
                              child: Center(
                                  child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(height: 8),
                                  Row(children: [
                                    SizedBox(width: 12),
                                    Text(
                                      "Confirmado",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Color.fromARGB(255, 56, 57, 58),
                                      ),
                                    )
                                  ]),
                                  SizedBox(height: 13),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.person,
                                        color: Color.fromARGB(255, 67, 66, 66),
                                        size: 30.0,
                                      ),
                                      SizedBox(width: 115),
                                      Text("${snapshot.data!.confirmed}",
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color:
                                                Color.fromARGB(255, 1, 33, 65),
                                          )),
                                    ],
                                  )
                                ],
                              ))),
                        ),
                        Card(
                          color: Color.fromARGB(255, 227, 229, 238),
                          child: SizedBox(
                              width: 300,
                              height: 85,
                              child: Center(
                                  child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(height: 8),
                                  Row(children: [
                                    SizedBox(width: 12),
                                    Text(
                                      "Mortes",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Color.fromARGB(255, 56, 57, 58),
                                      ),
                                    )
                                  ]),
                                  SizedBox(height: 13),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.heart_broken_sharp,
                                        color: Color.fromARGB(255, 67, 66, 66),
                                        size: 30.0,
                                      ),
                                      SizedBox(width: 115),
                                      Text(
                                          "${snapshot.data!.deaths.toString()}",
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color:
                                                Color.fromARGB(255, 1, 33, 65),
                                          )),
                                    ],
                                  )
                                ],
                              ))),
                        ),
                        Card(
                          color: Color.fromARGB(255, 227, 229, 238),
                          child: SizedBox(
                              width: 300,
                              height: 85,
                              child: Center(
                                  child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(height: 8),
                                  Row(children: [
                                    SizedBox(width: 12),
                                    Text(
                                      "Recuperados",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Color.fromARGB(255, 56, 57, 58),
                                      ),
                                    )
                                  ]),
                                  SizedBox(height: 13),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.insert_emoticon,
                                        color: Color.fromARGB(255, 67, 66, 66),
                                        size: 30.0,
                                      ),
                                      SizedBox(width: 115),
                                      Text(
                                          "${snapshot.data!.recovered.toString()}",
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color:
                                                Color.fromARGB(255, 1, 33, 65),
                                          )),
                                    ],
                                  )
                                ],
                              ))),
                        ),
                       
                      ]),
                    );
                  } else if (snapshot.hasError) {
                    return Text("${snapshot.error}");
                  }
                  return CircularProgressIndicator();
                })
          ],
        )));
  }
}
