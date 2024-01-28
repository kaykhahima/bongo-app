import 'package:bongo_app/features/home/models/event.dart';
import 'package:bongo_app/features/home/models/payment_methods.dart';
import 'package:bongo_app/features/home/models/saved_cards.dart';
import 'package:bongo_app/features/home/models/seat.dart';
import 'package:bongo_app/shared/widgets/alerts.dart';
import 'package:bongo_app/utils/constants.dart';
import 'package:flutter/material.dart';

import '../models/main_activity.dart';
import '../models/movie.dart';

class HomeProvider extends ChangeNotifier {
  final List<MainActivity> _mainActivities = [
    const MainActivity(title: 'Movies', icon: Icons.live_tv_outlined),
    const MainActivity(title: 'Food', icon: Icons.fastfood_outlined),
    const MainActivity(title: 'Parties', icon: Icons.celebration_outlined),
    const MainActivity(title: 'Events', icon: Icons.calendar_month_outlined),
  ];

  final List<Event> _events = [
    Event(
        name: 'Hello Jua',
        date: DateTime.now().add(const Duration(days: 6)),
        location: 'Wavuvi Kempu + Samaki Samaki',
        imagePath: AssetConstants.helloJua),
    Event(
        name: 'Sensation',
        date: DateTime.now().add(const Duration(days: 4)),
        location: 'Mbezi',
        imagePath: AssetConstants.sensation),
    Event(
        name: 'Overdose Night',
        date: DateTime.now().add(const Duration(days: 1)),
        location: 'Tabata',
        imagePath: AssetConstants.overdoseNight),
    Event(
        name: 'Accoustic Groves',
        date: DateTime.now().add(const Duration(days: 12)),
        location: 'Samaki Samaki',
        imagePath: AssetConstants.acousticGrooves),
    Event(
        name: 'The Big Hangout',
        date: DateTime.now().add(const Duration(days: 15)),
        location: 'Samaki Samaki',
        imagePath: AssetConstants.theBigHangout),
  ];

