import 'package:equatable/equatable.dart';

class ApprovalCountEntity extends Equatable {
  final String? jenis;
  final String? jumlah;

  const ApprovalCountEntity({
    this.jenis,
    this.jumlah,
  });

  @override
  List<Object?> get props => [
        jenis,
        jumlah,
      ];
}
