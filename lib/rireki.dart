import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:iron_log/set_ichiran.dart';
import 'package:iron_log/shumoku_tsuika.dart';
import 'package:table_calendar/table_calendar.dart';

class Rireki extends StatelessWidget {
  const Rireki({super.key});

  @override
  Widget build(BuildContext context) {
    // 本日日付
    final today = DateTime.now();

    final DateFormat formatter = DateFormat('yyyy年M月');
    final String formattedDate = formatter.format(today);

    DateTime _selectedDay = DateTime.now();
    DateTime _focusedDay = DateTime.now();

    final appBar = AppBar(
      backgroundColor: Colors.red,
      leading: IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back)),
      title: Center(child: Text('履歴')),
      titleTextStyle: TextStyle(color: Colors.white),
    );

    final tabBar = DefaultTabController(
      initialIndex: 0,
      length: 6,
      child: TabBar(
        tabs: [
          Tab(text: 'ALL'),
          Tab(text: '胸'),
          Tab(text: '背中'),
          Tab(text: '脚'),
          Tab(text: '肩'),
          Tab(text: '腕'),
        ],
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
        onDaySelected: (_selectedDay, _focusedDay) {
          // ボタンが押された時の処理: 画面遷移
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => SetIchiran()),
          );
        },
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
            color: Colors.blue,
          ),
          todayTextStyle: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
          defaultDecoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: Colors.white70, width: 0.5),
          ),
          defaultTextStyle: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
          weekendDecoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: Colors.white70, width: 0.5),
          ),
          weekendTextStyle: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
          outsideTextStyle: TextStyle(
            color: Colors.white70,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );

    // データエリア
    final dataArea = Container(
      padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(top: BorderSide(width: 1.0, color: Colors.white)),
      ),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              formattedDate,
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.normal,
                fontSize: 15.0,
              ),
            ),
            calendar,
          ],
        ),
      ),
    );

    return Scaffold(
      appBar: appBar,
      body: Column(children: [tabBar, dataArea]),
    );
  }
}
