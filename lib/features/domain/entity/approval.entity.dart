import 'package:equatable/equatable.dart';

class ApprovalEntity extends Equatable {
  final String? tipe;
  final List<ApprovalDetail>? detail;

  const ApprovalEntity({
    this.tipe,
    this.detail,
  });

  @override
  List<Object?> get props => [tipe, detail];
}

class ApprovalDetail {
  String? id;
  String? notransaksi;
  String? karyawanid;
  String? namakaryawan;
  String? jenispersetujuan;
  String? namajenis;
  String? level;
  String? status;

  ApprovalDetail({
    this.id,
    this.notransaksi,
    this.karyawanid,
    this.namakaryawan,
    this.jenispersetujuan,
    this.namajenis,
    this.level,
    this.status,
  });

  ApprovalDetail.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    notransaksi = json["notransaksi"];
    karyawanid = json["karyawanid"];
    namakaryawan = json["namakaryawan"];
    jenispersetujuan = json["jenispersetujuan"];
    namajenis = json["namajenis"];
    level = json["level"];
    status = json["status"];
  }

  Map<String, dynamic> toMap() => {
        "id": id,
        "notransaksi": notransaksi,
        "karyawanid": karyawanid,
        "namakaryawan": namakaryawan,
        "jenispersetujuan": jenispersetujuan,
        "namajenis": namajenis,
        "level": level,
        "status": status,
      };
}

class ApprovalDetailEntity extends Equatable {
  final String? id;
  final String? type;
  final ApprovalDatadetail? datadetail;
  final List<ListApprovalDataDetail>? listapproval;
  final List<ApprovalDetailFileupload>? fileupload;

  const ApprovalDetailEntity({
    this.id,
    this.type,
    this.datadetail,
    this.listapproval,
    this.fileupload,
  });

  @override
  List<Object?> get props => [
        id,
        type,
        datadetail,
        listapproval,
        fileupload,
      ];
}

class ApprovalDatadetail {
  String? notransaksi;
  String? karyawanid;
  String? lokasitugas;
  String? tipekaryawan;
  String? tglpengajuan;
  String? keterangan;
  String? tgldari;
  String? tglsampai;
  String? tgldarireal;
  String? tglsampaireal;
  String? idjenis;
  String? periodecuti;
  String? jumlahhari;
  String? tglmulaikerja;
  String? pengganti;
  String? statuspotongan;
  String? potonggaji;
  String? statuspersetujuan;
  String? statusbatal;
  String? alasanbatal;
  String? isActive;
  String? createdAt;
  String? createdBy;
  String? updatedAt;
  String? updatedBy;
  String? jenisijin;
  String? jeniskehadiran;
  String? namakaryawan;
  String? namapengganti;
  String? kelompokizin;

  ApprovalDatadetail({
    this.notransaksi,
    this.karyawanid,
    this.lokasitugas,
    this.tipekaryawan,
    this.tglpengajuan,
    this.keterangan,
    this.tgldari,
    this.tglsampai,
    this.tgldarireal,
    this.tglsampaireal,
    this.idjenis,
    this.periodecuti,
    this.jumlahhari,
    this.tglmulaikerja,
    this.pengganti,
    this.statuspotongan,
    this.potonggaji,
    this.statuspersetujuan,
    this.statusbatal,
    this.alasanbatal,
    this.isActive,
    this.createdAt,
    this.createdBy,
    this.updatedAt,
    this.updatedBy,
    this.jenisijin,
    this.jeniskehadiran,
    this.namakaryawan,
    this.namapengganti,
    this.kelompokizin,
  });

  ApprovalDatadetail.fromMap(Map<String, dynamic> json) {
    notransaksi = json["notransaksi"];
    karyawanid = json["karyawanid"];
    lokasitugas = json["lokasitugas"];
    tipekaryawan = json["tipekaryawan"];
    tglpengajuan = json["tglpengajuan"];
    keterangan = json["keterangan"];
    tgldari = json["tgldari"];
    tglsampai = json["tglsampai"];
    tgldarireal = json["tgldarireal"];
    tglsampaireal = json["tglsampaireal"];
    idjenis = json["idjenis"];
    periodecuti = json["periodecuti"];
    jumlahhari = json["jumlahhari"];
    tglmulaikerja = json["tglmulaikerja"];
    pengganti = json["pengganti"];
    statuspotongan = json["statuspotongan"];
    potonggaji = json["potonggaji"];
    statuspersetujuan = json["statuspersetujuan"];
    statusbatal = json["statusbatal"];
    alasanbatal = json["alasanbatal"];
    isActive = json["is_active"];
    createdAt = json["created_at"];
    createdBy = json["created_by"];
    updatedAt = json["updated_at"];
    updatedBy = json["updated_by"];
    jenisijin = json["jenisijin"];
    jeniskehadiran = json["jeniskehadiran"];
    namakaryawan = json["namakaryawan"];
    namapengganti = json["namapengganti"];
    kelompokizin = json["kelompokizin"];
  }

  Map<String, dynamic> toMap() => {
        "notransaksi": notransaksi,
        "karyawanid": karyawanid,
        "lokasitugas": lokasitugas,
        "tipekaryawan": tipekaryawan,
        "tglpengajuan": tglpengajuan,
        "keterangan": keterangan,
        "tgldari": tgldari,
        "tglsampai": tglsampai,
        "tgldarireal": tgldarireal,
        "tglsampaireal": tglsampaireal,
        "idjenis": idjenis,
        "periodecuti": periodecuti,
        "jumlahhari": jumlahhari,
        "tglmulaikerja": tglmulaikerja,
        "pengganti": pengganti,
        "statuspotongan": statuspotongan,
        "potonggaji": potonggaji,
        "statuspersetujuan": statuspersetujuan,
        "statusbatal": statusbatal,
        "alasanbatal": alasanbatal,
        "is_active": isActive,
        "created_at": createdAt,
        "created_by": createdBy,
        "updated_at": updatedAt,
        "updated_by": updatedBy,
        "jenisijin": jenisijin,
        "jeniskehadiran": jeniskehadiran,
        "namakaryawan": namakaryawan,
        "namapengganti": namapengganti,
        "kelompokizin": kelompokizin,
      };
}

class ApprovalDetailFileupload {
  String? id;
  String? noreferensi;
  String? type;
  String? value;
  String? isActive;
  String? createdAt;
  String? createdBy;
  String? updatedAt;
  String? updatedBy;

  ApprovalDetailFileupload({
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

  ApprovalDetailFileupload.fromMap(Map<String, dynamic> json) {
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

class ListApprovalDataDetail {
  String? level;
  List<ListElementApprovalDetail>? list;

  ListApprovalDataDetail({
    this.level,
    this.list,
  });

  factory ListApprovalDataDetail.fromMap(Map<String, dynamic> json) =>
      ListApprovalDataDetail(
        level: json["level"],
        list: List<ListElementApprovalDetail>.from(
            json["list"].map((x) => ListElementApprovalDetail.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "level": level,
        "list": list != null ? List<dynamic>.from(list!.map((x) => x.toMap())) : null,
      };
}

class ListElementApprovalDetail {
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
  String? namastatus;
  String? komentar;
  String? keterangan;

  ListElementApprovalDetail({
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
    this.namastatus,
    this.komentar,
    this.keterangan,
  });

  ListElementApprovalDetail.fromMap(Map<String, dynamic> json) {
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
    namastatus = json["namastatus"];
    komentar = json["komentar"];
    keterangan = json["keterangan"];
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
        "namastatus": namastatus,
        "komentar": komentar,
        "keterangan": keterangan,
      };
}
