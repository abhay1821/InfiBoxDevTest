import 'package:flutter/widgets.dart';

class BackgroundGradient extends StatelessWidget {
  const BackgroundGradient({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            const Color.fromARGB(255, 234, 240, 233).withOpacity(0.5),
            const Color.fromARGB(255, 216, 140, 89).withOpacity(0.9),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          stops: const [0, 1],
        ),
      ),
    );
  }
}
