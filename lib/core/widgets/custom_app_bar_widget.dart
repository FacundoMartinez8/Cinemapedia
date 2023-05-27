import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({Key? key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(right: 30),
        child: Row(
          children: const [
            Icon(
              Icons.movie_creation_outlined,
              color: Colors.blue,
              size: 28,
            ),
            SizedBox(width: 40),
            Text(
              'Cinemapedia',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                fontFamily: 'Poppins',
                color: Colors.black87,
              ),
            ),
            const Spacer(),
            Icon(
              Icons.search,
              color: Colors.black87,
              size: 28,
            ),
          ],
        ),
      ),
    );
  }
}
