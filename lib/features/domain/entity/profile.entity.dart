import 'package:equatable/equatable.dart';

class JobEntity extends Equatable {
  final String? karyawanid;
  final String? nik;
  final String? namakaryawan;
  final String? nickname;
  final List<DataDetails>? dataDetails;

  const JobEntity({
    this.karyawanid,
    this.nik,
    this.namakaryawan,
    this.nickname,
    this.dataDetails,
  });

  @override
  List<Object?> get props => [
        karyawanid,
        nik,
        namakaryawan,
        nickname,
        dataDetails,
      ];
}

class DataDetails {
  String? id;
  String? karyawanid;
  String? namaperusahaan;
  String? bidangusaha;
  String? bulanmasuk;
  String? bulankeluar;
  String? jabatan;
  String? bagian;
  String? masakerja;
  String? alamatperusahaan;

  DataDetails(
      {this.id,
      this.karyawanid,
      this.namaperusahaan,
      this.bidangusaha,
      this.bulanmasuk,
      this.bulankeluar,
      this.jabatan,
      this.bagian,
      this.masakerja,
      this.alamatperusahaan});

  DataDetails.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    karyawanid = json['karyawanid'];
    namaperusahaan = json['namaperusahaan'];
    bidangusaha = json['bidangusaha'];
    bulanmasuk = json['bulanmasuk'];
    bulankeluar = json['bulankeluar'];
    jabatan = json['jabatan'];
    bagian = json['bagian'];
    masakerja = json['masakerja'];
    alamatperusahaan = json['alamatperusahaan'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['karyawanid'] = karyawanid;
    data['namaperusahaan'] = namaperusahaan;
    data['bidangusaha'] = bidangusaha;
    data['bulanmasuk'] = bulanmasuk;
    data['bulankeluar'] = bulankeluar;
    data['jabatan'] = jabatan;
    data['bagian'] = bagian;
    data['masakerja'] = masakerja;
    data['alamatperusahaan'] = alamatperusahaan;
    return data;
  }
}

class FamilyEntity extends Equatable{
  final String? karyawanid;
  final String? nik;
  final String? namakaryawan;
  final String? nickname;
  final List<FamilyDetails>? dataDetails;

  const FamilyEntity({
    this.karyawanid,
    this.nik,
    this.namakaryawan,
    this.nickname,
    this.dataDetails,
  });
  
  @override
  List<Object?> get props => [
    karyawanid,
    nik,
    namakaryawan,
    nickname,
    dataDetails,
  ];
}

class FamilyDetails {
  String? id;
  String? karyawanid;
  String? nama;
  String? jeniskelamin;
  String? tempatlahir;
  String? tanggallahir;
  String? hubungankeluarga;
  String? status;
  String? levelpendidikan;
  String? pekerjaan;
  String? telp;
  String? email;
  String? tanggungan;

  FamilyDetails(
      {this.id,
      this.karyawanid,
      this.nama,
      this.jeniskelamin,
      this.tempatlahir,
      this.tanggallahir,
      this.hubungankeluarga,
      this.status,
      this.levelpendidikan,
      this.pekerjaan,
      this.telp,
      this.email,
      this.tanggungan});

  FamilyDetails.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    karyawanid = json['karyawanid'];
    nama = json['nama'];
    jeniskelamin = json['jeniskelamin'];
    tempatlahir = json['tempatlahir'];
    tanggallahir = json['tanggallahir'];
    hubungankeluarga = json['hubungankeluarga'];
    status = json['status'];
    levelpendidikan = json['levelpendidikan'];
    pekerjaan = json['pekerjaan'];
    telp = json['telp'];
    email = json['email'];
    tanggungan = json['tanggungan'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['karyawanid'] = karyawanid;
    data['nama'] = nama;
    data['jeniskelamin'] = jeniskelamin;
    data['tempatlahir'] = tempatlahir;
    data['tanggallahir'] = tanggallahir;
    data['hubungankeluarga'] = hubungankeluarga;
    data['status'] = status;
    data['levelpendidikan'] = levelpendidikan;
    data['pekerjaan'] = pekerjaan;
    data['telp'] = telp;
    data['email'] = email;
    data['tanggungan'] = tanggungan;
    return data;
  }
}

class EducationEntity extends Equatable{
  final String? karyawanid;
  final String? nik;
  final String? namakaryawan;
  final String? nickname;
  final List<EducationDetails>? dataDetails;

  const EducationEntity({
    this.karyawanid,
    this.nik,
    this.namakaryawan,
    this.nickname,
    this.dataDetails,
  });
  
  @override
  List<Object?> get props => [
    karyawanid,
    nik,
    namakaryawan,
    nickname,
    dataDetails,
  ];
}

class EducationDetails {
  String? id;
  String? karyawanid;
  String? levelpendidikan;
  String? spesialisasi;
  String? gelar;
  String? tahunlulus;
  String? namasekolah;
  String? nilai;
  String? kota;
  String? keterangan;

  EducationDetails(
      {this.id,
      this.karyawanid,
      this.levelpendidikan,
      this.spesialisasi,
      this.gelar,
      this.tahunlulus,
      this.namasekolah,
      this.nilai,
      this.kota,
      this.keterangan});

