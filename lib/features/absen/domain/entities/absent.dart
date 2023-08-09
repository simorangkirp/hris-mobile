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
  String? namaIn;

  AbsentData({
    this.absenIdIn,
    this.absenIdOut,
    this.hrIn,
    this.hrOut,
    this.kodeIn,
    this.kodeOut,
    this.namaOut,
    this.namaIn,
  });

  AbsentData.fromJson(Map<String, dynamic> map) {
    absenIdIn = map['absenid-in'];
    hrIn = map['in'];
    kodeIn = map['kodein'];
    namaIn = map['namain'];
    absenIdOut = map['absenid-out'];
    hrOut = map['out'];
    kodeOut = map['kodeout'];
    namaOut = map['namaout'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['absenid-in'] = absenIdIn;
    data['in'] = hrIn;
    data['kodein'] = kodeIn;
    data['namain'] = namaIn;
    data['absenid-out'] = absenIdOut;
    data['out'] = hrOut;
    data['kodeout'] = kodeOut;
    data['namaout'] = namaOut;
    return data;
  }
}
