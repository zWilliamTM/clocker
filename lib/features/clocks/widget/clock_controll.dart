import 'dart:async';
import 'package:clocker/features/clocks/utils/formats.dart';
import 'package:clocker/features/clocks/widget/box_styled.dart';
import 'package:flutter/material.dart';

class ClockControll extends StatefulWidget {
  const ClockControll({super.key, this.onStart, required this.onStop});

  final VoidCallback? onStart;
  final Function(int) onStop;

  @override
  State<ClockControll> createState() => _ClockControllState();
}

class _ClockControllState extends State<ClockControll> {
  bool isRunning = false;
  int counter = 0;

  late StreamSubscription stream;

  void wrapStart() {
    if (isRunning) {
      return;
    }
    isRunning = true;

    stream = Stream.periodic(const Duration(seconds: 1), (x) => x).listen(
      (event) {
        setState(() {
          counter += 1;
        });
      },
    );
  }

  void wrapStop() {
    if (!isRunning) {
      return;
    }

    stream.cancel();
    isRunning = false;

    widget.onStop(counter);
    counter = 0;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return BoxStyled(
      child: Column(
        children: [
          _Time(counter: counter),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(onPressed: wrapStart, child: const Text('Start')),
              ElevatedButton(onPressed: wrapStop, child: const Text('Stop')),
            ],
          ),
        ],
      ),
    );
  }
}

class _Time extends StatelessWidget {
  const _Time({
    super.key,
    required this.counter,
  });

  final int counter;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: formatDuration(counter).split('').map((letter) {
        return SizedBox(
          width: 50,
          child: Center(
            child: Text(
              letter,
              style: const TextStyle(
                fontSize: 60,
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}
