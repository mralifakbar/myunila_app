class Alumni {
  String? idRegPd;
  String? namaAlumni;
  String? agama;
  String? jenisKelamin;
  String? tempatLahir;
  String? tanggalLahir;
  String? idWil;
  String? jln;
  String? rt;
  String? rw;
  String? desaKelurahan;
  String? dusun;
  String? npm;
  String? idProdi;
  String? angkatan;
  String? biayaSemester;
  String? ipk;
  String? totalSks;
  String? nik;
  String? email;
  String? noTelepon;
  String? jalurDaftar;
  String? biayaKuliah;
  String? tanggalLulus;
  String? tanggalWisuda;
  String? lamaStudi;
  String? noSeriIjazah;
  String? waktuDataDitambahkan;
  String? terakhirDiubah;

  Alumni(
      {this.idRegPd,
      this.namaAlumni,
      this.agama,
      this.jenisKelamin,
      this.tempatLahir,
      this.tanggalLahir,
      this.idWil,
      this.jln,
      this.rt,
      this.rw,
      this.desaKelurahan,
      this.dusun,
      this.npm,
      this.idProdi,
      this.angkatan,
      this.biayaSemester,
      this.ipk,
      this.totalSks,
      this.nik,
      this.email,
      this.noTelepon,
      this.jalurDaftar,
      this.biayaKuliah,
      this.tanggalLulus,
      this.tanggalWisuda,
      this.lamaStudi,
      this.noSeriIjazah,
      this.waktuDataDitambahkan,
      this.terakhirDiubah});

  Alumni.fromJson(Map<String, dynamic> json) {
    idRegPd = json['id_reg_pd'];
    namaAlumni = json['nama_alumni'];
    agama = json['agama'];
    jenisKelamin = json['jenis_kelamin'];
    tempatLahir = json['tempat_lahir'];
    tanggalLahir = json['tanggal_lahir'];
    idWil = json['id_wil'];
    jln = json['jln'];
    rt = json['rt'];
    rw = json['rw'];
    desaKelurahan = json['desa_kelurahan'];
    dusun = json['dusun'];
    npm = json['npm'];
    idProdi = json['id_prodi'];
    angkatan = json['angkatan'];
    biayaSemester = json['biaya_semester'];
    ipk = json['ipk'];
    totalSks = json['total_sks'];
    nik = json['nik'];
    email = json['email'];
    noTelepon = json['no_telepon'];
    jalurDaftar = json['jalur_daftar'];
    biayaKuliah = json['biaya_kuliah'];
    tanggalLulus = json['tanggal_lulus'];
    tanggalWisuda = json['tanggal_wisuda'];
    lamaStudi = json['lama_studi'];
    noSeriIjazah = json['no_seri_ijazah'];
    waktuDataDitambahkan = json['waktu_data_ditambahkan'];
    terakhirDiubah = json['terakhir_diubah'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id_reg_pd'] = this.idRegPd;
    data['nama_alumni'] = this.namaAlumni;
    data['agama'] = this.agama;
    data['jenis_kelamin'] = this.jenisKelamin;
    data['tempat_lahir'] = this.tempatLahir;
    data['tanggal_lahir'] = this.tanggalLahir;
    data['id_wil'] = this.idWil;
    data['jln'] = this.jln;
    data['rt'] = this.rt;
    data['rw'] = this.rw;
    data['desa_kelurahan'] = this.desaKelurahan;
    data['dusun'] = this.dusun;
    data['npm'] = this.npm;
    data['id_prodi'] = this.idProdi;
    data['angkatan'] = this.angkatan;
    data['biaya_semester'] = this.biayaSemester;
    data['ipk'] = this.ipk;
    data['total_sks'] = this.totalSks;
    data['nik'] = this.nik;
    data['email'] = this.email;
    data['no_telepon'] = this.noTelepon;
    data['jalur_daftar'] = this.jalurDaftar;
    data['biaya_kuliah'] = this.biayaKuliah;
    data['tanggal_lulus'] = this.tanggalLulus;
    data['tanggal_wisuda'] = this.tanggalWisuda;
    data['lama_studi'] = this.lamaStudi;
    data['no_seri_ijazah'] = this.noSeriIjazah;
    data['waktu_data_ditambahkan'] = this.waktuDataDitambahkan;
    data['terakhir_diubah'] = this.terakhirDiubah;
    return data;
  }
}
