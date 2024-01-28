import 'package:bongo_app/features/home/models/seat.dart';
import 'package:bongo_app/features/home/provider/home_provider.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

class SeatGrid extends StatelessWidget {
  const SeatGrid({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 300.0,
          width: double.infinity,
          child: Consumer<HomeProvider>(builder: (context, homeProvider, _) {
            return ListView.builder(
              itemCount: homeProvider.seatRows.length,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                final seatRow = homeProvider.seatRows[index];
                final String rowId = seatRow.rowId;
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 10.0,
                      height: 40,
                      child: Center(
                        child: Text(
                          rowId,
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ),
                    ),
                    const Gap(4.0),
                    SizedBox(
                      height: 40,
                      width: 310,
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: seatRow.seats.length,
                        scrollDirection: Axis.horizontal,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          final seatColumn = seatRow.seats[index];
                          final String columnNumber =
                              seatColumn.number.toString();
                          return GestureDetector(
                            onTap: () {
                              homeProvider.updateSeatStatus(
                                context: context,
                                rowId: rowId,
                                columnNumber: columnNumber,
                                seatStatus: seatColumn.seatStatus,
                              );
                            },
                            child: SizedBox(
                              height: 38,
                              width: 38,
                              child: Icon(
                                Icons.chair,
                                color: _getIconColor(
                                    context, seatColumn.seatStatus),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                );
              },
            );
          }),
        ),
        const Gap(24.0),
        Wrap(
          alignment: WrapAlignment.center,
          children: [
            _buildSeatLegend(context, SeatStatus.available, 'Available'),
            _buildSeatLegend(context, SeatStatus.selected, 'Selected'),
            _buildSeatLegend(context, SeatStatus.booked, 'Booked'),
            _buildSeatLegend(context, SeatStatus.processing, 'Processing'),
            _buildSeatLegend(context, SeatStatus.blocked, 'Blocked'),
          ],
        ),
      ],
    );
  }

  Color _getIconColor(BuildContext context, SeatStatus seatStatus) {
    switch (seatStatus) {
      case SeatStatus.available:
        return Colors.grey.shade400;
      case SeatStatus.selected:
        return Theme.of(context).colorScheme.primary;
      case SeatStatus.booked:
        return Colors.lightBlueAccent;
      case SeatStatus.processing:
        return Colors.yellowAccent;
      case SeatStatus.blocked:
        return Theme.of(context).colorScheme.inversePrimary;
      default:
        return Colors.grey;
    }
  }

  _buildSeatLegend(BuildContext context, SeatStatus available, String s) {
    return SizedBox(
      width: 100.0,
      child: Row(
        children: [
          Container(
            width: 15.0,
            height: 15.0,
            decoration: BoxDecoration(
              color: _getIconColor(context, available),
              shape: BoxShape.circle,
            ),
          ),
          const Gap(8.0),
          Text(s),
        ],
      ),
    );
  }
}
