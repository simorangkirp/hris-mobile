import 'package:equatable/equatable.dart';

class AbsentEntity extends Equatable {
  final String? tanggal;
  final AbsentData? data;

  const AbsentEntity({
    this.tanggal,
    this.data,
  });

  @override
  List<Object?> get props {
    return [
      tanggal,
      data,
    ];
  }
}

class AbsentData {
  String? absenIdIn;
  String? hrIn;
  String? kodeIn;
  String? absenIdOut;
  String? hrOut;
  String? kodeOut;
  String? namaOut;

  AbsentData({
    this.absenIdIn,
    this.absenIdOut,
    this.hrIn,
    this.hrOut,
    this.kodeIn,
    this.kodeOut,
    this.namaOut,
  });
}
