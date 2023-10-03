class PaidLeaveCatDetail {
  String? idjenis;
  String? jenisijin;
  String? statuspotongan;
  String? potonganhak;
  String? jeniskehadiran;
  String? hakcuti;
  String? kelompokizin;

  PaidLeaveCatDetail({
    this.idjenis,
    this.jenisijin,
    this.statuspotongan,
    this.potonganhak,
    this.jeniskehadiran,
    this.hakcuti,
    this.kelompokizin,
  });

  PaidLeaveCatDetail.fromMap(Map<String, dynamic> json) {
    idjenis = json["idjenis"];
    jenisijin = json["jenisijin"];
    statuspotongan = json["statuspotongan"];
    potonganhak = json["potonganhak"];
    jeniskehadiran = json["jeniskehadiran"];
    hakcuti = json["hakcuti"];
    kelompokizin = json["kelompokizin"];
  }

  Map<String, dynamic> toMap() => {
        "idjenis": idjenis,
        "jenisijin": jenisijin,
        "statuspotongan": statuspotongan,
        "potonganhak": potonganhak,
        "jeniskehadiran": jeniskehadiran,
        "hakcuti": hakcuti,
        "kelompokizin": kelompokizin,
      };
}

class PaidLeavePlafond {
  String? karyawanid;
  String? periodecuti;
  String? keterangan;
  String? dari;
  String? sampai;
  String? hakcuti;
  String? diambil;
  String? adjustment;
  String? sisa;
  String? lock;

  PaidLeavePlafond({
    this.karyawanid,
    this.periodecuti,
    this.keterangan,
    this.dari,
    this.sampai,
    this.hakcuti,
    this.diambil,
    this.adjustment,
    this.sisa,
    this.lock,
  });

  PaidLeavePlafond.fromMap(Map<String, dynamic> json) {
    karyawanid = json["karyawanid"];
    periodecuti = json["periodecuti"];
    keterangan = json["keterangan"];
    dari = json["dari"];
    sampai = json["sampai"];
    hakcuti = json["hakcuti"];
    diambil = json["diambil"];
    adjustment = json["adjustment"];
    sisa = json["sisa"];
    lock = json["lock"];
  }

  Map<String, dynamic> toMap() => {
        "karyawanid": karyawanid,
        "periodecuti": periodecuti,
        "keterangan": keterangan,
        "dari": dari,
        "sampai": sampai,
        "hakcuti": hakcuti,
        "diambil": diambil,
        "adjustment": adjustment,
        "sisa": sisa,
        "lock": lock,
      };
}

class PaidLeaveListData {
  String? notransaksi;
  String? idjenis;
  String? jenisijin;
  String? tglpengajuan;
  String? tgldari;
  String? tglsampai;
  String? tgldarireal;
  String? tglsampaireal;
  String? statuspersetujuan;
  String? namastatus;

  PaidLeaveListData({
    this.notransaksi,
    this.idjenis,
    this.jenisijin,
    this.tglpengajuan,
    this.tgldari,
    this.tglsampai,
    this.tgldarireal,
    this.tglsampaireal,
    this.statuspersetujuan,
    this.namastatus,
  });

  PaidLeaveListData.fromMap(Map<String, dynamic> json) {
    notransaksi = json["notransaksi"];
    idjenis = json["idjenis"];
    jenisijin = json["jenisijin"];
    tglpengajuan = json["tglpengajuan"];
    tgldari = json["tgldari"];
    tglsampai = json["tglsampai"];
    tgldarireal = json["tgldarireal"];
    tglsampaireal = json["tglsampaireal"];
    statuspersetujuan = json["statuspersetujuan"];
    namastatus = json["namastatus"];
  }

  Map<String, dynamic> toMap() => {
        "notransaksi": notransaksi,
        "idjenis": idjenis,
        "jenisijin": jenisijin,
        "tglpengajuan": tglpengajuan,
        "tgldari": tgldari,
        "tglsampai": tglsampai,
        "tgldarireal": tgldarireal,
        "tglsampaireal": tglsampaireal,
        "statuspersetujuan": statuspersetujuan,
        "namastatus": namastatus,
      };
}

