import '../../domain/entities/absent.dart';

class AbsentListModel extends AbsentEntity {
  const AbsentListModel({
    required String tanggal,
    required AbsentData data,
  });

  AbsentListModel.fromJson(Map<String, dynamic> map)
      : super(
          tanggal: map['tanggal'] ?? "",
          data: map['data'] != null ? AbsentData.fromJson(map['data']) : null,
        );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['tanggal'] = tanggal;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}