  final List<Movie> _movies = [
    Movie(
      title: 'Avatar',
      posterPath: AssetConstants.avatar,
      genres: ['Sci-fi', 'Action'],
      isNowShowing: false,
      isTrending: false,
      datesAiring: [
        DateTime.now().add(const Duration(days: 1)),
        DateTime.now().add(const Duration(days: 2)),
        DateTime.now().add(const Duration(days: 3)),
        DateTime.now().add(const Duration(days: 4)),
      ],
      venues: [
        MovieVenue(
          location: 'Mlimani City',
          movieType: '2D',
          timesShowing: [
            DateTime.now().add(const Duration(hours: 1)),
            DateTime.now().add(const Duration(hours: 2)),
            DateTime.now().add(const Duration(hours: 3)),
            DateTime.now().add(const Duration(hours: 4)),
          ],
        ),
        MovieVenue(
          location: 'Aura Mall',
          movieType: '3D',
          timesShowing: [
            DateTime.now().add(const Duration(hours: 3)),
            DateTime.now().add(const Duration(hours: 2)),
            DateTime.now().add(const Duration(hours: 1)),
            DateTime.now().add(const Duration(hours: 4)),
          ],
        ),
        MovieVenue(
          location: 'Dar Free Market',
          movieType: '2D',
          timesShowing: [
            DateTime.now().add(const Duration(hours: 2)),
            DateTime.now().add(const Duration(hours: 5)),
            DateTime.now().add(const Duration(hours: 1)),
            DateTime.now().add(const Duration(hours: 3)),
          ],
        ),
      ],
    ),
    Movie(
      title: 'Oppenheimer',
      posterPath: AssetConstants.oppenheimer,
      genres: ['Thriller'],
      isNowShowing: true,
      isTrending: false,
      datesAiring: [
        DateTime.now().add(const Duration(days: 1)),
        DateTime.now().add(const Duration(days: 2)),
        DateTime.now().add(const Duration(days: 3)),
        DateTime.now().add(const Duration(days: 4)),
      ],
      venues: [
        MovieVenue(
          location: 'Mlimani City',
          movieType: '2D',
          timesShowing: [
            DateTime.now().add(const Duration(days: 1)),
            DateTime.now().add(const Duration(days: 2)),
            DateTime.now().add(const Duration(days: 3)),
            DateTime.now().add(const Duration(days: 4)),
          ],
        ),
        MovieVenue(
          location: 'Aura Mall',
          movieType: '3D',
          timesShowing: [
            DateTime.now().add(const Duration(days: 1)),
            DateTime.now().add(const Duration(days: 2)),
            DateTime.now().add(const Duration(days: 3)),
            DateTime.now().add(const Duration(days: 4)),
          ],
        ),
        MovieVenue(
          location: 'Dar Free Market',
          movieType: '2D',
          timesShowing: [
            DateTime.now().add(const Duration(days: 1)),
            DateTime.now().add(const Duration(days: 2)),
            DateTime.now().add(const Duration(days: 3)),
            DateTime.now().add(const Duration(days: 4)),
          ],
        ),
      ],
    ),
    Movie(
      title: 'Blue Beetle',
      posterPath: AssetConstants.blueBeetle,
      genres: ['Action', 'Sci-fi'],
      isNowShowing: true,
      isTrending: false,
      datesAiring: [
        DateTime.now().add(const Duration(days: 1)),
        DateTime.now().add(const Duration(days: 2)),
        DateTime.now().add(const Duration(days: 3)),
        DateTime.now().add(const Duration(days: 4)),
      ],
      venues: [
        MovieVenue(
          location: 'Mlimani City',
          movieType: '2D',
          timesShowing: [
            DateTime.now().add(const Duration(days: 1)),
            DateTime.now().add(const Duration(days: 2)),
            DateTime.now().add(const Duration(days: 3)),
            DateTime.now().add(const Duration(days: 4)),
          ],
        ),
        MovieVenue(
          location: 'Aura Mall',
          movieType: '3D',
          timesShowing: [
            DateTime.now().add(const Duration(days: 1)),
            DateTime.now().add(const Duration(days: 2)),
            DateTime.now().add(const Duration(days: 3)),
            DateTime.now().add(const Duration(days: 4)),
          ],
        ),
        MovieVenue(
          location: 'Dar Free Market',
          movieType: '2D',
          timesShowing: [
            DateTime.now().add(const Duration(days: 1)),
            DateTime.now().add(const Duration(days: 2)),
            DateTime.now().add(const Duration(days: 3)),
            DateTime.now().add(const Duration(days: 4)),
          ],
        ),
      ],
    ),
    Movie(
      title: 'Godzilla Minus One',
      posterPath: AssetConstants.godzillaMinusOne,
      genres: ['Action', 'Sci-fi'],
      isNowShowing: false,
      isTrending: true,
      datesAiring: [
        DateTime.now().add(const Duration(days: 1)),
        DateTime.now().add(const Duration(days: 2)),
        DateTime.now().add(const Duration(days: 3)),
        DateTime.now().add(const Duration(days: 4)),
      ],
      venues: [
        MovieVenue(
          location: 'Mlimani City',
          movieType: '2D',
          timesShowing: [
            DateTime.now().add(const Duration(days: 1)),
            DateTime.now().add(const Duration(days: 2)),
            DateTime.now().add(const Duration(days: 3)),
            DateTime.now().add(const Duration(days: 4)),
          ],
        ),
        MovieVenue(
          location: 'Aura Mall',
          movieType: '3D',
          timesShowing: [
            DateTime.now().add(const Duration(days: 1)),
            DateTime.now().add(const Duration(days: 2)),
            DateTime.now().add(const Duration(days: 3)),
            DateTime.now().add(const Duration(days: 4)),
          ],
        ),
        MovieVenue(
          location: 'Dar Free Market',
          movieType: '2D',
          timesShowing: [
            DateTime.now().add(const Duration(days: 1)),
            DateTime.now().add(const Duration(days: 2)),
            DateTime.now().add(const Duration(days: 3)),
            DateTime.now().add(const Duration(days: 4)),
          ],
        ),
      ],
    ),
    Movie(
      title: 'Migration',
      posterPath: AssetConstants.migration,
      genres: ['Comedy', 'Adventure'],
      isNowShowing: true,
      isTrending: false,
      datesAiring: [
        DateTime.now().add(const Duration(days: 1)),
        DateTime.now().add(const Duration(days: 2)),
        DateTime.now().add(const Duration(days: 3)),
        DateTime.now().add(const Duration(days: 4)),
      ],
      venues: [
        MovieVenue(
          location: 'Mlimani City',
          movieType: '2D',
          timesShowing: [
            DateTime.now().add(const Duration(days: 1)),
            DateTime.now().add(const Duration(days: 2)),
            DateTime.now().add(const Duration(days: 3)),
            DateTime.now().add(const Duration(days: 4)),
          ],
        ),
        MovieVenue(
          location: 'Aura Mall',
          movieType: '3D',
          timesShowing: [
            DateTime.now().add(const Duration(days: 1)),
            DateTime.now().add(const Duration(days: 2)),
            DateTime.now().add(const Duration(days: 3)),
            DateTime.now().add(const Duration(days: 4)),
          ],
        ),
        MovieVenue(
          location: 'Dar Free Market',
          movieType: '2D',
          timesShowing: [
            DateTime.now().add(const Duration(days: 1)),
            DateTime.now().add(const Duration(days: 2)),
            DateTime.now().add(const Duration(days: 3)),
            DateTime.now().add(const Duration(days: 4)),
          ],
        ),
      ],
    ),
    Movie(
      title: 'Spiderman: Across the Spiderverse',
      posterPath: AssetConstants.spiderman,
      genres: ['Action', 'Comedy'],
      isNowShowing: false,
      isTrending: true,
      datesAiring: [
        DateTime.now().add(const Duration(days: 1)),
        DateTime.now().add(const Duration(days: 2)),
        DateTime.now().add(const Duration(days: 3)),
        DateTime.now().add(const Duration(days: 4)),
      ],
      venues: [
        MovieVenue(
          location: 'Mlimani City',
          movieType: '2D',
          timesShowing: [
            DateTime.now().add(const Duration(days: 1)),
            DateTime.now().add(const Duration(days: 2)),
            DateTime.now().add(const Duration(days: 3)),
            DateTime.now().add(const Duration(days: 4)),
          ],
        ),
        MovieVenue(
          location: 'Aura Mall',
          movieType: '3D',
          timesShowing: [
            DateTime.now().add(const Duration(days: 1)),
            DateTime.now().add(const Duration(days: 2)),
            DateTime.now().add(const Duration(days: 3)),
            DateTime.now().add(const Duration(days: 4)),
          ],
        ),
        MovieVenue(
          location: 'Dar Free Market',
          movieType: '2D',
          timesShowing: [
            DateTime.now().add(const Duration(days: 1)),
            DateTime.now().add(const Duration(days: 2)),
            DateTime.now().add(const Duration(days: 3)),
            DateTime.now().add(const Duration(days: 4)),
          ],
        ),
      ],
    ),
    Movie(
      title: 'The Batman',
      posterPath: AssetConstants.theBatman,
      genres: ['Action', 'Crime'],
      isNowShowing: false,
      isTrending: true,
      datesAiring: [
        DateTime.now().add(const Duration(days: 1)),
        DateTime.now().add(const Duration(days: 2)),
        DateTime.now().add(const Duration(days: 3)),
        DateTime.now().add(const Duration(days: 4)),
      ],
      venues: [
        MovieVenue(
          location: 'Mlimani City',
          movieType: '2D',
          timesShowing: [
            DateTime.now().add(const Duration(days: 1)),
            DateTime.now().add(const Duration(days: 2)),
            DateTime.now().add(const Duration(days: 3)),
            DateTime.now().add(const Duration(days: 4)),
          ],
        ),
        MovieVenue(
          location: 'Aura Mall',
          movieType: '3D',
          timesShowing: [
            DateTime.now().add(const Duration(days: 1)),
            DateTime.now().add(const Duration(days: 2)),
            DateTime.now().add(const Duration(days: 3)),
            DateTime.now().add(const Duration(days: 4)),
          ],
        ),
        MovieVenue(
          location: 'Dar Free Market',
          movieType: '2D',
          timesShowing: [
            DateTime.now().add(const Duration(days: 1)),
            DateTime.now().add(const Duration(days: 2)),
            DateTime.now().add(const Duration(days: 3)),
            DateTime.now().add(const Duration(days: 4)),
          ],
        ),
      ],
    ),
    Movie(
      title: 'The Marvels',
      posterPath: AssetConstants.theMarvels,
      genres: ['Action', 'Adventure'],
      isNowShowing: true,
      isTrending: true,
      datesAiring: [
        DateTime.now().add(const Duration(days: 1)),
        DateTime.now().add(const Duration(days: 2)),
        DateTime.now().add(const Duration(days: 3)),
        DateTime.now().add(const Duration(days: 4)),
      ],
      venues: [
        MovieVenue(
          location: 'Mlimani City',
          movieType: '2D',
          timesShowing: [
            DateTime.now().add(const Duration(days: 1)),
            DateTime.now().add(const Duration(days: 2)),
            DateTime.now().add(const Duration(days: 3)),
            DateTime.now().add(const Duration(days: 4)),
          ],
        ),
        MovieVenue(
          location: 'Aura Mall',
          movieType: '3D',
          timesShowing: [
            DateTime.now().add(const Duration(days: 1)),
            DateTime.now().add(const Duration(days: 2)),
            DateTime.now().add(const Duration(days: 3)),
            DateTime.now().add(const Duration(days: 4)),
          ],
        ),
        MovieVenue(
          location: 'Dar Free Market',
          movieType: '2D',
          timesShowing: [
            DateTime.now().add(const Duration(days: 1)),
            DateTime.now().add(const Duration(days: 2)),
            DateTime.now().add(const Duration(days: 3)),
            DateTime.now().add(const Duration(days: 4)),
          ],
        ),
      ],
    ),
  ];

