import 'dart:convert';

import 'package:eos_app/api/enviroment.dart';
import 'package:eos_app/models/ticket_model.dart';
import 'package:http/http.dart' as http;

class TicketProvider {
  String _url = Enviroment.API_TICKETS;

  Future<dynamic> getAllTickets(String idUser) async {
    //Retorna todos los tickets de un User
    try {
      Uri url = Uri.parse(_url + 'api/OS_OrdenServicio?idUsuario=$idUser');
      Map<String, String> headers = {
        'Authorization':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1bmlxdWVfbmFtZSI6InNvcG9ydGVAZW9zLm1lZC5lYyIsInJvbGUiOiJJTkdFTklFUk8iLCJuYmYiOjE2MzgzODQ3MjEsImV4cCI6MTYzODQyMDcyMSwiaWF0IjoxNjM4Mzg0NzIxLCJpc3MiOiJodHRwczovL3RlY2huaWNhbC5lb3MubWVkLmVjIiwiYXVkIjoiaHR0cHM6Ly90ZWNobmljYWwuZW9zLm1lZC5lYyJ9.4VfrsLiu4NFOVMz7RUMrSIeMFAgzNlgP65NERv0xj5I',
        'Content-type': 'application/json'
      };
      final res = await http.get(url, headers: headers);

      final data = json.decode(res.body);
      final tickets =
          data['Response'].map((json) => TicketModel().fromJson(json)).toList();

      return tickets;
    } catch (e) {
      print('Error: $e');
      return null;
    }
  }
}
