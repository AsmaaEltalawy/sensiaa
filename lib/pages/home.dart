import 'package:flutter/material.dart';
import 'package:sensia/utils/styles.dart';

import '../components/app_bottom_nav.dart';
import '../components/app_logo.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.orangeAccent,
        onPressed: () {},
        child: const Icon(Icons.add, color: Colors.white),
      ),
      bottomNavigationBar: const AppBottomNavigationBar(currentIndex: 0),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _header(),
              const SizedBox(height: 16),
              _gardenCard(),
              const SizedBox(height: 16),
              _weekCard(),
              const SizedBox(height: 16),
              _sectionTitle("Movies for Reflection", "Powered by TMDB"),
              const SizedBox(height: 12),
              _moviesList(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _header() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              "Hello, Alex",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 4),
            Text(
              "How are you feeling today?",
              style: TextStyle(color: Colors.grey),
            ),
          ],
        ),
        const AppLogo(padding: 8, iconSize: 28),
      ],
    );
  }

  Widget _gardenCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: const LinearGradient(
          colors: [Color(0xffE8F3F1), Color(0xffFDF1EC)],
        ),
      ),
      child: Column(
        children: [
          Row(
            children: const [
              Icon(Icons.local_florist, color: Colors.green, size: 70),
              SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Your Garden",
                    textAlign: TextAlign.start,
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    "Feeling Stressed",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    "Your emotional plant\nis growing beautifully",
                    textAlign: TextAlign.left,
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(child: _smallInfo("Streak", "12 days")),
              const SizedBox(width: 12),
              Expanded(child: _smallInfo("Entries", "47 total")),
            ],
          ),
        ],
      ),
    );
  }

  Widget _smallInfo(String title, String value) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Text(title, style: const TextStyle(color: Colors.grey)),
          const SizedBox(height: 4),
          Text(value, style: const TextStyle(fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }

  Widget _weekCard() {
    // sample week data (Mon..Sun). Replace with real data when available.
    final List<int> values = [3, 5, 2, 6, 4, 7, 5];

    return Container(
      height: 200,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: const [
              Icon(Icons.show_chart, color: Colors.orangeAccent),
              SizedBox(width: 8),
              Text("This Week", style: TextStyle(fontWeight: FontWeight.bold)),
            ],
          ),
          const SizedBox(height: 12),
          // Chart area
          Expanded(
            child: CustomPaint(
              painter: _WeekChartPainter(values),
              child: Container(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _sectionTitle(String title, String subtitle) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        Text(
          subtitle,
          style: const TextStyle(color: Colors.grey, fontSize: 12),
        ),
      ],
    );
  }
}

Widget _moviesList() {
  return SizedBox(
    height: 220,
    child: ListView(
      scrollDirection: Axis.horizontal,
      children: const [
        _MovieCard(
          title: "Inside Out",
          genre: "Animation • Family",
          rate: "8.1",
        ),
        _MovieCard(
          title: "Inside Out",
          genre: "Animation • Family",
          rate: "8.1",
        ),
        _MovieCard(
          title: "Inside Out",
          genre: "Animation • Family",
          rate: "8.1",
        ),
        _MovieCard(title: "Soul", genre: "Animation • Drama", rate: "8.0"),
        _MovieCard(title: "Soul", genre: "Animation • Drama", rate: "8.0"),
        _MovieCard(title: "Soul", genre: "Animation • Drama", rate: "8.0"),
      ],
    ),
  );
}

class _MovieCard extends StatelessWidget {
  final String title, genre, rate;

  const _MovieCard({
    required this.title,
    required this.genre,
    required this.rate,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 140,
      margin: const EdgeInsets.only(right: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(16),
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
          Text(genre, style: const TextStyle(fontSize: 11, color: Colors.grey)),
          Row(
            children: [
              const Icon(Icons.star, size: 14, color: Colors.orange),
              Text(rate),
            ],
          ),
        ],
      ),
    );
  }
}

