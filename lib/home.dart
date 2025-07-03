import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  // スタブデータ
  final monthlyArchive = 10;
  final totalTrainingDays = 5;
  final fukaryoPerWeek = 3.10;
  final fukaryoPerMonth = 14.54;
  final fukaryo = 45.36;

  // 日付 → 文字列 変換
  String toText(DateTime date) {
    final monthText = switch (date.month) {
      1 => 'January',
      2 => 'February',
      3 => 'March',
      4 => 'April',
      5 => 'May',
      6 => 'June',
      7 => 'July',
      8 => 'August',
      9 => 'September',
      10 => 'October',
      11 => 'November',
      12 => 'December',
      _ => 'Invalid Month', // 1〜12以外の値に対するワイルドカードパターン
    };

    return '$monthText ${date.year}';
  }

  @override
  Widget build(BuildContext context) {
    // 本日日付
    final today = DateTime.now();

    // アップバー
    final appBar = AppBar(
      backgroundColor: Colors.red,
      title: const Text('IRON LOG'),
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 30.0,
        fontWeight: FontWeight.bold,
      ),
      leading: IconButton(
        onPressed: () => {},
        icon: Icon(Icons.settings),
        color: Colors.white,
      ),
    );

    // カレンダー
    final calendar = Container(
      padding: EdgeInsets.only(top: 15.0, bottom: 20.0),
      margin: EdgeInsets.only(bottom: 20.0),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.white70, width: 1.0)),
      ),
      child: TableCalendar(
        firstDay: DateTime.utc(today.year, today.month - 1, 1),
        lastDay: DateTime.utc(today.year, today.month + 1, 28),
        focusedDay: DateTime.now(),
        headerVisible: false,
        daysOfWeekStyle: DaysOfWeekStyle(
          weekdayStyle: TextStyle(
            color: Colors.white70,
            fontWeight: FontWeight.bold,
          ),
          weekendStyle: TextStyle(
            color: Colors.white70,
            fontWeight: FontWeight.bold,
          ),
        ),
        calendarStyle: CalendarStyle(
          todayDecoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
          ),
          todayTextStyle: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
          defaultDecoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: Colors.white70, width: 0.5),
          ),
          defaultTextStyle: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          weekendDecoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: Colors.white70, width: 0.5),
          ),
          weekendTextStyle: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          outsideTextStyle: TextStyle(color: Colors.white70, fontWeight: FontWeight.bold),
        ),
      ),
    );

    // 目標
    final archive = Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          margin: EdgeInsets.only(left: 7.0, right: 2.0),
          padding: EdgeInsets.only(right: 5.0),
          decoration: BoxDecoration(
            border: Border(right: BorderSide(color: Colors.white, width: 2.0)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                'MONTHLY',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'ARCHIVE',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              '$monthlyArchive',
              style: TextStyle(
                color: Colors.white,
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text('days', style: TextStyle(color: Colors.white, fontSize: 13.0)),
          ],
        ),
        Container(
          padding: EdgeInsets.only(left: 10.0),
          child: Column(
            children: [
              Text('TOTAL', style: TextStyle(color: Colors.white)),
              Container(
                padding: EdgeInsets.only(
                  top: 1.0,
                  bottom: 1.0,
                  right: 3.0,
                  left: 3.0,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(3.0)),
                ),
                child: Text(
                  '${totalTrainingDays}days',
                  style: TextStyle(color: Colors.red),
                ),
              ),
            ],
          ),
        ),
      ],
    );

    // データエリア
    final dataArea = Container(
      padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: Colors.red,
        border: Border(top: BorderSide(width: 1.0, color: Colors.white)),
      ),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              toText(today),
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 30.0,
              ),
            ),
            calendar,
            archive,
          ],
        ),
      ),
    );

    // ボタンエリア
    final buttonArea = Container(
      color: Colors.white10,
      padding: EdgeInsets.all(10.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: Colors.red,
        ),
        onPressed: () => {},
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [Icon(Icons.add_circle), Text('本日のトレーニングを追加')],
        ),
      ),
    );

    return Scaffold(
      appBar: appBar,
      body: Column(children: [dataArea, buttonArea]),
    );
  }
}
