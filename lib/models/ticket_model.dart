class TicketModel {
  int eventId;
  int ticketId;
  String client;
  String typeTicket;
  String tipeTicketDesc;
  String descProblemTicket;
  dynamic equipId;
  String dateAsignFrom;
  String dateAsignTo;
  String hourAsignFrom;
  String hourAsignTo;
  String status;
  String addressTicket;
  dynamic cantonTick;
  dynamic provinciaTick;
  dynamic reportTick;
  String telReportTick;
  dynamic incidence;
  dynamic typeIncidence;
  int createdUserTick;
  String statusTicket;
  String eventDescription;
  dynamic idContract;
  int ingId;
  dynamic engineer;
  int orderServiceId;

  TicketModel({
    this.eventId,
    this.ticketId,
    this.client,
    this.typeTicket,
    this.tipeTicketDesc,
    this.descProblemTicket,
    this.equipId,
    this.dateAsignFrom,
    this.dateAsignTo,
    this.hourAsignFrom,
    this.hourAsignTo,
    this.status,
    this.addressTicket,
    this.cantonTick,
    this.provinciaTick,
    this.reportTick,
    this.telReportTick,
    this.incidence,
    this.typeIncidence,
    this.createdUserTick,
    this.statusTicket,
    this.eventDescription,
    this.idContract,
    this.ingId,
    this.engineer,
    this.orderServiceId,
  });

  TicketModel fromJson(Map<String, dynamic> json) => TicketModel(
        eventId: json['evento_id'],
        ticketId: json['ticket_id'],
        client: json['tck_cliente'],
        typeTicket: json['tck_tipoTicket'],
        tipeTicketDesc: json['tck_tipoTicketDesc'],
        descProblemTicket: json['tck_descripcionProblema'],
        equipId: json['id_equipo'],
        dateAsignFrom: json['ev_fechaAsignadaDesde'],
        dateAsignTo: json['ev_fechaAsignadaHasta'],
        hourAsignFrom: json['ev_horaAsignadaDesde'],
        hourAsignTo: json['ev_horaAsignadaHasta'],
        status: json['ev_estado'],
        addressTicket: json['tck_direccion'],
        cantonTick: json['tck_canton'],
        provinciaTick: json['tck_provincia'],
        reportTick: json['tck_reporta'],
        telReportTick: json['tck_telefonoReporta'],
        incidence: json['incidencia'],
        typeIncidence: json['tipoIncidencia'],
        createdUserTick: json['tck_usuario_creacion'],
        statusTicket: json['tck_estadoTicket'],
        eventDescription: json['ev_descripcion'],
        idContract: json['id_contrato'],
        ingId: json['ingenieroId'],
        engineer: json['ingeniero'],
        orderServiceId: json['OrdenServicioID'],
      );
}