  final List<SeatRow> _seatRows = [
    SeatRow(
      rowId: 'A',
      seats: [
        Seat(number: 1, seatStatus: SeatStatus.available),
        Seat(number: 2, seatStatus: SeatStatus.available),
        Seat(number: 3, seatStatus: SeatStatus.booked),
        Seat(number: 4, seatStatus: SeatStatus.available),
        Seat(number: 5, seatStatus: SeatStatus.available),
        Seat(number: 6, seatStatus: SeatStatus.available),
        Seat(number: 7, seatStatus: SeatStatus.available),
        Seat(number: 8, seatStatus: SeatStatus.available),
      ],
    ),
    SeatRow(
      rowId: 'B',
      seats: [
        Seat(number: 1, seatStatus: SeatStatus.available),
        Seat(number: 2, seatStatus: SeatStatus.available),
        Seat(number: 3, seatStatus: SeatStatus.available),
        Seat(number: 4, seatStatus: SeatStatus.processing),
        Seat(number: 5, seatStatus: SeatStatus.processing),
        Seat(number: 6, seatStatus: SeatStatus.processing),
        Seat(number: 7, seatStatus: SeatStatus.processing),
        Seat(number: 8, seatStatus: SeatStatus.processing),
      ],
    ),
    SeatRow(
      rowId: 'C',
      seats: [
        Seat(number: 1, seatStatus: SeatStatus.available),
        Seat(number: 2, seatStatus: SeatStatus.available),
        Seat(number: 3, seatStatus: SeatStatus.booked),
        Seat(number: 4, seatStatus: SeatStatus.blocked),
        Seat(number: 5, seatStatus: SeatStatus.blocked),
        Seat(number: 6, seatStatus: SeatStatus.blocked),
        Seat(number: 7, seatStatus: SeatStatus.blocked),
        Seat(number: 8, seatStatus: SeatStatus.available),
      ],
    ),
    SeatRow(
      rowId: 'D',
      seats: [
        Seat(number: 1, seatStatus: SeatStatus.available),
        Seat(number: 2, seatStatus: SeatStatus.available),
        Seat(number: 3, seatStatus: SeatStatus.available),
        Seat(number: 4, seatStatus: SeatStatus.blocked),
        Seat(number: 5, seatStatus: SeatStatus.blocked),
        Seat(number: 6, seatStatus: SeatStatus.available),
        Seat(number: 7, seatStatus: SeatStatus.available),
        Seat(number: 8, seatStatus: SeatStatus.processing),
      ],
    ),
    SeatRow(
      rowId: 'E',
      seats: [
        Seat(number: 1, seatStatus: SeatStatus.available),
        Seat(number: 2, seatStatus: SeatStatus.available),
        Seat(number: 3, seatStatus: SeatStatus.available),
        Seat(number: 4, seatStatus: SeatStatus.booked),
        Seat(number: 5, seatStatus: SeatStatus.processing),
        Seat(number: 6, seatStatus: SeatStatus.booked),
        Seat(number: 7, seatStatus: SeatStatus.available),
        Seat(number: 8, seatStatus: SeatStatus.processing),
      ],
    ),
    SeatRow(
      rowId: 'F',
      seats: [
        Seat(number: 1, seatStatus: SeatStatus.booked),
        Seat(number: 2, seatStatus: SeatStatus.processing),
        Seat(number: 3, seatStatus: SeatStatus.available),
        Seat(number: 4, seatStatus: SeatStatus.available),
        Seat(number: 5, seatStatus: SeatStatus.available),
        Seat(number: 6, seatStatus: SeatStatus.processing),
        Seat(number: 7, seatStatus: SeatStatus.processing),
        Seat(number: 8, seatStatus: SeatStatus.available),
      ],
    ),
    SeatRow(
      rowId: 'G',
      seats: [
        Seat(number: 1, seatStatus: SeatStatus.blocked),
        Seat(number: 2, seatStatus: SeatStatus.blocked),
        Seat(number: 3, seatStatus: SeatStatus.available),
        Seat(number: 4, seatStatus: SeatStatus.processing),
        Seat(number: 5, seatStatus: SeatStatus.available),
        Seat(number: 6, seatStatus: SeatStatus.available),
        Seat(number: 7, seatStatus: SeatStatus.blocked),
        Seat(number: 8, seatStatus: SeatStatus.blocked),
      ],
    ),
  ];

