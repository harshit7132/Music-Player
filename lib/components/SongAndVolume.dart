import 'package:flutter/material.dart';
import 'package:music_player/config/Colors.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class SongAndValume extends StatefulWidget {
  const SongAndValume({super.key});

  @override
  State<SongAndValume> createState() => _SongAndValumeState();
}

class _SongAndValumeState extends State<SongAndValume> {
  var value = 30.0;
  @override
  Widget build(BuildContext context) {
    return SfRadialGauge(
      animationDuration: 1,
      enableLoadingAnimation: true,
      axes: [
        RadialAxis(
          useRangeColorForAxis: true,
          startAngle: 0,
          endAngle: 180,
          canRotateLabels: false,
          interval: 10,
          isInversed: false,
          maximum: 100,
          minimum: 0,
          showAxisLine: true,
          showLabels: false,
          showTicks: true,
          ranges: [
            GaugeRange(
              startValue: 0,
              endValue: value,
              color: primaryColor,
            )
          ],
          pointers: [
            MarkerPointer(
              color: primaryColor,
              value: value,
              onValueChanged: (valuee) {
                setState(() {
                  value = valuee;
                });
              },
              enableAnimation: true,
              enableDragging: true,
              markerType: MarkerType.circle,
              markerWidth: 20,
              markerHeight: 20,
            )
          ],
          annotations: [
            GaugeAnnotation(
              horizontalAlignment: GaugeAlignment.center,
              widget: Container(
                width: 280,
                height: 280,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(1000),
                  image: DecorationImage(
                    image: AssetImage("assets/images/cover.jpg"),
                  ),
                  color: divColor,
                ),
              ),
            )
          ],
        ),
      ],
    );
  }
}
