import 'package:owl_hris/features/features.dart';

class ProfileModel extends EntityProfile {
  const ProfileModel({
    required String karyawanid,
    required String nik,
    required String namakaryawan,
    required String nickname,
    required String tempatlahir,
    required String tanggallahir,
    required String warganegara,
    required String jeniskelamin,
    required String statusperkawinan,
    required String tanggalmenikah,
    required String agama,
    required String golongandarah,
    required String levelpendidikan,
    required String alamataktif,
    required String provinsi,
    required String kota,
    required String kodepos,
    required String noteleponrumah,
    required String nohp,
    required String norekeningbank,
    required String namabank,
    required String sistemgaji,
    required String nopaspor,
    required String noKeluarga,
    required String noktp,
    required String notelepondarurat,
    required String tanggalmasuk,
    required String tanggalkeluar,
    required String alasankeluar,
    required String tipekaryawan,
    required String jumlahanak,
    required String jumlahtanggungan,
    required String statuspajak,
    required String npwp,
    required String lokasipenerimaan,
    required String kodeorganisasi,
    required String bagian,
    required String kodejabatan,
    required String kodegolongan,
    required String lokasitugas,
    required String photo,
    required String email,
    required String alokasi,
    required String subbagian,
    required String jms,
    required String bpjs,
    required String kodecatu,
    required String statpremi,
    required String pendidikan,
    required String namatipekaryawan,
    required String namaorganisasi,
    required String namajabatan,
    required String namagolongan,
    required String jammasuk,
    required String jampulang,
  });

  ProfileModel.fromJson(Map<String, dynamic> map)
      : super(
          karyawanid: map['karyawanid'] ?? "",
          nik: map['nik'] ?? "",
          namakaryawan: map['namakaryawan'] ?? "",
          nickname: map['nickname'] ?? "",
          tempatlahir: map['tempatlahir'] ?? "",
          tanggallahir: map['tanggallahir'] ?? "",
          warganegara: map['warganegara'] ?? "",
          jeniskelamin: map['jeniskelamin'] ?? "",
          statusperkawinan: map['statusperkawinan'] ?? "",
          tanggalmenikah: map['tanggalmenikah'] ?? "",
          agama: map['agama'] ?? "",
          golongandarah: map['golongandarah'] ?? "",
          levelpendidikan: map['levelpendidikan'] ?? "",
          alamataktif: map['alamataktif'] ?? "",
          provinsi: map['provinsi'] ?? "",
          kota: map['kota'] ?? "",
          kodepos: map['kodepos'] ?? "",
          noteleponrumah: map['noteleponrumah'] ?? "",
          nohp: map['nohp'] ?? "",
          norekeningbank: map['norekeningbank'] ?? "",
          namabank: map['namabank'] ?? "",
          sistemgaji: map['sistemgaji'] ?? "",
          nopaspor: map['nopaspor'] ?? "",
          noKeluarga: map['no_keluarga'] ?? "",
          noktp: map['noktp'] ?? "",
          notelepondarurat: map['notelepondarurat'] ?? "",
          tanggalmasuk: map['tanggalmasuk'] ?? "",
          tanggalkeluar: map['tanggalkeluar'] ?? "",
          alasankeluar: map['alasankeluar'] ?? "",
          tipekaryawan: map['tipekaryawan'] ?? "",
          jumlahanak: map['jumlahanak'] ?? "",
          jumlahtanggungan: map['jumlahtanggungan'] ?? "",
          statuspajak: map['statuspajak'] ?? "",
          npwp: map['npwp'] ?? "",
          lokasipenerimaan: map['lokasipenerimaan'] ?? "",
          kodeorganisasi: map['kodeorganisasi'] ?? "",
          bagian: map['bagian'] ?? "",
          kodejabatan: map['kodejabatan'] ?? "",
          kodegolongan: map['kodegolongan'] ?? "",
          lokasitugas: map['lokasitugas'] ?? "",
          photo: map['photo'] ?? "",
          email: map['email'] ?? "",
          alokasi: map['alokasi'] ?? "",
          subbagian: map['subbagian'] ?? "",
          jms: map['jms'] ?? "",
          bpjs: map['bpjs'] ?? "",
          kodecatu: map['kodecatu'] ?? "",
          statpremi: map['statpremi'] ?? "",
          pendidikan: map['pendidikan'] ?? "",
          namatipekaryawan: map['namatipekaryawan'] ?? "",
          namaorganisasi: map['namaorganisasi'] ?? "",
          namajabatan: map['namajabatan'] ?? "",
          namagolongan: map['namagolongan'] ?? "",
          jammasuk: map['jammasuk'] ?? "",
          jampulang: map['jampulang'] ?? "",
        );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['karyawanid'] = karyawanid;
    data['nik'] = nik;
    data['namakaryawan'] = namakaryawan;
    data['nickname'] = nickname;
    data['tempatlahir'] = tempatlahir;
    data['tanggallahir'] = tanggallahir;
    data['warganegara'] = warganegara;
    data['jeniskelamin'] = jeniskelamin;
    data['statusperkawinan'] = statusperkawinan;
    data['tanggalmenikah'] = tanggalmenikah;
    data['agama'] = agama;
    data['golongandarah'] = golongandarah;
    data['levelpendidikan'] = levelpendidikan;
    data['alamataktif'] = alamataktif;
    data['provinsi'] = provinsi;
    data['kota'] = kota;
    data['kodepos'] = kodepos;
    data['noteleponrumah'] = noteleponrumah;
    data['nohp'] = nohp;
    data['norekeningbank'] = norekeningbank;
    data['namabank'] = namabank;
    data['sistemgaji'] = sistemgaji;
    data['nopaspor'] = nopaspor;
    data['no_keluarga'] = noKeluarga;
    data['noktp'] = noktp;
    data['notelepondarurat'] = notelepondarurat;
    data['tanggalmasuk'] = tanggalmasuk;
    data['tanggalkeluar'] = tanggalkeluar;
    data['alasankeluar'] = alasankeluar;
    data['tipekaryawan'] = tipekaryawan;
    data['jumlahanak'] = jumlahanak;
    data['jumlahtanggungan'] = jumlahtanggungan;
    data['statuspajak'] = statuspajak;
    data['npwp'] = npwp;
    data['lokasipenerimaan'] = lokasipenerimaan;
    data['kodeorganisasi'] = kodeorganisasi;
    data['bagian'] = bagian;
    data['kodejabatan'] = kodejabatan;
    data['kodegolongan'] = kodegolongan;
    data['lokasitugas'] = lokasitugas;
    data['photo'] = photo;
    data['email'] = email;
    data['alokasi'] = alokasi;
    data['subbagian'] = subbagian;
    data['jms'] = jms;
    data['bpjs'] = bpjs;
    data['kodecatu'] = kodecatu;
    data['statpremi'] = statpremi;
    data['pendidikan'] = pendidikan;
    data['namatipekaryawan'] = namatipekaryawan;
    data['namaorganisasi'] = namaorganisasi;
    data['namajabatan'] = namajabatan;
    data['namagolongan'] = namagolongan;
    data['jammasuk'] = jammasuk;
    data['jampulang'] = jampulang;
    return data;
  }
}
