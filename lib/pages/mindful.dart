import 'package:flutter/material.dart';

import '../components/mindful_card.dart';
import '../components/app_bottom_nav.dart';
import '../components/start_day_card.dart';
import '../components/app_logo.dart';
import '../utils/styles.dart';

class MindfulScreen extends StatefulWidget {
  const MindfulScreen({super.key});

  @override
  State<MindfulScreen> createState() => _MindfulScreenState();
}

class _MindfulScreenState extends State<MindfulScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _headerAnim;
  late final List<Animation<double>> _fadeAnims;
  late final List<Animation<Offset>> _slideAnims;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900),
    );

    _headerAnim = CurvedAnimation(
      parent: _controller,
      curve: const Interval(0.0, 0.18, curve: Curves.easeOut),
    );

    // Create staggered intervals for 4 cards
    final intervals = [
      const Interval(0.12, 0.42, curve: Curves.easeOut),
      const Interval(0.22, 0.52, curve: Curves.easeOut),
      const Interval(0.32, 0.62, curve: Curves.easeOut),
      const Interval(0.42, 0.72, curve: Curves.easeOut),
      const Interval(0.50, 0.80, curve: Curves.easeOut),
    ];

    _fadeAnims = intervals
        .map(
          (interval) => CurvedAnimation(parent: _controller, curve: interval),
        )
        .toList();

    _slideAnims = intervals
        .map(
          (interval) => Tween<Offset>(
            begin: const Offset(0, 0.08),
            end: Offset.zero,
          ).animate(CurvedAnimation(parent: _controller, curve: interval)),
        )
        .toList();

    // start the animation
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      bottomNavigationBar: const AppBottomNavigationBar(currentIndex: 3),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeader(),
              const SizedBox(height: 20),
              Expanded(
                child: ListView(
                  children: [
                    _animatedCard(
                      index: 0,
                      child: MindfulCard(
                        icon: Icons.air,
                        iconColor: Colors.blue,
                        title: 'Breathing Exercise',
                        subtitle: 'Guided deep breathing to calm your mind',
                        duration: '5 min',
                      ),
                    ),
                    _animatedCard(
                      index: 1,
                      child: MindfulCard(
                        icon: Icons.psychology,
                        iconColor: Colors.purple,
                        title: 'Body Scan',
                        subtitle: 'Progressive relaxation meditation',
                        duration: '10 min',
                      ),
                    ),
                    _animatedCard(
                      index: 2,
                      child: MindfulCard(
                        icon: Icons.headphones,
                        iconColor: Colors.orange,
                        title: 'Ambient Sounds',
                        subtitle: 'Nature sounds for focus and relaxation',
                        duration: '15 min',
                      ),
                    ),
                    _animatedCard(
                      index: 3,
                      child: MindfulCard(
                        icon: Icons.local_florist_rounded,
                        iconColor: Colors.teal,
                        title: 'Gratitude Practice',
                        subtitle: 'Reflect on positive moments in your day',
                        duration: '3 min',
                      ),
                    ),
                    _animatedCard(
                      index: 4,
                      child: StartDayCard(),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              'Mindfulness',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 4),
            Text(
              'Practices to center yourself',
              style: TextStyle(color: Colors.grey),
            ),
          ],
        ),
        // Animated header icon (rotation + fade)
        FadeTransition(
          opacity: _headerAnim,
          child: RotationTransition(
            turns: Tween<double>(begin: -0.05, end: 0.0).animate(_headerAnim),
            child: AppLogo(),
          ),
        ),
      ],
    );
  }

  Widget _animatedCard({required int index, required Widget child}) {
    final fade = _fadeAnims[index];
    final slide = _slideAnims[index];

    return FadeTransition(
      opacity: fade,
      child: SlideTransition(position: slide, child: child),
    );
  }
}
