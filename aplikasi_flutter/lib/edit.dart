import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Edit extends StatefulWidget {
  final String id;

  Edit({required this.id});

  @override
  State<Edit> createState() => _EditState();
}

class _EditState extends State<Edit> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController merk = TextEditingController();
  TextEditingController model = TextEditingController();
  TextEditingController tahun = TextEditingController();
  TextEditingController warna = TextEditingController();
  TextEditingController harga = TextEditingController();
  TextEditingController bahanBakar = TextEditingController();
  TextEditingController deskripsi = TextEditingController();

  Future<void> _onUpdate() async {
    try {
      final response = await http.post(
        Uri.parse("http://192.168.1.13/mobil_api/update.php"),
        body: {
          "id": widget.id,
          "merk": merk.text,
          "model": model.text,
          "tahun": tahun.text,
          "warna": warna.text,
          "harga": harga.text,
          "bahan_bakar": bahanBakar.text,
          "deskripsi": deskripsi.text,
        },
      );

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        print(data["message"]);
        Navigator.of(context)
            .pushNamedAndRemoveUntil('/', (Route<dynamic> route) => false);
      } else {
        print("Gagal memperbarui data. Kode status: ${response.statusCode}");
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> _onDeleteItem(BuildContext context) async {
    try {
      final response = await http.post(
        Uri.parse("http://192.168.1.13/mobil_api/delete.php"),
        body: {
          "id": widget.id,
        },
      );

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        print(data["message"]);
        Navigator.of(context)
            .pushNamedAndRemoveUntil('/', (Route<dynamic> route) => false);
      } else {
        print("Gagal menghapus data. Kode status: ${response.statusCode}");
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
    _getData();
  }

  Future<void> _getData() async {
    try {
      final response = await http.get(
        Uri.parse("http://192.168.1.13/mobil_api/detail.php?id=${widget.id}"),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        setState(() {
          merk.text = data['merk'] ?? '';
          model.text = data['model'] ?? '';
          tahun.text = data['tahun'] ?? '';
          warna.text = data['warna'] ?? '';
          harga.text = data['harga'] ?? '';
          bahanBakar.text = data['bahan_bakar'] ?? '';
          deskripsi.text = data['deskripsi'] ?? '';
        });
      } else {
        print("Gagal mengambil data. Kode status: ${response.statusCode}");
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Data Mobil"),
        actions: [
          Container(
            padding: EdgeInsets.only(right: 20),
            child: IconButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      content: Text('Apakah Anda ingin menghapus ini?'),
                      actions: <Widget>[
                        ElevatedButton(
                          child: Text('Batal'),
                          onPressed: () => Navigator.of(context).pop(),
                        ),
                        ElevatedButton(
                          child: Text('Hapus'),
                          onPressed: () => _onDeleteItem(context),
                        ),
                      ],
                    );
                  },
                );
              },
              icon: Icon(Icons.delete),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(10.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Merk',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                TextFormField(
                  controller: merk,
                  decoration: InputDecoration(
                    hintText: "Merk Mobil",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(18.0),
                    ),
                    fillColor: Colors.white,
                    filled: true,
                  ),
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Merk Mobil Diperlukan!';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 5),
                Text(
                  'Model',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 5),
                TextFormField(
                  controller: model,
                  decoration: InputDecoration(
                    hintText: "Model Mobil",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(18.0),
                    ),
                    fillColor: Colors.white,
                    filled: true,
                  ),
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Model Mobil Diperlukan!';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 5),
                Text(
                  'Tahun',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 5),
                TextFormField(
                  controller: tahun,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: "Tahun Pembuatan",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(18.0),
                    ),
                    fillColor: Colors.white,
                    filled: true,
                  ),
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Tahun Pembuatan Diperlukan!';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 5),
                Text(
                  'Warna',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 5),
                TextFormField(
                  controller: warna,
                  decoration: InputDecoration(
                    hintText: "Warna Mobil",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(18.0),
                    ),
                    fillColor: Colors.white,
                    filled: true,
                  ),
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Warna Mobil Diperlukan!';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 5),
                Text(
                  'Harga',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 5),
                TextFormField(
                  controller: harga,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: "Harga Mobil",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(18.0),
                    ),
                    fillColor: Colors.white,
                    filled: true,
                  ),
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Harga Mobil Diperlukan!';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 5),
                Text(
                  'Bahan Bakar',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 5),
                TextFormField(
                  controller: bahanBakar,
                  decoration: InputDecoration(
                    hintText: "Tipe Bahan Bakar",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(18.0),
                    ),
                    fillColor: Colors.white,
                    filled: true,
                  ),
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  'Deskripsi',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 5),
                TextFormField(
                  controller: deskripsi,
                  maxLines: 3,
                  decoration: InputDecoration(
                    hintText: "Deskripsi Mobil",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(18.0),
                    ),
                    fillColor: Colors.white,
                    filled: true,
                  ),
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                SizedBox(height: 15),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    child: Text(
                      "Simpan",
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _onUpdate();
                      }
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