  EducationDetails.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    karyawanid = json['karyawanid'];
    levelpendidikan = json['levelpendidikan'];
    spesialisasi = json['spesialisasi'];
    gelar = json['gelar'];
    tahunlulus = json['tahunlulus'];
    namasekolah = json['namasekolah'];
    nilai = json['nilai'];
    kota = json['kota'];
    keterangan = json['keterangan'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['karyawanid'] = karyawanid;
    data['levelpendidikan'] = levelpendidikan;
    data['spesialisasi'] = spesialisasi;
    data['gelar'] = gelar;
    data['tahunlulus'] = tahunlulus;
    data['namasekolah'] = namasekolah;
    data['nilai'] = nilai;
    data['kota'] = kota;
    data['keterangan'] = keterangan;
    return data;
  }
}

class AddressEntity extends Equatable{
  final String? karyawanid;
  final String? nik;
  final String? namakaryawan;
  final String? nickname;
  final List<AddressDetails>? dataDetails;

  const AddressEntity({
    this.karyawanid,
    this.nik,
    this.namakaryawan,
    this.nickname,
    this.dataDetails,
  });
  
  @override
  List<Object?> get props => [
    karyawanid,
    nik,
    namakaryawan,
    nickname,
    dataDetails,
  ];
}

class AddressDetails {
  String? id;
  String? karyawanid;
  String? alamat;
  String? kota;
  String? kodepos;
  String? telepon;
  String? emplasemen;
  String? aktif;
  String? provinsi;

  AddressDetails(
      {this.id,
      this.karyawanid,
      this.alamat,
      this.kota,
      this.kodepos,
      this.telepon,
      this.emplasemen,
      this.aktif,
      this.provinsi});

  AddressDetails.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    karyawanid = json['karyawanid'];
    alamat = json['alamat'];
    kota = json['kota'];
    kodepos = json['kodepos'];
    telepon = json['telepon'];
    emplasemen = json['emplasemen'];
    aktif = json['aktif'];
    provinsi = json['provinsi'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['karyawanid'] = karyawanid;
    data['alamat'] = alamat;
    data['kota'] = kota;
    data['kodepos'] = kodepos;
    data['telepon'] = telepon;
    data['emplasemen'] = emplasemen;
    data['aktif'] = aktif;
    data['provinsi'] = provinsi;
    return data;
  }
}

class EmerContactEntity extends Equatable{
  final String? karyawanid;
  final String? nik;
  final String? namakaryawan;
  final String? nickname;
  final List<EmerContactDetails>? dataDetails;

  const EmerContactEntity({
    this.karyawanid,
    this.nik,
    this.namakaryawan,
    this.nickname,
    this.dataDetails,
  });
  
  @override
  List<Object?> get props => [
    karyawanid,
    nik,
    namakaryawan,
    nickname,
    dataDetails,
  ];
}

class EmerContactDetails {
  String? id;
  String? karyawanid;
  String? nama;
  String? hubungankeluarga;
  String? telp;
  String? email;

  EmerContactDetails(
      {this.id,
      this.karyawanid,
      this.nama,
      this.hubungankeluarga,
      this.telp,
      this.email});

  EmerContactDetails.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    karyawanid = json['karyawanid'];
    nama = json['nama'];
    hubungankeluarga = json['hubungankeluarga'];
    telp = json['telp'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['karyawanid'] = karyawanid;
    data['nama'] = nama;
    data['hubungankeluarga'] = hubungankeluarga;
    data['telp'] = telp;
    data['email'] = email;
    return data;
  }
}

class PayrollEntity extends Equatable{
  final String? karyawanid;
  final String? nik;
  final String? namakaryawan;
  final String? nickname;
  final List<PayrollDetails>? dataDetails;

  const PayrollEntity({
    this.karyawanid,
    this.nik,
    this.namakaryawan,
    this.nickname,
    this.dataDetails,
  });
  
  @override
  List<Object?> get props => [
    karyawanid,
    nik,
    namakaryawan,
    nickname,
    dataDetails,
  ];
}

class PayrollDetails {
  String? id;
  String? karyawanid;
  String? namabank;
  String? norek;
  String? cabang;

  PayrollDetails(
      {this.id, this.karyawanid, this.namabank, this.norek, this.cabang});

  PayrollDetails.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    karyawanid = json['karyawanid'];
    namabank = json['namabank'];
    norek = json['norek'];
    cabang = json['cabang'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['karyawanid'] = karyawanid;
    data['namabank'] = namabank;
    data['norek'] = norek;
    data['cabang'] = cabang;
    return data;
  }
}

class ActivePeriodEntity extends Equatable{
  final String? kodeorg;
  final String? periode;
  final String? tanggalmulai;
  final String? tanggalsampai;
  final String? sudahproses;
  final String? jenisgaji;

  const ActivePeriodEntity(
      {this.kodeorg,
      this.periode,
      this.tanggalmulai,
      this.tanggalsampai,
      this.sudahproses,
      this.jenisgaji});
  
  @override
  List<Object?> get props => [
    kodeorg,
    periode,
    tanggalmulai,
    tanggalsampai,
    sudahproses,
    jenisgaji,
  ];
}