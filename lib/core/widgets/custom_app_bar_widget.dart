import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: SizedBox(
          width: double.infinity,
          //height: 30,
          child: Row(children: const [
            Icon(
              Icons.movie_creation_outlined,
              color: Colors.blue,
            ),
            SizedBox(width: 5),
            Text(
              'Cinemapedia',
              style: TextStyle(fontSize: 17, fontFamily: 'Poppins'),
            ),
            Spacer(),
            Icon(Icons.search)
          ]),
        ),
      ),
    );
  }
}
