import 'package:bongo_app/features/home/models/movie.dart';
import 'package:bongo_app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

import '../../../../shared/widgets/button.dart';
import '../widgets/seats_grid.dart';

class SeatSelectionPage extends StatefulWidget {
  const SeatSelectionPage({super.key, required this.movie});

  final Movie movie;

  @override
  State<SeatSelectionPage> createState() => _SeatSelectionPageState();
}

class _SeatSelectionPageState extends State<SeatSelectionPage> {
  final List<bool> _selectedSeats = List.generate(56, (index) => false);

  void _toggleSeatSelection(int index) {
    setState(() {
      _selectedSeats[index] = !_selectedSeats[index];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.movie.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset(
                AssetConstants.theaterScreen,
              ),
              const Gap(8.0),
              Text(
                'Screen is here',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: Theme.of(context).colorScheme.outline,
                    ),
              ),
              const Gap(24.0),
              const SeatGrid(),
              const Gap(24.0),
              PrimaryButton(
                  onPressed: () => context.push('/movies/payment'),
                  label: 'Get Tickets'),
              const Gap(24.0),
            ],
          ),
        ),
      ),
    );
  }
}
