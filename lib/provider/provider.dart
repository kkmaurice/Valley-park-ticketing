import 'package:flutter/material.dart';
import '../model/seats_model.dart';

class Controller with ChangeNotifier {
  var data = List.generate(200, (index) => index + 1);
  String? selectedValue;

  List<int> _paidSeats = [];

  List<Seats> get seats {
    final noOfSelectedSeats = int.parse(selectedValue.toString());

    return List.generate(noOfSelectedSeats,
        (index) => Seats(seatNumber: index + 1, isPaid: false));
  }

  void addToPaidList(Seats seat) {
    if (!_paidSeats.contains(seat.seatNumber)) {
      _paidSeats.add(seat.seatNumber);
    } else {
      _paidSeats.remove(seat.seatNumber);
    }
    notifyListeners();
  }

  bool isPaid(Seats seat) {
    return _paidSeats.contains(seat.seatNumber);
  }

  // get total amount
  double get totalAmount {
    final noOfSelectedSeats = _paidSeats.length;
    return noOfSelectedSeats * 1000;
  }

  // get number of paid seats
  int get paidSeatsCount => _paidSeats.length;

  void increment() {
    if (int.parse(selectedValue!) > 199) {
      return;
    } else {
      selectedValue = (int.parse(selectedValue!) + 1).toString();
    }
    notifyListeners();
  }

  void decrement() {
    if (int.parse(selectedValue!) > 1) {
      selectedValue = (int.parse(selectedValue!) - 1).toString();
    } else {
      return;
    }
    notifyListeners();
  }
}
