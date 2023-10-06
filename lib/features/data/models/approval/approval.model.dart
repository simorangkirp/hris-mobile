
import '../../../../lib.dart';

class ApprovalModel extends ApprovalEntity {
  const ApprovalModel({
    required String tipe,
    required List<ApprovalDetail> detail,
  });

  ApprovalModel.fromJson(Map<String, dynamic> map)
      : super(
          tipe: map["tipe"],
          detail: List<ApprovalDetail>.from(
            map["detail"].map(
              (x) => ApprovalDetail.fromJson(x),
            ),
          ),
        );
}

class ApprovalDetailModel extends ApprovalDetailEntity {
  const ApprovalDetailModel({
    required String id,
    required String type,
    required ApprovalDatadetail datadetail,
    required List<ListApprovalDataDetail> listapproval,
    required List<ApprovalDetailFileupload> fileupload,
  });

  ApprovalDetailModel.fromJson(Map<String, dynamic> map)
      : super(
          id: map["id"],
          type: map["type"],
          datadetail: map['datadetail'] != null
              ? ApprovalDatadetail.fromMap(map['datadetail'])
              : null,
          listapproval: List<ListApprovalDataDetail>.from(
            map["listapproval"].map(
              (x) => ListApprovalDataDetail.fromMap(x),
            ),
          ),
          fileupload: List<ApprovalDetailFileupload>.from(
            map["fileupload"].map(
              (x) => ApprovalDetailFileupload.fromMap(x),
            ),
          ),
        );
}