// Painter that draws a linear line chart for 7 values (Mon..Sun) without filling the area — only a stroked gradient line and points.
class _WeekChartPainter extends CustomPainter {
  final List<int> values;
  final List<String> labels = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];

  _WeekChartPainter(this.values);

  @override
  void paint(Canvas canvas, Size size) {
    if (values.isEmpty) return;

    final paintAxis = Paint()
      ..color = Colors.grey.shade300
      ..strokeWidth = 1;

    final double paddingTop = 8;
    final double paddingBottom = 28; // space for weekday labels
    final double chartHeight = size.height - paddingTop - paddingBottom;
    final double chartWidth = size.width;
    final int maxVal = (values.isNotEmpty)
        ? values.reduce((a, b) => a > b ? a : b)
        : 1;
    final double leftPadding = 4;
    final double rightPadding = 4;

    // compute points (evenly spaced across width)
    final int n = values.length;
    final double usableWidth = chartWidth - leftPadding - rightPadding;
    final double stepX = n > 1 ? (usableWidth / (n - 1)) : 0;

    List<Offset> points = List.generate(n, (i) {
      final double x = leftPadding + i * stepX;
      final double normalized = maxVal > 0 ? (values[i] / maxVal) : 0.0;
      final double y =
          paddingTop + (chartHeight - normalized * (chartHeight - 6));
      return Offset(x, y);
    });

    // Draw baseline
    canvas.drawLine(
      Offset(0, paddingTop + chartHeight),
      Offset(chartWidth, paddingTop + chartHeight),
      paintAxis,
    );

    // Build line path
    final Path linePath = Path();
    for (int i = 0; i < points.length; i++) {
      if (i == 0) {
        linePath.moveTo(points[i].dx, points[i].dy);
      } else {
        linePath.lineTo(points[i].dx, points[i].dy);
      }
    }

    // Draw the line on top (stroke) using the app gradient for the stroke
    final Rect shaderRect = Rect.fromLTWH(
      0,
      paddingTop,
      chartWidth,
      chartHeight,
    );
    final Paint strokePaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3
      ..strokeCap = StrokeCap.round
      ..shader = kPrimaryButtonGradient.createShader(shaderRect);
    canvas.drawPath(linePath, strokePaint);

    // Draw points and labels
    final Paint dotPaint = Paint()..color = Colors.white;
    for (int i = 0; i < points.length; i++) {
      final p = points[i];
      // Outer circle with gradient border: draw circle filled with gradient by painting a circle with shader
      final double radius = 5;
      final Rect dotRect = Rect.fromCircle(center: p, radius: radius + 2);
      final Paint dotFill = Paint()
        ..shader = kPrimaryButtonGradient.createShader(dotRect);
      canvas.drawCircle(p, radius + 1.5, dotFill);
      // small inner white circle
      canvas.drawCircle(p, radius - 1.2, dotPaint);

      // value above point
      final tpValue = TextPainter(
        text: TextSpan(
          text: values[i].toString(),
          style: TextStyle(
            fontSize: 11,
            color: Colors.grey.shade800,
            fontWeight: FontWeight.bold,
          ),
        ),
        textDirection: TextDirection.ltr,
      )..layout();
      tpValue.paint(
        canvas,
        Offset(p.dx - tpValue.width / 2, p.dy - tpValue.height - 8),
      );

      // weekday label below baseline
      final tpLabel = TextPainter(
        text: TextSpan(
          text: labels[i],
          style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
        ),
        textDirection: TextDirection.ltr,
      )..layout();
      tpLabel.paint(
        canvas,
        Offset(p.dx - tpLabel.width / 2, paddingTop + chartHeight + 6),
      );
    }
  }

  @override
  bool shouldRepaint(covariant _WeekChartPainter oldDelegate) =>
      oldDelegate.values != values;
}
