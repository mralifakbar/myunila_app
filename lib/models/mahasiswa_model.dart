class Mahasiswa {
  String? idPesertaDidik;
  String? idRegPd;
  String? nPM;
  String? namaMahasiswa;
  String? programStudi;
  String? idProdi;
  String? periodeMasuk;
  String? semesterSekarang;
  String? ips;
  String? ipk;
  String? totalSks;
  String? status;
  String? waktuDataDitambahkan;
  String? terakhirDiubah;

  Mahasiswa(
      {this.idPesertaDidik,
      this.idRegPd,
      this.nPM,
      this.namaMahasiswa,
      this.programStudi,
      this.idProdi,
      this.periodeMasuk,
      this.semesterSekarang,
      this.ips,
      this.ipk,
      this.totalSks,
      this.status,
      this.waktuDataDitambahkan,
      this.terakhirDiubah});

  Mahasiswa.fromJson(Map<String, dynamic> json) {
    idPesertaDidik = json['id_peserta_didik'];
    idRegPd = json['id_reg_pd'];
    nPM = json['NPM'];
    namaMahasiswa = json['nama_mahasiswa'];
    programStudi = json['program_studi'];
    idProdi = json['id_prodi'];
    periodeMasuk = json['periode_masuk'];
    semesterSekarang = json['semester_sekarang'];
    ips = json['ips'];
    ipk = json['ipk'];
    totalSks = json['total_sks'];
    status = json['status'];
    waktuDataDitambahkan = json['waktu_data_ditambahkan'];
    terakhirDiubah = json['terakhir_diubah'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id_peserta_didik'] = this.idPesertaDidik;
    data['id_reg_pd'] = this.idRegPd;
    data['NPM'] = this.nPM;
    data['nama_mahasiswa'] = this.namaMahasiswa;
    data['program_studi'] = this.programStudi;
    data['id_prodi'] = this.idProdi;
    data['periode_masuk'] = this.periodeMasuk;
    data['semester_sekarang'] = this.semesterSekarang;
    data['ips'] = this.ips;
    data['ipk'] = this.ipk;
    data['total_sks'] = this.totalSks;
    data['status'] = this.status;
    data['waktu_data_ditambahkan'] = this.waktuDataDitambahkan;
    data['terakhir_diubah'] = this.terakhirDiubah;
    return data;
  }
}
