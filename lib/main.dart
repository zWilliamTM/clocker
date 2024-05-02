import 'package:clocker/config/colors.dart';
import 'package:clocker/config/constants.dart';
import 'package:clocker/features/clocks/page/clocker_main_page.dart';
import 'package:desktop_window/desktop_window.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await DesktopWindow.setWindowSize(const Size(kWindowWidth, kWindowHeight));
  await DesktopWindow.setMinWindowSize(const Size(kWindowWidth, kWindowHeight));
  await DesktopWindow.setMaxWindowSize(const Size(kWindowWidth, kWindowHeight));
  await DesktopWindow.setFullScreen(false);

  await Hive.initFlutter();

  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      title: 'Clocker',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: kPrimary),
        useMaterial3: true,
      ),
      home: const ClockerMainPage(),
    );
  }
}
