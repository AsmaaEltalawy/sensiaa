import 'package:flutter/material.dart';

class StartDayCard extends StatefulWidget {
  const StartDayCard({super.key});

  @override
  State<StartDayCard> createState() => _StartDayCardState();
}

class _StartDayCardState extends State<StartDayCard> {
  bool _hovering = false;

  void _setHover(bool v) {
    if (mounted) setState(() => _hovering = v);
  }

  @override
  Widget build(BuildContext context) {
    final double scale = _hovering ? 1.03 : 1.0;
    final shadowColor = Color.fromRGBO(0, 0, 0, _hovering ? 0.08 : 0.06);

    return MouseRegion(
      onEnter: (_) => _setHover(true),
      onExit: (_) => _setHover(false),
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTapDown: (_) => _setHover(true),
        onTapUp: (_) => _setHover(false),
        onTapCancel: () => _setHover(false),
        onTap: () {
          // keep default behavior: start the exercise or navigate
        },
        child: AnimatedScale(
          scale: scale,
          duration: const Duration(milliseconds: 160),
          curve: Curves.easeOut,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 160),
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(22),
              boxShadow: [
                BoxShadow(
                  color: shadowColor,
                  blurRadius: _hovering ? 18 : 14,
                  offset: const Offset(0, 6),
                ),
              ],
            ),
            child: Column(
              children: [
                const Text(
                  'Start Your Day Right',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Begin with a 5-minute breathing\nexercise for optimal clarity',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                ),
                const SizedBox(height: 18),

                // Start Now Button
                SizedBox(
                  width: double.infinity,
                  height: 44,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      backgroundColor: const Color(0xFFA78BFA), // بنفسجي فاتح
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: const Text(
                      'Start Now',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
