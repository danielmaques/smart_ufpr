import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../core/core.dart';

class TileWidget extends StatelessWidget {
  const TileWidget({
    super.key,
    this.error = 0,
  });

  final int error;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Modular.to.navigate('/questionsPage');
      },
      child: Container(
        height: 100,
        width: 150,
        decoration: BoxDecoration(
          color: AppColors.BLACK1F,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            Container(
              height: 60,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: AppColors.PURPLE7D,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
              ),
              child: Center(
                child: Text(
                  'Erradas: $error',
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const Spacer(),
            const Text(
              'Erradas: ',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
