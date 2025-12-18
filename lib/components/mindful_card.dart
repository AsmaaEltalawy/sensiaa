import 'package:flutter/material.dart';

class MindfulCard extends StatefulWidget {
  final IconData icon;
  final Color iconColor;
  final String title;
  final String subtitle;
  final String duration;

  const MindfulCard({
    super.key,
    required this.icon,
    required this.iconColor,
    required this.title,
    required this.subtitle,
    required this.duration,
  });

  @override
  State<MindfulCard> createState() => _MindfulCardState();
}

class _MindfulCardState extends State<MindfulCard> {
  bool _hovering = false;

  void _setHover(bool v) {
    if (mounted) setState(() => _hovering = v);
  }

  @override
  Widget build(BuildContext context) {
    // Slight scale and shadow when hovering (works on desktop/web)
    final double scale = _hovering ? 1.03 : 1.0;
    final shadowColor = Color.fromRGBO(0, 0, 0, _hovering ? 0.08 : 0.05);
    final boxShadow = [
      BoxShadow(
        color: shadowColor,
        blurRadius: _hovering ? 14 : 10,
        offset: const Offset(0, 6),
      ),
    ];

    // icon background with 15% alpha
    final int iconAlpha = (0.15 * 255).round(); // ~38
    final Color iconBgColor = widget.iconColor.withAlpha(iconAlpha);

    return MouseRegion(
      onEnter: (_) => _setHover(true),
      onExit: (_) => _setHover(false),
      child: AnimatedScale(
        scale: scale,
        duration: const Duration(milliseconds: 160),
        curve: Curves.easeOut,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 160),
          margin: const EdgeInsets.only(bottom: 16),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(18),
            boxShadow: boxShadow,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: iconBgColor,
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Icon(widget.icon, color: widget.iconColor, size: 28),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(widget.title,
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600)),
                    const SizedBox(height: 6),
                    Text(
                      widget.subtitle,
                      style: const TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: const Color(0xFFF2F2F2),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(widget.duration, style: const TextStyle(fontSize: 12)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
