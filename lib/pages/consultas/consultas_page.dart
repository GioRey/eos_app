import 'dart:ffi';

import 'package:eos_app/models/ticket_model.dart';
import 'package:eos_app/pages/consultas/ordenes_anidadas_page.dart';
import 'package:eos_app/provider/tickets_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ConsultasPage extends StatefulWidget {
  ConsultasPage({Key key}) : super(key: key);

  @override
  _ConsultasPageState createState() => _ConsultasPageState();
}

class _ConsultasPageState extends State<ConsultasPage>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  Icon cusIcon = const Icon(Icons.search);
  Widget cusSearchBar = const Text('Consultas');
  List<dynamic> data = [];
  void loadData() async {
    final resp = await TicketProvider().getAllTickets('1082');

    if (resp != null) {
      setState(() {
        data = resp;
      });
    }
  }

  @override
  void initState() {
    super.initState();

    loadData();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(110),
          child: AppBar(
            backgroundColor: const Color.fromRGBO(234, 0, 41, 1),
            title: cusSearchBar,
            actions: [_search()],
            bottom: TabBar(
                controller: _tabController,
                indicatorColor: Colors.white,
                labelColor: Colors.white,
                unselectedLabelColor: Colors.white60,
                // isScrollable: true,
                // indicatorWeight: 3,
                tabs: [
                  Tab(text: 'AYER'),
                  Tab(text: 'HOY'),
                  Tab(text: 'MAÑANA'),
                ]),
          ),
        ),
        drawer: _drawer(),
        body: Stack(
          children: [
            _tabBarView(context),
            _buttonNavigationBar(),
          ],
        ));
  }

  Widget _drawer() {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration:
                const BoxDecoration(color: Color.fromRGBO(234, 0, 41, 1)),
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'Soporte Pruebas',
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                    maxLines: 1,
                  ),
                ],
              ),
            ),
          ),
          const ListTile(
              // onTap: _con.logout,
              title: Text('Ajustes'),
              trailing: Icon(Icons.settings)),
          const ListTile(
              // onTap:(){},
              title: Text('Cerrar sesión'),
              trailing: Icon(Icons.power_settings_new))
        ],
      ),
    );
  }

  Widget _search() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      child: IconButton(
        onPressed: () {
          setState(() {
            if (cusIcon.icon == Icons.search) {
              cusIcon = const Icon(Icons.arrow_back);
              cusSearchBar = const TextField(
                textInputAction: TextInputAction.go,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Buscar...',
                    hintStyle: TextStyle(color: Colors.white)),
                style: TextStyle(color: Colors.white, fontSize: 16),
              );
            } else {
              cusIcon = const Icon(Icons.search);
              cusSearchBar = const Text('Consultas');
            }
          });
        },
        icon: cusIcon,
      ),
    );
  }

  Widget _buttonNavigationBar() {
    final Size size = MediaQuery.of(context).size;

    return Stack(
      children: [
        Positioned(
            bottom: 0,
            left: 0,
            child: Container(
              width: size.width,
              height: 80,
              color: Colors.white54,
              child: Stack(
                children: [
                  CustomPaint(
                    size: Size(size.width, 80),
                    painter: BNBCustomPainter(),
                  ),
                  Center(
                    heightFactor: 0.7,
                    child: FloatingActionButton(
                      onPressed: () {},
                      backgroundColor: Colors.black,
                      child: const Icon(Icons.add),
                      elevation: 0.1,
                    ),
                  ),
                  Container(
                    width: size.width,
                    height: 80,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          width: 80,
                          height: 40,
                          child: IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.cloud_done_outlined,
                                color: Colors.white,
                                size: 30,
                              )),
                        ),
                        // const Text(
                        //   'Sincronizando...',
                        //   style: TextStyle(
                        //     fontSize: 11,
                        //     color: Colors.white,
                        //   ),
                        // ),
                      ],
                    ),
                  )
                ],
              ),
            ))
      ],
    );
  }

  Widget _tabBarView(BuildContext context) {
    return TabBarView(controller: _tabController, children: [
      ListView.builder(
          padding: const EdgeInsets.only(bottom: 90.0),
          itemCount: data.length,
          itemBuilder: (context, i) {
            return cardWidget(data[i]);
          }),
      ListView.builder(
          padding: const EdgeInsets.only(bottom: 90.0),
          itemCount: data.length,
          itemBuilder: (context, i) {
            return cardWidget(data[i]);
          }),
      ListView.builder(
          padding: const EdgeInsets.only(bottom: 90.0),
          itemCount: data.length,
          itemBuilder: (context, i) {
            return cardWidget(data[i]);
          }),
    ]);
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

  Widget cardWidget(TicketModel model) {
    //Widget de card se pinta de acuerdo al parametro de
    //status de un color o otro
    Color colorCard = Colors.white;
    dynamic icon = SvgPicture.asset('assets/calendar-time.svg');
    switch (model.status) {
      case 'PENDIENTE':
        colorCard = const Color(0x13FF6B00);
        icon = SvgPicture.asset('assets/calendar-post.svg');
        break;
      case 'REAGENDADO':
        colorCard = const Color(0x13840018);
        icon = SvgPicture.asset('assets/calendar-posponed.svg');
        break;
      case 'FINALIZADO':
        colorCard = const Color(0x131FD60F);
        icon = SvgPicture.asset('assets/calendar-check.svg');
        break;
    }
    return Card(
      color: colorCard,
      child: Column(
        children: [
          ListTile(
            onTap: () async {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => OrdenesAnidadasPage(
                          idTicket: model.ticketId.toString(),
                          idEvent: '37358 ',
                          idUser: '18',
                        )),
              );
            },
            title: Text(
              '# ${model.ticketId} - ${model.typeTicket}',
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey[600],
              ),
            ),
            trailing: Column(
              children: [
                const SizedBox(height: 10),
                const Text('15:30'),
                const SizedBox(height: 2),
                icon
              ],
            ),
            subtitle: Column(
              children: [
                const SizedBox(height: 5),
                Text(
                  model.client,
                  textAlign: TextAlign.right,
                  style: const TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  model.eventDescription,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
            isThreeLine: true,
          ),
        ],
      ),
    );
  }
}

class BNBCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = const Color.fromRGBO(234, 0, 41, 1)
      ..style = PaintingStyle.fill;

    Path path = Path();
    path.moveTo(0, 20); // Start
    path.quadraticBezierTo(size.width * 0.20, 0, size.width * 0.35, 0);
    path.quadraticBezierTo(size.width * 0.40, 0, size.width * 0.40, 20);
    path.arcToPoint(Offset(size.width * 0.60, 20),
        radius: const Radius.circular(20.0), clockwise: false);
    path.quadraticBezierTo(size.width * 0.60, 0, size.width * 0.65, 0);
    path.quadraticBezierTo(size.width * 0.80, 0, size.width, 20);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.lineTo(0, 20);
    canvas.drawShadow(path, Colors.black, 5, true);
    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
