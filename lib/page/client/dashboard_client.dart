import 'package:flutter/material.dart';

class HomeClientPage extends StatelessWidget {
  const HomeClientPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Ambil data nama dari arguments
    final args = ModalRoute.of(context)!.settings.arguments as Map?;
    final nama = args?["nama"] ?? "Pengunjung";

    // List menu utama
    final List<Map<String, dynamic>> menuItems = [
      {
        "title": "Profil Informatika",
        "icon": Icons.school,
        "route": "/profilInformatika",
      },
      {
        "title": "Galeri",
        "icon": Icons.photo_album,
        "route": "/galeri",
      },
      {
        "title": "Daftar Dosen",
        "icon": Icons.people,
        "route": "/dosen",
      },
      {
        "title": "Portofolio",
        "icon": Icons.work,
        "route": "/portofolio",
      },
      {
        "title": "Beri Rating",
        "icon": Icons.star_rate,
        "route": "/rating",
      },
      {
        "title": "Logout",
        "icon": Icons.logout,
        "route": "/landing",
      },
    ];

    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text("Home Client", style: TextStyle(color: Colors.white)),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          children: [
            // Header sapaan
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                "Halo, $nama 👋\nSelamat datang di Pameran Informatika.",
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
                textAlign: TextAlign.center,
              ),
            ),

            const SizedBox(height: 10),

            // Grid menu
            Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.all(16),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // 2 kolom
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: 1,
                ),
                itemCount: menuItems.length,
                itemBuilder: (context, index) {
                  final item = menuItems[index];
                  return GestureDetector(
                    onTap: () {
                      if (item["title"] == "Logout") {
                        // Logout → replace ke Landing
                        Navigator.pushReplacementNamed(context, item["route"]);
                      } else {
                        Navigator.pushNamed(context, item["route"]);
                      }
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[900],
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.3),
                            blurRadius: 6,
                            offset: const Offset(2, 4),
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(item["icon"], color: Colors.tealAccent, size: 40),
                          const SizedBox(height: 12),
                          Text(
                            item["title"],
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
