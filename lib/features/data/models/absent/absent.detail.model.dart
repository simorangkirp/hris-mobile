class AbsentDetail {
  String? absenid;
  String? kodeorg;
  String? karyawanid;
  String? periode;
  String? tanggal;
  String? shiftid;
  String? absensi;
  String? inoutmode;
  String? jam;
  String? kodecustomer;
  String? coordinate;
  String? coorphoto;
  String? photo;
  String? keterangan;
  String? source;
  String? fingerverif;
  String? posting;
  String? createdAt;
  String? createdBy;
  String? updatedAt;
  String? updatedBy;
  String? namashift;
  String? namaabsen;
  String? namacustomer;

  AbsentDetail({
    this.absenid,
    this.kodeorg,
    this.karyawanid,
    this.periode,
    this.tanggal,
    this.shiftid,
    this.absensi,
    this.inoutmode,
    this.jam,
    this.kodecustomer,
    this.coordinate,
    this.coorphoto,
    this.photo,
    this.keterangan,
    this.source,
    this.fingerverif,
    this.posting,
    this.createdAt,
    this.createdBy,
    this.updatedAt,
    this.updatedBy,
    this.namashift,
    this.namaabsen,
    this.namacustomer,
  });

  AbsentDetail.fromMap(Map<String, dynamic> json) {
    absenid = json["absenid"];
    kodeorg = json["kodeorg"];
    karyawanid = json["karyawanid"];
    periode = json["periode"];
    tanggal = json["tanggal"];
    shiftid = json["shiftid"];
    absensi = json["absensi"];
    inoutmode = json["inoutmode"];
    jam = json["jam"];
    kodecustomer = json["kodecustomer"];
    coordinate = json["coordinate"];
    coorphoto = json["coorphoto"];
    photo = json["photo"];
    keterangan = json["keterangan"];
    source = json["source"];
    fingerverif = json["fingerverif"];
    posting = json["posting"];
    createdAt = json["created_at"];
    createdBy = json["created_by"];
    updatedAt = json["updated_at"];
    updatedBy = json["updated_by"];
    namashift = json["namashift"];
    namaabsen = json["namaabsen"];
    namacustomer = json["namacustomer"];
  }

  Map<String, dynamic> toMap() => {
        "absenid": absenid,
        "kodeorg": kodeorg,
        "karyawanid": karyawanid,
        "periode": periode,
        "tanggal": tanggal,
        "shiftid": shiftid,
        "absensi": absensi,
        "inoutmode": inoutmode,
        "jam": jam,
        "kodecustomer": kodecustomer,
        "coordinate": coordinate,
        "coorphoto": coorphoto,
        "photo": photo,
        "keterangan": keterangan,
        "source": source,
        "fingerverif": fingerverif,
        "posting": posting,
        "created_at": createdAt,
        "created_by": createdBy,
        "updated_at": updatedAt,
        "updated_by": updatedBy,
        "namashift": namashift,
        "namaabsen": namaabsen,
        "namacustomer": namacustomer,
      };
}
