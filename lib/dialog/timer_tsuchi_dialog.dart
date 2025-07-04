import 'package:flutter/material.dart';

class TimerTsuchiDialog extends StatelessWidget {
  const TimerTsuchiDialog({super.key});

  // todo : stackのアイコンを動的な位置に配置する

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Dialog(
          child: Container(
            height: 140,
            width: 300,
            padding: EdgeInsetsGeometry.directional(
              top: 40.0,
              start: 15.0,
              end: 15.0,
              bottom: 10.0,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('タイマーが終了しました', style: TextStyle(fontSize: 20.0)),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.red,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('閉じる'),
                ),
              ],
            ),
          ),
        ),
        Align(
          alignment: Alignment(0, -0.22),
          child: Container(
            padding: EdgeInsets.all(6.0),
            decoration: BoxDecoration(
              color: Colors.red,
              shape: BoxShape.circle,
            ),
            child: Icon(Icons.accessibility, color: Colors.white, size: 40.0,),
          ),
        ),
      ],
    );
  }
}
