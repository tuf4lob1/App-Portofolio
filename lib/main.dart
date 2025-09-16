import 'package:flutter/material.dart';
import 'package:projek_test/page/admin/home_admin.dart';
import 'package:projek_test/page/client/daftar_dosen.dart';
import 'package:projek_test/page/client/dashboard_client.dart';
import 'package:projek_test/page/client/form_client.dart';
import 'package:projek_test/page/client/galeri.dart';
import 'package:projek_test/page/client/portofolio_mhs.dart';
import 'package:projek_test/page/client/rating.dart';
import 'package:projek_test/page/landing_page.dart';
import 'package:projek_test/splash/splash_screen.dart';
import 'package:projek_test/page/client/profil_informatika.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        '/landing': (context) => const LandingPage(),
        '/formClient' : (context) => const FormClientPage(),
        '/homeClient' : (context) => const HomeClientPage(),
        '/loginAdmin' : (context) => const HomeAdminPage(),
        '/profilInformatika': (context) => const ProfilInformatikaPage(),
        '/galeri': (context) => const GaleriPage(),
        '/dosen': (context) => const DosenPage(),
        '/portofolio': (context) => const PortofolioPage(),
        
      },
    );
  }
}
