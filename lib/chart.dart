import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ChartData {
  ChartData(this.x, this.open, this.high, this.low, this.close);
  final DateTime x;
  final double open;
  final double high;
  final double low;
  final double close;
}

class TradingChart extends StatelessWidget {
  const TradingChart({super.key});

  @override
  Widget build(BuildContext context) {
    // Dữ liệu giả lập
    final List<ChartData> data = [
      ChartData(DateTime(2026, 3, 1), 150, 160, 145, 155),
      ChartData(DateTime(2026, 3, 2), 155, 170, 150, 165),
      ChartData(DateTime(2026, 3, 3), 165, 168, 155, 158),
    ];

    return Scaffold(
      body: Center(
        child: SfCartesianChart(
          // Cấu hình trục thời gian (X)
          primaryXAxis: DateTimeAxis(),
          // Cấu hình các công cụ tương tác
          trackballBehavior: TrackballBehavior(
            enable: true,
            tooltipSettings: InteractiveTooltip(enable: true),
          ),
          zoomPanBehavior: ZoomPanBehavior(
            enablePinching: true, // Cho phép zoom bằng 2 ngón tay
            enablePanning: true, // Cho phép kéo trượt
          ),
          series: <CandleSeries<ChartData, DateTime>>[
            CandleSeries<ChartData, DateTime>(
              dataSource: data,
              xValueMapper: (ChartData sales, _) => sales.x,
              lowValueMapper: (ChartData sales, _) => sales.low,
              highValueMapper: (ChartData sales, _) => sales.high,
              openValueMapper: (ChartData sales, _) => sales.open,
              closeValueMapper: (ChartData sales, _) => sales.close,
              // Tùy chỉnh màu sắc nến
              bearColor: Colors.red,
              bullColor: Colors.green,
            ),
          ],
        ),
      ),
    );
  }
}
