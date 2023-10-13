class UserAssignLocationModel {
  String? notransaksi;
  String? kodecustomer;
  String? namacustomer;
  String? tgldari;
  String? tglsampai;
  String? statuspengajuan;
  String? statusconfirm;
  String? statusrealisasi;

  UserAssignLocationModel({
    this.notransaksi,
    this.kodecustomer,
    this.namacustomer,
    this.tgldari,
    this.tglsampai,
    this.statuspengajuan,
    this.statusconfirm,
    this.statusrealisasi,
  });

  UserAssignLocationModel.fromMap(Map<String, dynamic> json) {
    notransaksi = json["notransaksi"];
    kodecustomer = json["kodecustomer"];
    namacustomer = json["namacustomer"];
    tgldari = json["tgldari"];
    tglsampai = json["tglsampai"];
    statuspengajuan = json["statuspengajuan"];
    statusconfirm = json["statusconfirm"];
    statusrealisasi = json["statusrealisasi"];
  }

  Map<String, dynamic> toMap() => {
        "notransaksi": notransaksi,
        "kodecustomer": kodecustomer,
        "namacustomer": namacustomer,
        "tgldari": tgldari,
        "tglsampai": tglsampai,
        "statuspengajuan": statuspengajuan,
        "statusconfirm": statusconfirm,
        "statusrealisasi": statusrealisasi,
      };
}