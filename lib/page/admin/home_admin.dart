import 'package:flutter/material.dart';

class HomeAdminPage extends StatelessWidget {
  const HomeAdminPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Dummy data dashboard (nantinya ambil dari database)
    final int jumlahBerita = 5;
    final int jumlahPortofolio = 12;
    final int jumlahDosen = 8;
    final int jumlahGaleri = 20;
    final double ratingRata = 4.5;

    // Menu CRUD
    final List<Map<String, dynamic>> crudMenu = [
      {
        "title": "Kelola Profil",
        "icon": Icons.school,
        "route": "/crudProfil",
      },
      {
        "title": "Kelola Galeri",
        "icon": Icons.photo_album,
        "route": "/crudGaleri",
      },
      {
        "title": "Kelola Dosen",
        "icon": Icons.people,
        "route": "/crudDosen",
      },
      {
        "title": "Kelola Portofolio",
        "icon": Icons.work,
        "route": "/crudPortofolio",
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
        title: const Text("Home Admin"),
        backgroundColor: Colors.black,
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          children: [
            // ====== DASHBOARD OVERVIEW ======
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  const Text(
                    "Dashboard Overview",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Grid Dashboard
                  GridView.count(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    crossAxisCount: 2,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                    childAspectRatio: 2,
                    children: [
                      _buildDashboardCard("Berita", jumlahBerita.toString(),
                          Icons.article, Colors.blue),
                      _buildDashboardCard("Portofolio",
                          jumlahPortofolio.toString(), Icons.work, Colors.green),
                      _buildDashboardCard("Dosen", jumlahDosen.toString(),
                          Icons.people, Colors.orange),
                      _buildDashboardCard("Galeri", jumlahGaleri.toString(),
                          Icons.photo_album, Colors.purple),
                      _buildDashboardCard("Rating",
                          ratingRata.toString(), Icons.star, Colors.amber),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 10),

            // ====== MENU CRUD ======
            Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.all(16),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // 2 kolom
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: 1,
                ),
                itemCount: crudMenu.length,
                itemBuilder: (context, index) {
                  final item = crudMenu[index];
                  return GestureDetector(
                    onTap: () {
                      if (item["title"] == "Logout") {
                        Navigator.pushReplacementNamed(context, "/landing");
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
                          Icon(item["icon"],
                              color: Colors.tealAccent, size: 40),
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

  // Widget kecil untuk dashboard card
  Widget _buildDashboardCard(
      String title, String value, IconData icon, Color color) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[850],
        borderRadius: BorderRadius.circular(15),
      ),
      padding: const EdgeInsets.all(12),
      child: Row(
        children: [
          Icon(icon, color: color, size: 28),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  value,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  title,
                  style: const TextStyle(color: Colors.white70, fontSize: 14),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
