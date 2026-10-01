import 'package:flutter/material.dart';
import 'package:lat_kuis/models/data.dart';
import 'package:lat_kuis/screens/detail.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> _categories = ["Semua", "Mie", "Dimsum" , "Minuman"];
  String _keyword = "";
  String _selectedCategory = "Semua";

  @override
  Widget build(BuildContext context) {
    List<Menu> filteredMenus = menus.where((menu) {
      bool cocokNama = menu.name.toLowerCase().contains(_keyword.toLowerCase());
      bool cocokKategori =
          _selectedCategory == "Semua" || menu.category == _selectedCategory;
      return cocokNama && cocokKategori;
    }).toList();
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.all(8),
          child: TextField(
            onChanged: (value) {
              setState(() {
                _keyword = value;
              });
            },
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
            children: _categories.map((category) {
              return ChoiceChip(
                label: Text(category),
                selected: _selectedCategory == category,
                onSelected: (value) {
                  setState(() {
                    _selectedCategory = category;
                  });
                },
              );
            }).toList(),
          ),
        ),

        Expanded(
           child: filteredMenus.isEmpty
          ? Center(child: Text("Menu tidak ditemukan")) :
           ListView.builder(
            itemCount: filteredMenus.length,
            itemBuilder: (context, index) {
              return ListTile(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailScreen(menu: filteredMenus[index]),
                    ),
                  );
                },
                leading: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: SizedBox(
                    width: 56,
                    height: 56,
                    child: Image.network(
                      filteredMenus[index].image,
                      fit: BoxFit.cover,
                      // Kalau gambar gagal dimuat, tampilkan ikon
                      errorBuilder: (context, error, stackTrace) =>
                          Icon(Icons.broken_image),
                    ),
                  ),
                ),
                title: Text(filteredMenus[index].name),
                subtitle: Text(
                  "${filteredMenus[index].category}\n${filteredMenus[index].price}",
                ),
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
