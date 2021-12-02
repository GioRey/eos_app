import 'package:eos_app/models/ticket_model.dart';
import 'package:eos_app/provider/orders_provider.dart';
import 'package:flutter/material.dart';

class OrdenesAnidadasPage extends StatefulWidget {
  String idTicket;
  String idEvent;
  String idUser;
  OrdenesAnidadasPage(
      {@required this.idTicket,
      @required this.idEvent,
      @required this.idUser,
      Key key})
      : super(key: key);

  @override
  State<OrdenesAnidadasPage> createState() => _OrdenesAnidadasPageState();
}

class _OrdenesAnidadasPageState extends State<OrdenesAnidadasPage> {
  List<dynamic> data = [];

  @override
  Widget build(BuildContext context) {
    final widthScreen = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('ticket # ${widget.idTicket}'),
          actions: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.search))
          ],
        ),
        bottomNavigationBar: Container(
            padding: const EdgeInsets.all(10.0),
            height: 80.0,
            color: Colors.red,
            child: Row(
              children: [
                const Icon(
                  Icons.cloud_done,
                  color: Colors.white,
                  size: 40,
                ),
              ],
            )),
        body: SingleChildScrollView(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
              FutureBuilder(
                  future: OrdersProvider()
                      .getOrdersnested(widget.idEvent, widget.idUser),
                  builder: (context, snap) {
                    if (snap.hasData) {
                      return Column(
                        children: [
                          const SizedBox(
                            height: 10.0,
                          ),
                          Text(
                            snap.data[0].client,
                            style: const TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                            ),
                            textAlign: TextAlign.start,
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          ListView.builder(
                              itemCount: snap.data.length,
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemBuilder: (context, i) {
                                return listTileCustom(context,snap.data[i]);
                              }),
                        ],
                      );
                    } else {
                      return Center(
                        child: Text('Sin Datos'),
                      );
                    }
                  }),
              const SizedBox(
                height: 200.0,
              ),
              TextButton(
                  onPressed: () {},
                  child: Container(
                    alignment: AlignmentDirectional.center,
                    width: widthScreen * 0.80,
                    height: 60.0,
                    padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(color: Colors.grey.shade300, blurRadius: 5.0)
                      ],
                      color: Colors.orange,
                      borderRadius:
                          const BorderRadius.all(Radius.circular(25.0)),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        const Icon(Icons.add, color: Colors.white),
                        Text(
                          'INGRESAR NUEVA OS AL TiCKET',
                          style: const TextStyle(
                              fontSize: 16.0, color: Colors.white),
                        ),
                      ],
                    ),
                  ))
            ])));
  }

  Widget listTileCustom(BuildContext context, TicketModel model) {
    final widthScreen = MediaQuery.of(context).size.width;
    //Widget que muestra data de order

    List<String> _options = [
      'Clonar OS',
      'Agregar Firmas',
      'Enivar OS',
      'Compartir PDF'
    ];

    return Container(
        width: widthScreen,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  width: 2, //                   <--- border width here
                ),
              ),
              child: Icon(
                Icons.done_rounded,
                color: Colors.black,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'XYSERIE / XYZ TIPO / XYZ MODELO',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey[600],
                  ),
                ),
                const SizedBox(
                  height: 3.0,
                ),
                Text(
                  '${model.typeTicket.toUpperCase()} / ${model.hourAsignFrom}',
                  style: const TextStyle(
                    fontSize: 13,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(
                  height: 3.0,
                ),
                Text(
                  'Prueba de instalación de equipos',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey[600],
                  ),
                )
              ],
            ),
            Container(
                height: 50.0,
                width: widthScreen * 0.1,
                child: DropdownButton(
                    isExpanded: true,
                    underline: Text(''),
                    dropdownColor: Colors.white,
                    onChanged: (value) async {},
                    items: _options.map((option) {
                      return DropdownMenuItem(
                        child: Text(option),
                        value: option,
                      );
                    }).toList(),
                    icon: Icon(
                      Icons.more_vert_rounded,
                      size: 30.0,
                      color: Colors.grey,
                    ))),
          ],
        ));
  }
}
