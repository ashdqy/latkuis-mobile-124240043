import 'package:flutter/material.dart';
import 'package:lat_kuis/models/data.dart';
import 'package:lat_kuis/screens/detail.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> _categories = ["Semua", "Makanan", "Minuman"];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.all(8),
          child: TextField(
            decoration: InputDecoration(
              hintText: "Cari Menu",
              prefixIcon: Icon(Icons.search),
              border: OutlineInputBorder(),
            ),
          ),
        ),

SingleChildScrollView(
  scrollDirection: Axis.horizontal,
  padding: EdgeInsets.symmetric(vertical: 8),
  child: Row(
    children: _categories.map((category){
      return ChoiceChip(
        label : Text(category),
        selected: category == "semua",
        onSelected: (value) {},
      );
    }).toList(),
  ),
),

        Expanded(
          child: ListView.builder(
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
          ),
        ),
      ],
    );
  }
}
