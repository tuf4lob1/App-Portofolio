import 'package:flutter/material.dart';

class ProfilInformatikaPage extends StatelessWidget {
  const ProfilInformatikaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      appBar: AppBar(
        title: const Text("Profil Informatika"),
        backgroundColor: Colors.black,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ====== HEADER ======
            Center(
              child: Column(
                children: const [
                  Icon(Icons.computer, color: Colors.tealAccent, size: 60),
                  SizedBox(height: 12),
                  Text(
                    "Informatika",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 6),
                  Text(
                    "Jurusan Informatika - Pameran 2025",
                    style: TextStyle(color: Colors.white70, fontSize: 14),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // ====== VISI ======
            _buildCard(
              title: "Visi",
              content:
                  "Menjadi program studi unggulan dalam bidang Informatika, "
                  "berdaya saing global, serta berkontribusi pada kemajuan teknologi.",
            ),

            const SizedBox(height: 16),

            // ====== MISI ======
            _buildCard(
              title: "Misi",
              content:
                  "1. Menyelenggarakan pendidikan berkualitas di bidang Informatika.\n"
                  "2. Melakukan penelitian inovatif dan bermanfaat.\n"
                  "3. Mengembangkan kerjasama dengan industri dan komunitas.\n"
                  "4. Membekali mahasiswa dengan keterampilan teknologi terkini.",
            ),

            const SizedBox(height: 16),

            // ====== AKREDITASI ======
            _buildCard(
              title: "Akreditasi",
              content: "Program Studi Informatika terakreditasi **A** (Unggul).",
            ),

            const SizedBox(height: 16),

            // ====== FASILITAS ======
            _buildCard(
              title: "Fasilitas",
              content:
                  "- Laboratorium Komputer Modern\n"
                  "- Jaringan Internet & WiFi\n"
                  "- Perpustakaan Digital\n"
                  "- Inkubator Startup Mahasiswa\n"
                  "- Ruang Diskusi & Coworking Space",
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  // ====== CARD BUILDER ======
  Widget _buildCard({required String title, required String content}) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[900],
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            blurRadius: 6,
            offset: const Offset(2, 4),
          ),
        ],
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: Colors.tealAccent,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            content,
            style: const TextStyle(color: Colors.white70, fontSize: 15),
          ),
        ],
      ),
    );
  }
}
