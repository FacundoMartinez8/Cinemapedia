// import 'package:cinemapedia/features/movies/data/remote/models/movie_details.dart';
// import 'package:flutter/material.dart';

// class AnimatedChips extends StatefulWidget {
//   final List<Genre> genres;

//   AnimatedChips({required this.genres});

//   @override
//   _AnimatedChipsState createState() => _AnimatedChipsState();
// }

// class _AnimatedChipsState extends State<AnimatedChips>
//     with SingleTickerProviderStateMixin {
//   late AnimationController _animationController;
//   late Animation<double> _animation;

//   @override
//   void initState() {
//     super.initState();
//     _animationController = AnimationController(
//       vsync: this,
//       duration: Duration(seconds: 5), // Ajusta la duración de la animación según tus necesidades
//     )..repeat(reverse: true);
//     _animation = CurvedAnimation(
//       parent: _animationController,
//       curve: Curves.easeInOut,
//     );
//   }

//   @override
//   void dispose() {
//     _animationController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Wrap(
//       children: [
//         ...widget.genres.map((genre) => Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 0),
//               child: AnimatedContainer(
//                 duration: Duration(milliseconds: 500),
//                 curve: Curves.easeInOut,
//                 transform: Matrix4.translationValues(
//                   0,
//                   (_animation.value - 0.5) * 10, // Ajusta la distancia de desplazamiento según tus necesidades
//                   0,
//                 ),
//                 child: Chip(
//                   label: Text(genre.name),
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(25),
//                   ),
//                 ),
//               ),
//             ))
//       ],
//     );
//   }
// }
