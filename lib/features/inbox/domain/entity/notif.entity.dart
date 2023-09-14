import 'package:equatable/equatable.dart';

class NotifEntity extends Equatable {
  final String? id;
  final String? noreferensi;
  final String? kodenotif;
  final String? karyawanid;
  final String? detail;
  final String? tipekaryawan;
  final String? kodejabatan;
  final String? sendto;
  final String? senduserid;
  final String? status;
  final String? show;
  final String? tanggal;

  const NotifEntity({
    this.id,
    this.noreferensi,
    this.kodenotif,
    this.karyawanid,
    this.detail,
    this.tipekaryawan,
    this.kodejabatan,
    this.sendto,
    this.senduserid,
    this.status,
    this.show,
    this.tanggal,
  });

  @override
  List<Object?> get props => [
        id,
        noreferensi,
        kodenotif,
        karyawanid,
        detail,
        tipekaryawan,
        kodejabatan,
        sendto,
        senduserid,
        status,
        show,
        tanggal,
      ];
}
