class HolidayModel {
  String? tanggal;
  String? keterangan;
  bool? stpotongjam;
  String? potongjam;

  HolidayModel({
    this.tanggal,
    this.keterangan,
    this.stpotongjam,
    this.potongjam,
  });

  HolidayModel.fromMap(Map<String, dynamic> json) {
    tanggal = json["tanggal"];
    keterangan = json["keterangan"];
    stpotongjam = json["stpotongjam"] ?? true;
    potongjam = json["potongjam"];
  }

  Map<String, dynamic> toMap() => {
        "tanggal": tanggal,
        "keterangan": keterangan,
        "stpotongjam": stpotongjam,
        "potongjam": potongjam,
      };
}
