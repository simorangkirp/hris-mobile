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
