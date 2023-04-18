import 'package:cinemapedia/core/failures/failure.dart';
import 'package:flutter/material.dart';

class GenericFailureWidget extends StatelessWidget {
  final Failure failure;
  final Function()? onTap;

  const GenericFailureWidget(
      {super.key, required this.failure, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return onError(failure);
  }

  Widget onError(Failure failure) {
    return Column(
      children: [
        Text(failure.message),
        ElevatedButton(
          onPressed: onTap,
          child: const Text('Reintentar'),
        )
      ],
    );
  }
}
