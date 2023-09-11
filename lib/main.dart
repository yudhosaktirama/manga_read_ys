import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
// ignore: unused_import
import 'package:manga_read_ys/Pages/detail.dart';
import 'package:manga_read_ys/Pages/home.dart';
import 'package:manga_read_ys/class/hapus.dart';

GetIt getALl = GetIt.instance;

void main() {
  getALl.registerSingleton<CobaProvider>(CobaProvider());
  runApp(const Myapp());
}

class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return const HomePage();
  }
}
