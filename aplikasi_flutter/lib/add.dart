import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Add extends StatefulWidget {
  const Add({Key? key}) : super(key: key);

  @override
  State<Add> createState() => _AddState();
}

class _AddState extends State<Add> {
  final _formKey = GlobalKey<FormState>();

  var merk = TextEditingController();
  var model = TextEditingController();
  var tahun = TextEditingController();
  var warna = TextEditingController();
  var harga = TextEditingController();
  var bahanBakar = TextEditingController();
  var deskripsi = TextEditingController();

  Future<void> _onSubmit() async {
    try {
      return await http.post(
        Uri.parse("http://192.168.1.13/mobil_api/create.php"),
        body: {
          "merk": merk.text,
          "model": model.text,
          "tahun": tahun.text,
          "warna": warna.text,
          "harga": harga.text,
          "bahan_bakar": bahanBakar.text,
          "deskripsi": deskripsi.text,
        },
      ).then((value) {
        var data = jsonDecode(value.body);
        print(data["message"]);

        Navigator.of(context)
            .pushNamedAndRemoveUntil('/', (Route<dynamic> route) => false);
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Tambahkan Data Mobil Baru"),
        ),
        body: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Container(
              padding: EdgeInsets.all(10.0),
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
                        _onSubmit();
                      }
                    },
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
