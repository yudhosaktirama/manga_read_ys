import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:manga_read_ys/Pages/genre.dart';
import 'package:manga_read_ys/Pages/profile.dart';
import 'package:manga_read_ys/Pages/search.dart';
import 'package:manga_read_ys/Pages/searchAnime.dart';
import 'package:manga_read_ys/class/hapus.dart';
import 'package:manga_read_ys/main.dart';

import '../widget/doubleText.dart';
import '../widget/favorite.dart';
import '../widget/jadwal.dart';
import '../widget/originalBaru.dart';
import '../widget/webtoondaily.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  CarouselController controller = CarouselController();

  double lebarkarol = 200;

  List<dataMangaku> dataManga = [
    dataMangaku(
        judul: "Dragon Ball",
        deskripsi: "Dragon Ball adalah salah satu komik dan anime legendaris",
        url:
            "https://upload.wikimedia.org/wikipedia/id/7/74/Dragon_Ball_Super_Key_visual.jpg"),
    dataMangaku(
        judul: "Inuyasha",
        deskripsi:
            "Ditulis oleh Rumiko Takahashi, Inuyasha merupakan komik dan anime yang menceritakan tentang Kagome",
        url:
            "https://m.media-amazon.com/images/M/MV5BMGNmMWI4MGUtYmU0ZS00ZDkxLTgzMTAtZDU4YmQ1MDM3Y2IyXkEyXkFqcGdeQXVyNTA4NzY1MzY@._V1_.jpg"),
    dataMangaku(
        judul: "Naruto",
        deskripsi:
            "Naruto merupakan komik anime Jepang paling populer berikutnya. Pertama kali dirilis pada 21 September 1999",
        url:
            "https://m.media-amazon.com/images/M/MV5BZGFiMWFhNDAtMzUyZS00NmQ2LTljNDYtMmZjNTc5MDUxMzViXkEyXkFqcGdeQXVyNjAwNDUxODI@._V1_FMjpg_UX1000_.jpg"),
    dataMangaku(
        judul: "Fullmetal Alchemist",
        deskripsi:
            "Bercerita tentang Edward dan Alphonse, dua bersaudara yang berusaha mengembalikan tubuhnya setelah melakukan hal tabu dalam dunia alkemi",
        url:
            "https://cdn.myanimelist.net/images/about_me/ranking_items/4757216-b784bd05-0853-439c-b4e4-27ec46ee4c53.jpg?t=1655669475"),
  ];

  List judul = ["Dragon Ball", "Inuyasha", "Naruto", "Fullmetal Alchemist"];
  List deskripsi = [
    "Dragon Ball adalah salah satu komik dan anime legendaris",
    "Ditulis oleh Rumiko Takahashi, Inuyasha merupakan komik dan anime yang menceritakan tentang Kagome",
    "Naruto merupakan komik anime Jepang paling populer berikutnya. Pertama kali dirilis pada 21 September 1999",
    "Bercerita tentang Edward dan Alphonse, dua bersaudara yang berusaha mengembalikan tubuhnya setelah melakukan hal tabu dalam dunia alkemi"
  ];

  List imageView = [
    const NetworkImage('https://c4.wallpaperflare.com/wallpaper/673/26/489/anime-girl-boy-couple-fighter-wallpaper-preview.jpg'),
    const NetworkImage('https://w0.peakpx.com/wallpaper/427/730/HD-wallpaper-demon-slayer-tanjiro-kamado-fighting-around-fire-anime.jpg'),
    const NetworkImage('https://wallpaperaccess.com/full/792402.jpg'),
    const NetworkImage('https://c4.wallpaperflare.com/wallpaper/783/480/1/anime-anime-girls-japanese-clothes-landscape-wallpaper-preview.jpg'),
  ];

  bool isLoading = true;
  int index_bottom = 0;
  int current_index = 0;
  int current_indexAction = 0;
  String currentMenu = "Home";

  void pindahMenu(int Index) {
    setState(() {
      if (Index == 0) {
        index_bottom = Index;
        currentMenu = 'Home';
      } else if (Index == 1) {
        index_bottom = Index;
        currentMenu = 'Search Manga';
      } else if (Index == 2) {
        index_bottom = Index;
        currentMenu = "Profil";
      }
    });
  }

  @override
  void initState() {
    super.initState();
  }

  bool loading = true;
  bool isRekom = true;
  bool isClicked = true;
  var coba = getALl.get<CobaProvider>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: index_bottom == 0 ||
                index_bottom == 2 ||
                coba.belumBerganti == false
            ? null
            : PreferredSize(
                preferredSize: Size(MediaQuery.of(context).size.width,
                    MediaQuery.of(context).size.height * 0.08),
                child: AppBar(
                  backgroundColor: Colors.white,
                  elevation: 1,
                  leading: Row(
                    children: [
                      TextButton(
                          onPressed: () {
                            isClicked = true;
                            isRekom = true;
                            setState(() {});
                          },
                          child: Text(
                            "Rekom",
                            style: TextStyle(
                                fontSize: 20,
                                color: isClicked ? Colors.black : Colors.grey),
                          )),
                      const Text(
                        "|",
                        style: TextStyle(color: Colors.grey),
                      ),
                      TextButton(
                          onPressed: () {
                            isClicked = false;
                            isRekom = false;
                            setState(() {});
                          },
                          child: Text(
                            "Genre",
                            style: TextStyle(
                                fontSize: 20,
                                color: isClicked == false
                                    ? Colors.black
                                    : Colors.grey[300]),
                          )),
                    ],
                  ),
                  actions: [
                    Builder(builder: (context) {
                      return IconButton(
                          onPressed: () {
                            showSearch(
                                context: context,
                                delegate: CustomSearchDelegate());
                          },
                          icon: const Icon(
                            Icons.search,
                            color: Colors.black,
                          ));
                    })
                  ],
                  leadingWidth: MediaQuery.of(context).size.width / 2,
                )),
        body: Builder(builder: (context) {
          if (index_bottom == 0) {
            return HomeWidget(context);
          } else if (index_bottom == 1) {
            if (isRekom == true) {
              return const SearchPage();
            } else if (isRekom == false) {
              return const Genre();
            } else {
              return const Text("gagal");
            }
          } else {
            return ProfilePage();
          }
        }),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.white,

          //membuat item navigasi
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.search), label: 'Search Manga'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profil'),
          ],

          //currentindex mengikuti baris item bottom navigasi yang diklik

          //warna saat item diklik
          currentIndex: index_bottom,
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.black,
          onTap: pindahMenu,

          //metode yang dijalankan saat ditap

          //agar bottom navigation tidak bergerak saat diklik
          type: BottomNavigationBarType.fixed,
        ),
      ),
    );
  }

  ListView HomeWidget(BuildContext context) {
    return ListView(scrollDirection: Axis.vertical, children: [
      Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.01,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.30,
            child: Stack(
              children: [
                CaroselFirst(),
                Positioned(
                  bottom: 0.5,
                  right: 0.5,
                  left: 0.5,
                  child: DotsIndicator(
                    decorator: const DotsDecorator(activeSize: Size.square(15)),
                    dotsCount: imageView.length,
                    position: current_index,
                  ),
                ),
                Positioned(
                    right: 0,
                    child: IconButton(
                        iconSize: 32,
                        color: Colors.white,
                        onPressed: () {},
                        icon: const Icon(Icons.search))),
                Column(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.12,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // ignore: avoid_unnecessary_containers
                        Container(
                          child: IconButton(
                              iconSize: 34,
                              color: Colors.white,
                              onPressed: () {
                                controller.previousPage(
                                    duration: const Duration(seconds: 2),
                                    curve: Curves.fastLinearToSlowEaseIn);
                              },
                              icon: const Icon(Icons.arrow_back_sharp)),
                        ),
                        // ignore: avoid_unnecessary_containers
                        Container(
                          child: IconButton(
                              color: Colors.white,
                              iconSize: 34,
                              onPressed: () {
                                controller.nextPage(
                                    duration: const Duration(seconds: 2),
                                    curve: Curves.fastLinearToSlowEaseIn);
                              },
                              icon: const Icon(Icons.arrow_forward_sharp)),
                        ),
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),
          const DoubleText(
              Judultext: "Random Anime",
              iconSelengkapnya: Icons.arrow_forward_ios),
          const FavoriteWidget(),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),
          const DoubleText(
              Judultext: "Rekomendasi Manga",
              iconSelengkapnya: Icons.arrow_forward_ios),
          const OriginalBaruWidget(),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),
          const DoubleText(
              Judultext: "Jadwal", iconSelengkapnya: Icons.arrow_forward_ios),
          const JadwalWidget(),
          const DoubleText(
              Judultext: "Random Manga",
              iconSelengkapnya: Icons.arrow_forward_ios),
          const WebtoonDailyWiget(),
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.55,
            color: Colors.grey[300],
            child: Column(
              children: [
                const DoubleText(
                    Judultext: "Action Tak Terhenti",
                    iconSelengkapnya: Icons.arrow_forward_ios),
                CaroselEnd(context),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.06,
                  child: Builder(
                    builder: (context) {
                      if (current_indexAction < 4) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            judul[current_indexAction],
                            style: const TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                                fontWeight: FontWeight.w600),
                          ),
                        );
                      } else {
                        return const Text("Cobbaaaa");
                      }
                    },
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Builder(
                    builder: (context) {
                      if (current_indexAction < 4) {
                        return Row(
                          children: [
                            Expanded(
                              child: SizedBox(
                                  child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(deskripsi[current_indexAction]),
                              )),
                            ),
                          ],
                        );
                      } else {
                        return const Text("data");
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),
          const Card(
            elevation: 10,
            child: Center(
              child: Text(
                "Created by Yudho Sakti Rama S.A",
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.w600),
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.03,
          ),
        ],
      ),
    ]);
  }

  CarouselSlider CaroselEnd(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
          viewportFraction: 0.7,
          onPageChanged: (index, reason) {
            setState(() {
              current_indexAction = index;
            });
          },
          enlargeCenterPage: true,
          autoPlay: false,
          height: MediaQuery.of(context).size.height * 0.30),
      items: dataManga.map((i) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              margin: const EdgeInsets.symmetric(horizontal: 5),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(i.url), fit: BoxFit.fill)),
            );
          },
        );
      }).toList(),
    );
  }

  CarouselSlider CaroselFirst() {
    return CarouselSlider(
      carouselController: controller,
      options: CarouselOptions(
          viewportFraction: 1,
          onPageChanged: (index, reason) {
            setState(() {
              current_index = index;
            });
          },
          enlargeCenterPage: true,
          autoPlay: true,
          height: lebarkarol),
      items: imageView.map((i) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              margin: const EdgeInsets.symmetric(horizontal: 5),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  image: DecorationImage(image: i, fit: BoxFit.cover)),
            );
          },
        );
      }).toList(),
    );
  }
}

// ignore: must_be_immutable
class LeadingWidgetSearch extends StatefulWidget {
  bool afakahganti;
  LeadingWidgetSearch({
    required this.afakahganti,
    super.key,
  });

  @override
  State<LeadingWidgetSearch> createState() => _LeadingWidgetSearchState();
}

class _LeadingWidgetSearchState extends State<LeadingWidgetSearch> {
  bool isClicked = true;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        TextButton(
            onPressed: () {
              isClicked = true;
              widget.afakahganti = true;
              setState(() {});
            },
            child: Text(
              "Rekom",
              style: TextStyle(
                  fontSize: 20, color: isClicked ? Colors.black : Colors.grey),
            )),
        const Text(
          "|",
          style: TextStyle(color: Colors.grey),
        ),
        TextButton(
            onPressed: () {
              isClicked = false;
              widget.afakahganti = false;
              setState(() {});
            },
            child: Text(
              "Genre",
              style: TextStyle(
                  fontSize: 20,
                  color: isClicked == false ? Colors.black : Colors.grey[300]),
            )),
      ],
    );
  }
}

class dataMangaku {
  final String judul;
  final String deskripsi;
  final String url;

  dataMangaku(
      {required this.judul, required this.deskripsi, required this.url});
}
