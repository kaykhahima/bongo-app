import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class VenueTimes extends StatefulWidget {
  const VenueTimes({super.key, required this.timesShowing});

  final List<DateTime> timesShowing;

  @override
  State<VenueTimes> createState() => _VenueTimesState();
}

class _VenueTimesState extends State<VenueTimes> {
  List<bool> _isTimeSelected = [];

  @override
  void initState() {
    super.initState();
    _isTimeSelected = List<bool>.filled(widget.timesShowing.length, false);
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      itemCount: widget.timesShowing.length,
      itemBuilder: (BuildContext context, int i) {
        final time = widget.timesShowing[i];
        return Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: FilterChip(
            label: Text(DateFormat.Hm().format(time)),
            padding: const EdgeInsets.all(4.0),
            selected: _isTimeSelected[i],
            onSelected: (bool value) {
              setState(() {
                for (int j = 0; j < _isTimeSelected.length; j++) {
                  if (j != i) {
                    _isTimeSelected[j] = false;
                  }
                }

                _isTimeSelected[i] = !_isTimeSelected[i];
              });
            },
          ),
        );
      },
    );
  }
}
