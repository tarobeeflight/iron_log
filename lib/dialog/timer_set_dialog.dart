import 'package:flutter/material.dart';

class TimerSetDialog extends StatelessWidget {
  const TimerSetDialog({super.key});

  // todo : stackのアイコンを動的な位置に配置する

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Dialog(
          child: Container(
            height: 250,
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
                Text('タイマー', style: TextStyle(fontSize: 25.0)),
                TextField(
                  decoration: InputDecoration(
                    labelText: '秒',
                    labelStyle: TextStyle(color: Colors.grey),
                    border: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue),
                    ),
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.red,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('セット'),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.red,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('キャンセル'),
                ),
              ],
            ),
          ),
        ),
        Align(
          alignment: Alignment(0, -0.39),
          child: Container(
            padding: EdgeInsets.all(6.0),
            decoration: BoxDecoration(
              color: Colors.red,
              shape: BoxShape.circle,
              border: Border.all(width: 1.0, color: Colors.white),
            ),
            child: Icon(Icons.accessibility, color: Colors.white, size: 40.0,),
          ),
        ),
      ],
    );
  }
}
