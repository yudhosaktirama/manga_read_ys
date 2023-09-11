import 'package:flutter/material.dart';
import 'package:manga_read_ys/genreWidget/ActionWidget.dart';
import 'package:manga_read_ys/genreWidget/ComedyWidget.dart';
import 'package:manga_read_ys/genreWidget/DramaWidget.dart';
import 'package:manga_read_ys/genreWidget/FantasyWidget.dart';
import 'package:manga_read_ys/genreWidget/MysteryWidget.dart';
import 'package:manga_read_ys/genreWidget/RomanceWidget.dart';
import 'package:manga_read_ys/genreWidget/SciFiWidget.dart';


class Genre extends StatefulWidget {
  const Genre({super.key});

  @override
  State<Genre> createState() => _GenreState();
}

class _GenreState extends State<Genre> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(length: 7, child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size(MediaQuery.of(context).size.width, MediaQuery.of(context).size.height * 0.08),
          child: AppBar(
            backgroundColor: Colors.white,
            bottom: const TabBar(
            labelColor: Colors.black,
            
            isScrollable: true,
            tabs: [
              Tab(child: Text("Action"),),
              Tab(child: Text("Comedy"),),
              Tab(child: Text("Drama"),),
              Tab(child: Text("Fantasy"),),
              Tab(child: Text("Mystery"),),
              Tab(child: Text("Romance"),),
              Tab(child: Text("Sci-Fi"),),
        
            ],
            
          ),),
          
        ),
        body: const TabBarView(children: [
          ActionWidget(),
          ComedyWidget(),
          DramaWidget(),
          FantasyWidget(),
          MysteryWidget(),
          RomanceWidget(),
          SficiWidget()
        ]),
      ) ),
    );
  }
}