class PaidLeaveCategory {
  String? kelompokizin;
  PaidLeaveCategory({
    this.kelompokizin,
  });
  PaidLeaveCategory.fromMap(Map<String, dynamic> json) {
    kelompokizin = json["kelompokizin"];
  }
  Map<String, dynamic> toMap() => {
        "kelompokizin": kelompokizin,
      };
}

class PaidLeaveDataDetail {
  String? notransaksi;
  String? karyawanid;
  String? namakaryawan;
  String? lokasitugas;
  String? tglpengajuan;
  String? keterangan;
  String? tgldari;
  String? tgldarireal;
  String? tglsampai;
  String? tglsampaireal;
  String? kelompokizin;
  String? idjenis;
  String? namajenis;
  String? periodecuti;
  String? jumlahhari;
  String? tglmulaikerja;
  String? namapengganti;
  String? statuspotongan;
  String? statuspersetujuan;
  String? msgpersetujuan;
  List<PaidLeaveApproval>? approval;
  List<PaidLeaveFileUpload>? fileupload;
  String? statusbatal;
  String? createdAt;
  String? createdBy;
  String? updatedAt;
  String? updatedBy;

  PaidLeaveDataDetail({
    this.notransaksi,
    this.karyawanid,
    this.namakaryawan,
    this.lokasitugas,
    this.tglpengajuan,
    this.keterangan,
    this.tgldari,
    this.tgldarireal,
    this.tglsampai,
    this.tglsampaireal,
    this.kelompokizin,
    this.idjenis,
    this.namajenis,
    this.periodecuti,
    this.jumlahhari,
    this.tglmulaikerja,
    this.namapengganti,
    this.statuspotongan,
    this.statuspersetujuan,
    this.msgpersetujuan,
    this.approval,
    this.fileupload,
    this.statusbatal,
    this.createdAt,
    this.createdBy,
    this.updatedAt,
    this.updatedBy,
  });

  PaidLeaveDataDetail.fromMap(Map<String, dynamic> json) {
    notransaksi = json["notransaksi"];
    karyawanid = json["karyawanid"];
    namakaryawan = json["namakaryawan"];
    lokasitugas = json["lokasitugas"];
    tglpengajuan = json["tglpengajuan"];
    keterangan = json["keterangan"];
    tgldari = json["tgldari"];
    tgldarireal = json["tgldarireal"];
    tglsampai = json["tglsampai"];
    tglsampaireal = json["tglsampaireal"];
    kelompokizin = json["kelompokizin"];
    idjenis = json["idjenis"];
    namajenis = json["namajenis"];
    periodecuti = json["periodecuti"];
    jumlahhari = json["jumlahhari"];
    tglmulaikerja = json["tglmulaikerja"];
    namapengganti = json["namapengganti"];
    statuspotongan = json["statuspotongan"];
    statuspersetujuan = json["statuspersetujuan"];
    msgpersetujuan = json["msgpersetujuan"];
    approval = List<PaidLeaveApproval>.from(
        json["approval"].map((x) => PaidLeaveApproval.fromMap(x)));
    fileupload = List<PaidLeaveFileUpload>.from(
        json["fileupload"].map((x) => PaidLeaveFileUpload.fromMap(x)));
    statusbatal = json["statusbatal"];
    createdAt = json["created_at"];
    createdBy = json["created_by"];
    updatedAt = json["updated_at"];
    updatedBy = json["updated_by"];
  }

