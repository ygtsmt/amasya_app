import "package:flutter/material.dart";

class OtobusVarisSuresiListScreen extends StatefulWidget {
  final Map<String, String> arrivalTimes;
  final String busNumber;
  final String arrivalTime;

  const OtobusVarisSuresiListScreen({
    super.key,
    required this.arrivalTimes,
    required this.busNumber,
    required this.arrivalTime,
  });

  @override
  State<OtobusVarisSuresiListScreen> createState() => _OtobusVarisSuresiListScreenState();
}

class _OtobusVarisSuresiListScreenState extends State<OtobusVarisSuresiListScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(final BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: widget.arrivalTimes.length,
            itemBuilder: (BuildContext context, int index) {
              String busNumber = widget.arrivalTimes.keys.elementAt(index);
              String arrivalTime = widget.arrivalTimes.values.elementAt(index);
              return Text(widget.arrivalTime);
            },
          ),
        ),
      ],
    );
  }
}
