import 'package:desktop/controllers/global_controller.dart';
import 'package:desktop/shell.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:media_kit/media_kit.dart';
import 'package:window_manager/window_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  MediaKit.ensureInitialized();
  await windowManager.ensureInitialized();

  final option = WindowOptions(
      size: Size(1360, 850),
      center: true,
      backgroundColor: Colors.transparent,
      skipTaskbar: false,
      title: '即时影视',
      windowButtonVisibility: false,
      titleBarStyle: TitleBarStyle.hidden);

  windowManager.waitUntilReadyToShow(option, () async {
    await windowManager.show();
    await windowManager.focus();
  });

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialBinding: GlobalController(),
      title: '即时影视',
      theme: ThemeData(
        fontFamily: 'HarmonyOS_Sans_SC',
        colorScheme:
            ColorScheme.fromSeed(seedColor: Color.fromRGBO(255, 255, 255, 1)),
        scaffoldBackgroundColor: Colors.white,
        cardColor: Colors.white,
        useMaterial3: true,
      ),
      home: AppWindow(),
    );
  }
}

class AppWindow extends StatelessWidget {
  const AppWindow({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: DragToResizeArea(
        resizeEdgeColor: Colors.transparent,
        child: Stack(
          children: [
            Positioned.fill(child: Expanded(child: Shell())),
            Positioned(
              left: 0,
              top: 0,
              right: 0,
              child: Align(
                alignment: Alignment.topRight,
                child: const SizedBox(
                  height: 40,
                  child: WindowCaption(),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
