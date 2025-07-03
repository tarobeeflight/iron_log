import 'package:flutter/material.dart';
import 'package:iron_log/dialog/timer_set_dialog.dart';
import 'package:iron_log/dialog/timer_tsuchi_dialog.dart';

class StubDialogManager extends StatelessWidget {
  const StubDialogManager({super.key});

  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
      backgroundColor: Colors.blue,
      title: const Text('ダイアログ管理（テスト用）'),
    );
    return Scaffold(
      appBar: appBar,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              onPressed: () {
                showDialog(context: context, builder: (_) => TimerSetDialog());
              },
              child: Text('タイマーセット'),
            ),
            ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (_) => TimerTsuchiDialog(),
                );
              },
              child: Text('タイマー通知'),
            ),
          ],
        ),
      ),
    );
  }
}
