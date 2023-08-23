import '../../domain/domain.dart';

class JobModels extends JobEntity {
  const JobModels({
    required String karyawanid,
    required String nik,
    required String namakaryawan,
    required String nickname,
    required List<DataDetails> dataDetails,
  });

  // JobModels.fromJson(Map<String, dynamic> map)
  //     : super(
  //         karyawanid: map['karyawanid'] ?? "",
  //         nik: map['nik'] ?? "",
  //         namakaryawan: map['namakaryawan'] ?? "",
  //         nickname: map['nickname'] ?? "",
  //         dataDetails: map['data_details'] != null ? DataDetails.fromJson(map['data']) : null,
  //       );

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = {};
  //   data['tanggal'] = tanggal;
  //   if (this.data != null) {
  //     data['data'] = this.data!.toJson();
  //   }
  //   return data;
  // }
}

class ActivePeriodModel extends ActivePeriodEntity {
  const ActivePeriodModel({
    required String kodeorg,
    required String periode,
    required String tanggalmulai,
    required String tanggalsampai,
    required String sudahproses,
    required String jenisgaji,
  });

  ActivePeriodModel.fromJson(Map<String, dynamic> map)
      : super(
          kodeorg: map['kodeorg'] ?? "",
          periode: map['periode'] ?? "",
          tanggalmulai: map['tanggalmulai'] ?? "",
          tanggalsampai: map['tanggalsampai'] ?? "",
          sudahproses: map['sudahproses'] ?? "",
          jenisgaji: map['jenisgaji'] ?? "",
        );
  // {
  //   kodeorg = json['kodeorg'];
  //   periode = json['periode'];
  //   tanggalmulai = json['tanggalmulai'];
  //   tanggalsampai = json['tanggalsampai'];
  //   sudahproses = json['sudahproses'];
  //   jenisgaji = json['jenisgaji'];
  // }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['kodeorg'] = kodeorg;
    data['periode'] = periode;
    data['tanggalmulai'] = tanggalmulai;
    data['tanggalsampai'] = tanggalsampai;
    data['sudahproses'] = sudahproses;
    data['jenisgaji'] = jenisgaji;
    return data;
  }
}
