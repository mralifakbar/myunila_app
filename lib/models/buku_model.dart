class Buku {
  String? idBukuAjar;
  String? judulBuku;
  String? isbn;
  String? tanggalTerbit;
  String? penerbit;
  String? waktuDataDitambahkan;
  String? terakhirDiubah;

  Buku(
      {this.idBukuAjar,
      this.judulBuku,
      this.isbn,
      this.tanggalTerbit,
      this.penerbit,
      this.waktuDataDitambahkan,
      this.terakhirDiubah});

  Buku.fromJson(Map<String, dynamic> json) {
    idBukuAjar = json['id_buku_ajar'];
    judulBuku = json['judul_buku'];
    isbn = json['isbn'];
    tanggalTerbit = json['tanggal_terbit'];
    penerbit = json['penerbit'];
    waktuDataDitambahkan = json['waktu_data_ditambahkan'];
    terakhirDiubah = json['terakhir_diubah'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id_buku_ajar'] = this.idBukuAjar;
    data['judul_buku'] = this.judulBuku;
    data['isbn'] = this.isbn;
    data['tanggal_terbit'] = this.tanggalTerbit;
    data['penerbit'] = this.penerbit;
    data['waktu_data_ditambahkan'] = this.waktuDataDitambahkan;
    data['terakhir_diubah'] = this.terakhirDiubah;
    return data;
  }
}