  final List<SavedCard> _savedCards = [
    SavedCard(
        cardNumber: '************ 1234',
        cardType: 'MasterCard',
        isSelected: true),
    SavedCard(
        cardNumber: '************ 4321', cardType: 'Visa', isSelected: false),
  ];

  final List<PaymentMethod> _paymentMethods = [
    PaymentMethod(name: 'Mpesa', logo: AssetConstants.MPesa),
    PaymentMethod(name: 'Airtel Money', logo: AssetConstants.airtelMoney),
    PaymentMethod(name: 'Tigo Pesa', logo: AssetConstants.tigoPesa),
  ];

  List<MainActivity> get mainActivities => _mainActivities;

  List<Event> get events => _events;

  List<Movie> get movies => _movies;

  List<Movie> get trendingMovies =>
      _movies.where((movie) => movie.isTrending).toList();

  List<Movie> get nowShowingMovies =>
      _movies.where((movie) => movie.isNowShowing).toList();

  List<String> get uniqueMovieGenres => _movies
      .map((movie) => movie.genres)
      .expand((element) => element)
      .toSet()
      .toList();

  List<SeatRow> get seatRows => _seatRows;

  get seatColumns => _seatRows[0].seats.length;

  List<SavedCard> get savedCards => _savedCards;

  List<PaymentMethod> get paymentMethods => _paymentMethods;

