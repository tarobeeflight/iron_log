import 'package:flutter/material.dart';

class ShumokuIchiran extends StatelessWidget {
  const ShumokuIchiran({super.key});

  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
      backgroundColor: Colors.blue,
      title: const Text('種目一覧'),
    );

    final shumokumei = Container(
      margin: EdgeInsets.only(top: 5.0),
      padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 20.0),
      decoration: BoxDecoration(
        color: Colors.red,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'ベンチプレス',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ],
      ),
    );

    final shumokuKyotsuLabel = Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
      child: Row(
        children: [
          Expanded(flex: 1, child: Text('セット')),
          Expanded(flex: 3, child: Center(child: (Text('重量')))),
          Expanded(flex: 2, child: Center(child: (Text('回数')))),
        ],
      ),
    );

    final setBetsuKiroku = Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Expanded(flex: 1, child: Text('1')),
          Expanded(
            flex: 2,
            child: Text('40.0', style: TextStyle(fontWeight: FontWeight.bold)),
          ),
          Expanded(flex: 1, child: Text('kg')),
          Expanded(
            flex: 1,
            child: Text('10', style: TextStyle(fontWeight: FontWeight.bold)),
          ),
          Expanded(flex: 1, child: Text('回')),
        ],
      ),
    );

    return Scaffold(
      appBar: appBar,
      body: Column(children: [shumokumei, shumokuKyotsuLabel, setBetsuKiroku]),
    );
  }
}
