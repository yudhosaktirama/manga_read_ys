import 'package:flutter/material.dart';


class DoubleText extends StatelessWidget {
  final String Judultext;
  final IconData iconSelengkapnya;
  const DoubleText({
    required this.Judultext,
    required this.iconSelengkapnya,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            Judultext,
            style: const TextStyle(
                color: Colors.black, fontSize: 20, fontWeight: FontWeight.w600),
          ),
          IconButton(onPressed: () {}, icon: Icon(iconSelengkapnya))
        ],
      ),
    );
  }
}