import 'package:flutter/material.dart';

class PortofolioPage extends StatelessWidget {
  const PortofolioPage({super.key});

  // Dummy data portofolio mahasiswa
  final List<Map<String, String>> portofolioList = const [
    {
      "image": "asset/image/otaps.png",
      "judul": "Aplikasi Smart Farming",
      "desc": "IoT berbasis sensor untuk pemantauan kelembaban tanah.",
      "detail": "Projek ini menggunakan sensor kelembaban tanah berbasis IoT yang "
          "terintegrasi dengan aplikasi Android untuk membantu petani mengatur penyiraman "
          "tanaman secara otomatis.",
      "link": "https://github.com/student/smart-farming"
    },
    {
      "image": "asset/image/otaps.png",
      "judul": "Website E-Library",
      "desc": "Sistem perpustakaan digital berbasis web.",
      "detail": "E-Library ini menyediakan fitur katalog buku, peminjaman online, "
          "dan dashboard admin untuk mengelola data anggota dan buku.",
      "link": "https://github.com/student/e-library"
    },
    {
      "image": "asset/image/otaps.png",
      "judul": "Game Edukasi Matematika",
      "desc": "Game Android untuk anak SD dengan materi dasar matematika.",
      "detail": "Game edukasi interaktif ini membantu anak-anak mempelajari operasi matematika "
          "dasar melalui kuis, puzzle, dan animasi menarik.",
      "link": "https://github.com/student/math-game"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      appBar: AppBar(
        title: const Text("Portofolio Mahasiswa"),
        backgroundColor: Colors.black,
        centerTitle: true,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: portofolioList.length,
        itemBuilder: (context, index) {
          final project = portofolioList[index];
          return Card(
            color: Colors.grey[900],
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            margin: const EdgeInsets.symmetric(vertical: 8),
            child: InkWell(
              borderRadius: BorderRadius.circular(16),
              onTap: () {
                _showDetail(context, project);
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius:
                        const BorderRadius.vertical(top: Radius.circular(16)),
                    child: Image.asset(
                      project["image"]!,
                      height: 180,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          project["judul"]!,
                          style: const TextStyle(
                              color: Colors.tealAccent,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          project["desc"]!,
                          style: const TextStyle(
                            color: Colors.white70,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  void _showDetail(BuildContext context, Map<String, String> project) {
    showModalBottomSheet(
      context: context,
      backgroundColor: const Color(0xFF1E1E1E),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      isScrollControlled: true,
      builder: (context) {
        return DraggableScrollableSheet(
          expand: false,
          initialChildSize: 0.6,
          minChildSize: 0.4,
          maxChildSize: 0.95,
          builder: (context, scrollController) {
            return SingleChildScrollView(
              controller: scrollController,
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Container(
                      width: 40,
                      height: 4,
                      margin: const EdgeInsets.only(bottom: 16),
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset(
                      project["image"]!,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    project["judul"]!,
                    style: const TextStyle(
                        color: Colors.tealAccent,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    project["detail"]!,
                    style: const TextStyle(color: Colors.white70, fontSize: 15),
                  ),
                  const SizedBox(height: 16),
                  if (project["link"] != null)
                    ElevatedButton.icon(
                      onPressed: () {
                        // sementara hanya print, nanti bisa pakai url_launcher
                        print("Buka link: ${project["link"]}");
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.tealAccent,
                        foregroundColor: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      icon: const Icon(Icons.link),
                      label: const Text("Lihat Project"),
                    ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
