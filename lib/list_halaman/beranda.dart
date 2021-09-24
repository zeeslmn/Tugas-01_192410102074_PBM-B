import 'package:zen_tugas/list_halaman/detail.dart';
import 'package:zen_tugas/data.dart';
import 'package:zen_tugas/models/kontak.dart';
import 'package:flutter/material.dart';

class HalamanBeranda extends StatefulWidget {
  const HalamanBeranda({Key? key}) : super(key: key);

  @override
  _HalamanBerandaState createState() => _HalamanBerandaState();
}

class _HalamanBerandaState extends State<HalamanBeranda> {
  final List<Kontak> kontakList = [];

  @override
  void initState() {
    kontakList.addAll(listKontak);
    kontakList.sort((a, b) => a.nama.compareTo(b.nama));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kontak Saya'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: ListView.builder(
          padding: const EdgeInsets.only(bottom: 18, top: 12),
          shrinkWrap: true,
          itemCount: kontakList.length,
          itemBuilder: (BuildContext context, int i) {
            return ListItem(item: kontakList[i]);
          },
        ),
      ),
    );
  }
}

class ListItem extends StatelessWidget {
  const ListItem({
    Key? key,
    required this.item,
  }) : super(key: key);

  final Kontak item;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (ctx) => HalamanDetail(item: item),
          ),
        );
      },
      child: Column(
        children: [
          Row(
            children: [
              SizedBox(
                height: 50,
                width: 50,
                child: Hero(
                  tag: item.email,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.network(
                      item.gambar,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.nama,
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      item.telepon,
                      style: TextStyle(color: Colors.black87),
                    ),
                  ],
                ),
              ),
              Icon(
                Icons.arrow_forward,
                size: 14,
                color: Colors.grey[400],
              ),
              const SizedBox(width: 8),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 6),
            child: Divider(thickness: 1),
          ),
        ],
      ),
    );
  }
}
