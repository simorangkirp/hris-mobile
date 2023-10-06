import '../../../../lib.dart';

class ApprovalCountModel extends ApprovalCountEntity {
  const ApprovalCountModel({
    required String jenis,
    required String jumlah,
  });
  ApprovalCountModel.fromJson(Map<String, dynamic> json)
      : super(
          jenis: json["jenis"],
          jumlah: json["jumlah"].toString(),
        );
}
