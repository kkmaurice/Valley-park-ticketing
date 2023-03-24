import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class Seats {
  //final String id;
  final int seatNumber;
  final bool isPaid;
  Seats({
    //required this.id,
    required this.seatNumber,
    required this.isPaid,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      //'id': id,
      'seatNumber': seatNumber,
      'isPaid': isPaid,
    };
  }

  factory Seats.fromMap(Map<String, dynamic> map) {
    return Seats(
      //id: map['id'] as String,
      seatNumber: map['seatNumber'] as int,
      isPaid: map['isPaid'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory Seats.fromJson(String source) =>
      Seats.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Seats(seatNumber: $seatNumber, isPaid: $isPaid)';
}
