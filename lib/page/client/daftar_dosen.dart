import 'package:flutter/material.dart';

class DosenPage extends StatelessWidget {
  const DosenPage({super.key});

  // Dummy data dosen
  final List<Map<String, String>> dosenList = const [
    {
      "image": "assets/images/dosen1.jpg",
      "nama": "Dr. Andi Setiawan, M.Kom",
      "jabatan": "Ketua Program Studi",
      "keahlian": "Artificial Intelligence, Machine Learning",
      "detail": "Dr. Andi Setiawan berfokus pada riset kecerdasan buatan, "
          "pengembangan model deep learning, dan penerapan AI di bidang kesehatan."
    },
    {
      "image": "assets/images/dosen2.jpg",
      "nama": "Ir. Budi Santoso, M.T",
      "jabatan": "Dosen Senior",
      "keahlian": "Jaringan Komputer, Cyber Security",
      "detail": "Budi Santoso aktif meneliti keamanan jaringan, ethical hacking, "
          "dan implementasi sistem keamanan siber di sektor pemerintahan."
    },
    {
      "image": "assets/images/dosen3.jpg",
      "nama": "Siti Aminah, M.Kom",
      "jabatan": "Dosen",
      "keahlian": "Data Science, Big Data Analytics",
      "detail": "Siti Aminah fokus pada analisis data skala besar, pemodelan statistik, "
          "dan penerapan data science di bidang sosial dan bisnis."
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      appBar: AppBar(
        title: const Text("Daftar Dosen & Keahlian"),
        backgroundColor: Colors.black,
        centerTitle: true,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: dosenList.length,
        itemBuilder: (context, index) {
          final dosen = dosenList[index];
          return Card(
            color: Colors.grey[900],
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            margin: const EdgeInsets.symmetric(vertical: 8),
            child: ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage(dosen["image"]!),
                radius: 28,
              ),
              title: Text(
                dosen["nama"]!,
                style: const TextStyle(
                  color: Colors.tealAccent,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(
                "${dosen["jabatan"]!}\nKeahlian: ${dosen["keahlian"]!}",
                style: const TextStyle(color: Colors.white70, fontSize: 13),
              ),
              isThreeLine: true,
              onTap: () {
                _showDetail(context, dosen);
              },
            ),
          );
        },
      ),
    );
  }

  void _showDetail(BuildContext context, Map<String, String> dosen) {
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
          initialChildSize: 0.5,
          minChildSize: 0.3,
          maxChildSize: 0.9,
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
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundImage: AssetImage(dosen["image"]!),
                        radius: 35,
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              dosen["nama"]!,
                              style: const TextStyle(
                                  color: Colors.tealAccent,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              dosen["jabatan"]!,
                              style: const TextStyle(
                                  color: Colors.white70, fontSize: 14),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "Bidang Keahlian",
                    style: TextStyle(
                        color: Colors.tealAccent,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    dosen["keahlian"]!,
                    style: const TextStyle(color: Colors.white70, fontSize: 14),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "Detail",
                    style: TextStyle(
                        color: Colors.tealAccent,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    dosen["detail"]!,
                    style: const TextStyle(color: Colors.white70, fontSize: 14),
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
