import 'package:flutter/material.dart';
import 'package:iron_log/set_ichiran.dart';

class ShumokuIchiran extends StatelessWidget {
  const ShumokuIchiran({super.key});

  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
      backgroundColor: Colors.red,
      title: Center(child: Text("種目一覧")),
      titleTextStyle: TextStyle(color: Colors.white),
      // foregroundColor: Colors.white,
      leading: TextButton(
        onPressed: () => {},
        child: Text('戻る', style: TextStyle(color: Colors.white)),
      ),
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

    final setBetsuKiroku = Column(
      children: [
        Container(
          height: 60,
          decoration: BoxDecoration(
            border: Border(bottom: BorderSide(color: Colors.grey)),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Expanded(flex: 1, child: Text('1', textAlign: TextAlign.center)),
              Expanded(
                flex: 2,
                child: Text(
                  '40.0',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  textAlign: TextAlign.right,
                ),
              ),
              Expanded(flex: 1, child: Text('kg')),
              Expanded(
                flex: 1,
                child: Text(
                  '10',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  textAlign: TextAlign.right,
                ),
              ),
              Expanded(flex: 1, child: Text('回')),
            ],
          ),
        ),
        Container(
          height: 60,
          decoration: BoxDecoration(
            border: Border(bottom: BorderSide(color: Colors.grey)),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Expanded(flex: 1, child: Text('2', textAlign: TextAlign.center)),
              Expanded(
                flex: 2,
                child: Text(
                  '50',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  textAlign: TextAlign.right,
                ),
              ),
              Expanded(flex: 1, child: Text('kg')),
              Expanded(
                flex: 1,
                child: Text(
                  '5',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  textAlign: TextAlign.right,
                ),
              ),
              Expanded(flex: 1, child: Text('回')),
            ],
          ),
        ),
        Container(
          height: 60,
          decoration: BoxDecoration(
            border: Border(bottom: BorderSide(color: Colors.grey)),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () {
                  // ボタンが押された時の処理: 画面遷移
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SetIchiran()),
                  );
                },
                icon: Icon(Icons.add_circle),
                color: Colors.grey,
              ),
            ],
          ),
        ),
      ],
    );

    return Scaffold(
      appBar: appBar,
      body: Column(
        children: [
          shumokumei,
          shumokuKyotsuLabel,
          setBetsuKiroku,
          shumokumei,
          shumokuKyotsuLabel,
          setBetsuKiroku,
        ],
      ),
    );
  }
}
