import 'package:clocker/features/daily/model/clock.dart';

class Daily {
  final DateTime createAt;
  final List<Clock> clocks;

  Daily({required this.createAt, required this.clocks});

  // factory Daily.formMap(Map json) => Daily(
  //       createAt: DateTime.parse(json['createAt']),
  //       clocks: json['clocks'].map<Clock>((e) => Clock.formMap(e)).toList(),
  //     );

  // Map toMap() => {
  //       'createAt': createAt.toIso8601String(),
  //       'clocks': clocks.map((e) => e.toMap()).toList(),
  //     };
}
