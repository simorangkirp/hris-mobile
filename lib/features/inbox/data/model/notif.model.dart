import 'package:owl_hris/features/features.dart';

class NotifModel extends NotifEntity {
  const NotifModel({
    required String id,
    required String noreferensi,
    required String kodenotif,
    required String karyawanid,
    required String detail,
    required String tipekaryawan,
    required String kodejabatan,
    required String sendto,
    required String senduserid,
    required String status,
    required String show,
    required String tanggal,
  });

  NotifModel.fromJson(Map<String, dynamic> json)
      : super(
          id: json["id"],
          noreferensi: json["noreferensi"],
          kodenotif: json["kodenotif"],
          karyawanid: json["karyawanid"],
          detail: json["detail"],
          tipekaryawan: json["tipekaryawan"],
          kodejabatan: json["kodejabatan"],
          sendto: json["sendto"],
          senduserid: json["senduserid"],
          status: json["status"],
          show: json["show"],
          tanggal: json["tanggal"],
        );

  // Map<String, dynamic> toMap() => {
  //       "id": id,
  //       "noreferensi": noreferensi,
  //       "kodenotif": kodenotif,
  //       "karyawanid": karyawanid,
  //       "detail": detail,
  //       "tipekaryawan": tipekaryawan,
  //       "kodejabatan": kodejabatan,
  //       "sendto": sendto,
  //       "senduserid": senduserid,
  //       "status": status,
  //       "show": show,
  //       "tanggal": tanggal.toIso8601String(),
  //     };
}

class GroupNotifModel {
  String date;
  List<NotifEntity> list;

  GroupNotifModel(
    this.date,
    this.list,
  );
}
