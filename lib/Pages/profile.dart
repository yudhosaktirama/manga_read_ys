import 'package:flutter/material.dart';
import 'package:manga_read_ys/class/lightAndDarkColor.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class ProfilePage extends StatefulWidget {
  ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  List<String> gambar = [
    "https://www.um-surabaya.ac.id/assets/img/news_img/8593cd1a-2291-11ed-bc61-000c29cc32a6_ilustrasi-tampilan-game-online-melalui-smartphone.jpg",
    "https://cdn.idntimes.com/content-images/community/2019/04/thought-catalog-196661-unsplash-f3a5707d3f5dbb74504b79da57a644ce.jpg",
    "https://penerbitdeepublish.com/wp-content/uploads/2020/08/menyalurkan-hobi-menulis2.jpg"
  ];

  List<String> namaHobi = [
    "Playing Game",
    "Membaca",
    "Menulis",
  ];

  bool nilai = LightAndDarkColor().isLight;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ChangeNotifierProvider<LightAndDarkColor>(
        create: (context) => LightAndDarkColor(),
        child: Scaffold(
          appBar: AppBar(
            elevation: 3,
            backgroundColor: nilai == false ? Colors.white : Colors.black87,
            title: Consumer<LightAndDarkColor>(
              builder: (context, value, child) => Text(
                "Profile",
                style: TextStyle(color: value.color),
              ),
            ),
            actions: [
              Container(
                  margin: EdgeInsets.symmetric(horizontal: 5),
                  child: Consumer<LightAndDarkColor>(
                    builder: (context, value, child) => Icon(
                      Icons.menu,
                      color: value.color,
                    ),
                  ))
            ],
          ),
          body: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            color: nilai == false ? Colors.white : Colors.black87,
            child: ListView(
              children: [
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Consumer<LightAndDarkColor>(
                          builder: (context, value, child) => Text(
                            "Light Mode",
                            style: TextStyle(color: value.color, fontSize: 20),
                          ),
                        ),
                        Consumer<LightAndDarkColor>(
                          builder: (context, value, child) => Switch(
                            activeColor: Colors.white,
                            inactiveThumbColor: Colors.black,
                            activeTrackColor: Colors.white,
                            inactiveTrackColor: Colors.black,
                            value: value.isLight,
                            onChanged: (newValue) {
                              value.isLight = newValue;
                              setState(() {
                                nilai = newValue;
                              });
                            },
                          ),
                        ),
                        Consumer<LightAndDarkColor>(
                          builder: (context, value, child) => Text(
                            "Dark Mode",
                            style: TextStyle(color: value.color, fontSize: 20),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * 0.25,
                          height: MediaQuery.of(context).size.height * 0.15,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage('assets/coba/yudho.jpg'),
                                  fit: BoxFit.cover),
                              color: Colors.amber,
                              borderRadius: BorderRadius.circular(60)),
                        ),
                        Card(
                          elevation: 3,
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.5,
                            height: MediaQuery.of(context).size.height * 0.15,
                            color: nilai == false ? Colors.white : Colors.black,
                            child: Column(
                              children: [
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.5,
                                  height: MediaQuery.of(context).size.height *
                                      0.075,
                                  child: Center(
                                      child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 3),
                                    child: Consumer<LightAndDarkColor>(
                                      builder: (context, value, child) => Text(
                                        "Yudho Sakti R.S.A",
                                        style: TextStyle(
                                            color: value.color, fontSize: 20),
                                      ),
                                    ),
                                  )),
                                ),
                                Expanded(
                                    child: Container(
                                  child: Consumer<LightAndDarkColor>(
                                    builder: (context, value, child) => Text(
                                      "Mahasiswa",
                                      style: TextStyle(
                                          color: value.color,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                ))
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.03,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Card(
                          elevation: 10,
                          child: Consumer<LightAndDarkColor>(
                            builder: (context, value, child) => Container(
                              width: MediaQuery.of(context).size.width * 0.45,
                              height: MediaQuery.of(context).size.height * 0.3,
                              color:
                                  nilai == false ? Colors.white : Colors.black,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: RiwayatPendidikanWidget(),
                              ),
                            ),
                          ),
                        ),
                        Card(
                          elevation: 10,
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.45,
                            height: MediaQuery.of(context).size.height * 0.3,
                            color: nilai == false ? Colors.white : Colors.black,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  Consumer<LightAndDarkColor>(
                                    builder: (context, value, child) => Text(
                                      "Biodata",
                                      style: TextStyle(
                                          fontSize: 20, color: value.color),
                                    ),
                                  ),
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.01,
                                  ),
                                  SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Consumer<LightAndDarkColor>(
                                      builder: (context, value, child) => Text(
                                        "Nama : Yudho Sakti Rama Sultan Alfaridzi",
                                        style: TextStyle(
                                            fontSize: 20, color: value.color),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.01,
                                  ),
                                  SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Consumer<LightAndDarkColor>(
                                      builder: (context, value, child) => Text(
                                        "TTL : Madiun, 23 Agustus 2003",
                                        style: TextStyle(
                                            fontSize: 20, color: value.color),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.01,
                                  ),
                                  SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Consumer<LightAndDarkColor>(
                                      builder: (context, value, child) => Text(
                                        "Alamat : JL Raya Ponorogo Nomor 20",
                                        style: TextStyle(
                                            fontSize: 20, color: value.color),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.01,
                                  ),
                                  SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Consumer<LightAndDarkColor>(
                                      builder: (context, value, child) => Text(
                                        "Email : yudhosakti28@gmail.com",
                                        style: TextStyle(
                                            fontSize: 20, color: value.color),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.01,
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Consumer<LightAndDarkColor>(
                            builder: (context, value, child) => Text(
                              "Hobi",
                              style: TextStyle(
                                  color: value.color,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 20),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.2,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: gambar.length,
                        itemBuilder: (context, index) {
                          return Card(
                            color: nilai == false ? Colors.white : Colors.black,
                            elevation: 15,
                            child: Container(
                              margin: EdgeInsets.symmetric(horizontal: 4),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8)),
                              width: MediaQuery.of(context).size.width * 0.3,
                              height: MediaQuery.of(context).size.height * 0.15,
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.3,
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.12,
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                              image:
                                                  NetworkImage(gambar[index]),
                                              fit: BoxFit.fill)),
                                    ),
                                  ),
                                  Expanded(
                                      child: Container(
                                    child: Center(
                                        child: Consumer<LightAndDarkColor>(
                                      builder: (context, value, child) => Text(
                                        namaHobi[index],
                                        style: TextStyle(fontSize: 20,color: value.color ),
                                      ),
                                    )),
                                  ))
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.01,
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class RiwayatPendidikanWidget extends StatelessWidget {
  const RiwayatPendidikanWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Consumer<LightAndDarkColor>(
          builder: (context, value, child) => Text(
            "Riwayat Pendidikan",
            style: TextStyle(fontSize: 20, color: value.color),
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.01,
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Consumer<LightAndDarkColor>(
            builder: (context, value, child) => Text(
              "SD : SDN Purworejo 01",
              style: TextStyle(fontSize: 20, color: value.color),
            ),
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.01,
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Consumer<LightAndDarkColor>(
            builder: (context, value, child) => Text(
              "SMP : SMPN 1 Geger",
              style: TextStyle(fontSize: 20, color: value.color),
            ),
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.01,
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Consumer<LightAndDarkColor>(
            builder: (context, value, child) => Text(
              "SMA : SMAN 1 Geger",
              style: TextStyle(fontSize: 20, color: value.color),
            ),
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.01,
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Consumer<LightAndDarkColor>(
            builder: (context, value, child) => Text(
              "PTN : Politeknik Negeri Madiun",
              style: TextStyle(fontSize: 20, color: value.color),
            ),
          ),
        ),
      ],
    );
  }
}
