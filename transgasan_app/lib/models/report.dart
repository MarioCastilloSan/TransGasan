class ReportData {
  String numberGuide;
  String driverName;
  String observations;
  String linsencePlate;
  String nameTruck;
  String date;
  String inKm;
  String outKm;
  String laps;
  String fuel;
  String oilM;
  String graseM;
  String hydraulicM;
  ReportData(
      this.numberGuide,
      this.driverName,
      this.observations,
      this.linsencePlate,
      this.nameTruck,
      this.date,
      this.inKm,
      this.outKm,
      this.laps,
      this.fuel,
      this.oilM,
      this.graseM,
      this.hydraulicM);

  printData() {
    var data = [
      numberGuide,
      driverName,
      observations,
      linsencePlate,
      nameTruck,
      date,
      inKm,
      outKm,
      laps,
      fuel,
      oilM,
      graseM,
      hydraulicM
    ];
    return data;
  }
}
