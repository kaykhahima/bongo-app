class Seat {
  final int number;
  SeatStatus seatStatus;

  Seat({
    required this.number,
    required this.seatStatus,
  });
}

class SeatRow {
  final String rowId;
  final List<Seat> seats;

  SeatRow({
    required this.rowId,
    required this.seats,
  });
}

class SeatGrid {
  final List<SeatRow> rows;

  SeatGrid({
    required this.rows,
  });
}

enum SeatStatus { available, booked, selected, processing, blocked }
