import 'package:flutter/material.dart';
import 'package:window_manager/window_manager.dart';

class TitleBar extends StatelessWidget {
  const TitleBar({super.key});

  Future<bool> isMaximizable() async {
    final ret = await windowManager.isMaximizable();
    return ret;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: isMaximizable(),
        builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
          Widget? widget;

          if (snapshot.hasData && snapshot.data == false) {
            widget = WindowCaptionButton.unmaximize(
              onPressed: () async {
                await windowManager.unmaximize();
              },
            );
          } else {
            widget = WindowCaptionButton.maximize(
              onPressed: () async {
                if (await windowManager.isMaximized()) {
                  await windowManager.restore();
                } else {
                  await windowManager.maximize();
                }
              },
            );
          }

          return DragToMoveArea(
              child: ColoredBox(
            color: Colors.amber,
            child: Row(
              children: [
                Expanded(child: Text('title')),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    WindowCaptionButton.minimize(
                      onPressed: () async {
                        await windowManager.minimize();
                      },
                    ),
                    widget,
                    WindowCaptionButton.close(
                      onPressed: () async {
                        await windowManager.close();
                      },
                    ),
                  ],
                )
              ],
            ),
          ));
        });
  }
}