  Map<String, dynamic> toMap() => {
        "notransaksi": notransaksi,
        "karyawanid": karyawanid,
        "namakaryawan": namakaryawan,
        "lokasitugas": lokasitugas,
        "tglpengajuan": tglpengajuan,
        "keterangan": keterangan,
        "tgldari": tgldari,
        "tgldarireal": tgldarireal,
        "tglsampai": tglsampai,
        "tglsampaireal": tglsampaireal,
        "kelompokizin": kelompokizin,
        "idjenis": idjenis,
        "namajenis": namajenis,
        "periodecuti": periodecuti,
        "jumlahhari": jumlahhari,
        "tglmulaikerja": tglmulaikerja,
        "namapengganti": namapengganti,
        "statuspotongan": statuspotongan,
        "statuspersetujuan": statuspersetujuan,
        "msgpersetujuan": msgpersetujuan,
        "approval": approval != null
            ? List<PaidLeaveApproval>.from(approval!.map((x) => x.toMap()))
            : [],
        "fileupload": fileupload != null
            ? List<PaidLeaveFileUpload>.from(fileupload!.map((x) => x.toMap()))
            : [],
        "statusbatal": statusbatal,
        "created_at": createdAt,
        "created_by": createdBy,
        "updated_at": updatedAt,
        "updated_by": updatedBy,
      };
}

class PaidLeaveApproval {
  String? id;
  String? notransaksi;
  String? jenispersetujuan;
  String? namaijin;
  String? level;
  String? karyawanid;
  String? namakaryawan;
  String? penyetuju;
  String? namapenyetuju;
  String? status;
  String? komentar;
  String? keterangan;
  String? tglpengajuan;
  String? tglupdate;

  PaidLeaveApproval({
    this.id,
    this.notransaksi,
    this.jenispersetujuan,
    this.namaijin,
    this.level,
    this.karyawanid,
    this.namakaryawan,
    this.penyetuju,
    this.namapenyetuju,
    this.status,
    this.komentar,
    this.keterangan,
    this.tglpengajuan,
    this.tglupdate,
  });

  PaidLeaveApproval.fromMap(Map<String, dynamic> json) {
    id = json["id"];
    notransaksi = json["notransaksi"];
    jenispersetujuan = json["jenispersetujuan"];
    namaijin = json["namaijin"];
    level = json["level"];
    karyawanid = json["karyawanid"];
    namakaryawan = json["namakaryawan"];
    penyetuju = json["penyetuju"];
    namapenyetuju = json["namapenyetuju"];
    status = json["status"];
    komentar = json["komentar"];
    keterangan = json["keterangan"];
    tglpengajuan = json["tglpengajuan"];
    tglupdate = json["tglupdate"];
  }

  Map<String, dynamic> toMap() => {
        "id": id,
        "notransaksi": notransaksi,
        "jenispersetujuan": jenispersetujuan,
        "namaijin": namaijin,
        "level": level,
        "karyawanid": karyawanid,
        "namakaryawan": namakaryawan,
        "penyetuju": penyetuju,
        "namapenyetuju": namapenyetuju,
        "status": status,
        "komentar": komentar,
        "keterangan": keterangan,
        "tglpengajuan": tglpengajuan,
        "tglupdate": tglupdate,
      };
}

class PaidLeaveFileUpload {
  String? id;
  String? noreferensi;
  String? type;
  String? value;
  String? isActive;
  String? createdAt;
  String? createdBy;
  String? updatedAt;
  String? updatedBy;

  PaidLeaveFileUpload({
    this.id,
    this.noreferensi,
    this.type,
    this.value,
    this.isActive,
    this.createdAt,
    this.createdBy,
    this.updatedAt,
    this.updatedBy,
  });

  PaidLeaveFileUpload.fromMap(Map<String, dynamic> json) {
    id = json["id"];
    noreferensi = json["noreferensi"];
    type = json["type"];
    value = json["value"];
    isActive = json["is_active"];
    createdAt = json["created_at"];
    createdBy = json["created_by"];
    updatedAt = json["updated_at"];
    updatedBy = json["updated_by"];
  }

  Map<String, dynamic> toMap() => {
        "id": id,
        "noreferensi": noreferensi,
        "type": type,
        "value": value,
        "is_active": isActive,
        "created_at": createdAt,
        "created_by": createdBy,
        "updated_at": updatedAt,
        "updated_by": updatedBy,
      };
}
