import 'package:zen_tugas/models/kontak.dart';
import 'package:flutter/material.dart';

class HalamanDetail extends StatelessWidget {
  const HalamanDetail({
    Key? key,
    required this.item,
  }) : super(key: key);

  final Kontak item;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shadowColor: Colors.transparent,
        title: Text('Detail Kontak'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Card(
            child: Column(
              children: [
                viewGambar(),
                const SizedBox(height: 18),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18),
                  child: Column(
                    children: [
                      widgetInformasi(
                        title: 'Nama Lengkap',
                        value: item.nama,
                      ),
                      widgetInformasi(
                        title: 'Nomor Telepon',
                        value: item.telepon,
                      ),
                      widgetInformasi(
                        title: 'Alamat Email',
                        value: item.email,
                        divider: false,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Column viewGambar() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: 160,
          width: double.infinity,
          child: Hero(
            tag: item.email,
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
              ),
              child: Image.network(
                item.gambar,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Column widgetInformasi(
      {required String title, required String value, bool divider = true}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      color: Color(0xFF000F30),
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    value,
                    style: TextStyle(
                      fontSize: 16,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: divider ? Divider(thickness: 0.8) : SizedBox(),
        ),
      ],
    );
  }
}