  void updateSeatStatus({
    required BuildContext context,
    required String rowId,
    required String columnNumber,
    required SeatStatus seatStatus,
  }) {
    final int rowIndex =
        _seatRows.indexWhere((seatRow) => seatRow.rowId == rowId);
    final int columnIndex = _seatRows[rowIndex].seats.indexWhere(
        (seatColumn) => seatColumn.number.toString() == columnNumber);

    _showNotification(context, rowId, columnNumber, seatStatus);

    if (seatStatus == SeatStatus.available) {
      _seatRows[rowIndex].seats[columnIndex].seatStatus = SeatStatus.selected;
    } else if (seatStatus == SeatStatus.selected) {
      _seatRows[rowIndex].seats[columnIndex].seatStatus = SeatStatus.available;
    }

    notifyListeners();
  }

  void _showNotification(BuildContext context, String rowId,
      String columnNumber, SeatStatus seatStatus) {
    print('Seat $rowId$columnNumber : Status: $seatStatus');
    String selectedSeat = '$rowId$columnNumber';

    late AlertType type;
    late String message;
    late String title;

    switch (seatStatus) {
      case SeatStatus.available:
        type = AlertType.info;
        message = '$selectedSeat selected';
        title = 'Success';
        break;
      case SeatStatus.selected:
        type = AlertType.info;
        message = '$selectedSeat unselected';
        title = 'Info';
        break;
      case SeatStatus.booked:
        type = AlertType.error;
        message = '$selectedSeat is already booked';
        title = 'Booked';
        break;
      case SeatStatus.processing:
        type = AlertType.error;
        message = '$selectedSeat is unavailable';
        title = 'Info';
        break;
      case SeatStatus.blocked:
        type = AlertType.error;
        message = '$selectedSeat is blocked';
        title = 'Info';
        break;
    }

    Alerts.show(context: context, title: title, message: message, type: type);
  }

  void selectCard(SavedCard card) {
    for (var savedCard in _savedCards) {
      savedCard.isSelected = false;
    }

    card.isSelected = true;

    notifyListeners();
  }
}
