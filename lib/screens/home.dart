import 'package:flutter/material.dart';
import 'package:lat_kuis/models/data.dart';
import 'package:lat_kuis/screens/detail.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: menus.length,
      itemBuilder: (context, index) {
        return ListTile(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DetailScreen(menu: menus[index]),
              ),
            );
          },
          leading: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: SizedBox(
              width: 56,
              height: 56,
              child: Image.network(
                menus[index].image,
                fit: BoxFit.cover,
                // Kalau gambar gagal dimuat, tampilkan ikon
                errorBuilder: (context, error, stackTrace) =>
                    Icon(Icons.broken_image),
              ),
            ),
          ),
          title: Text(menus[index].name),
          subtitle: Text("${menus[index].category}\n${menus[index].price}"),
          isThreeLine: true,
          trailing: Icon(Icons.arrow_forward_ios),
        );
      },
    );
  }
}
