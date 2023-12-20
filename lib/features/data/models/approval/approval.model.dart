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

class ApprovalListParams {
  String? uid;
  String? kodejenis;
  String? onmobile;
  ApprovalListParams(this.uid, this.kodejenis, this.onmobile);
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['uid'] = uid ?? "";
    data['kodejenis'] = kodejenis ?? "";
    data['onmobile'] = '1';
    return data;
  }
}

class ApprovalDataDetailParams {
  //   @JsonKey(name: 'uid')
  String? uid;
//   @JsonKey(name: 'id')
  String? id;
//   @JsonKey(name: 'notransaksi')
  String? txn;
//   @JsonKey(name: 'onmobile')

  ApprovalDataDetailParams(this.uid, this.id, this.txn);
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['uid'] = uid ?? "";
    data['id'] = id ?? "";
    data['notransaksi'] = txn ?? "";
    data['onmobile'] = '1';
    return data;
  }
}

class ApprvSubmitParams {
  String? uid;
  String? id;
  String? sts;
  String? desc;
  String? spc;

  ApprvSubmitParams(
    this.uid,
    this.id,
    this.sts,
    this.desc,
    this.spc,
  );
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['uid'] = uid ?? "";
    data['id'] = id ?? "";
    data['status'] = sts ?? "";
    data['keterangan'] = desc ?? "";
    data['spcparams'] = spc ?? "";
    return data;
  }
}
