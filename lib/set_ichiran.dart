import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:iron_log/entity/shumoku.dart';
import 'package:iron_log/entity/set.dart';

class SetIchiran extends StatelessWidget {
  SetIchiran({super.key});

  // スタブデータ
  final stubShumoku = Shumoku('bui_mune', '胸', 'shumoku_benchi', 'ベンチプレス');
  final stubCurrentSets = [
    Set('bui-mune', 'shumoku-bench', 'ペンチプレス', 1, 10.0, 11, 'メモ1'),
    Set('bui-mune', 'shumoku-bench', 'ペンチプレス', 2, 20.0, 22, 'メモ2'),
    Set('bui-mune', 'shumoku-bench', 'ペンチプレス', 3, 30.0, 33, 'メモ3'),
    Set('bui-mune', 'shumoku-bench', 'ペンチプレス', 4, 0, 0, ''),
  ];
  final stubLastSets = [
    Set('bui-mune', 'shumoku-bench', 'ペンチプレス', 1, 15.0, 16, 'メモ過去1'),
    Set('bui-mune', 'shumoku-bench', 'ペンチプレス', 2, 25.0, 26, 'メモ過去2'),
    Set('bui-mune', 'shumoku-bench', 'ペンチプレス', 3, 35.0, 36, 'メモ過去3'),
  ];
  final lastRecordDt = DateTime(2025, 6, 14);

  @override
  Widget build(BuildContext context) {
    final lastRecordDtStr = DateFormat('yyyy-MM-dd').format(lastRecordDt);

    // アップバー
    final appBar = AppBar(
      backgroundColor: Colors.red,
      title: Center(child: Text(stubShumoku.shumokuMei)),
      titleTextStyle: TextStyle(color: Colors.white),
      // foregroundColor: Colors.white,
      leading: TextButton(
        onPressed: () => {},
        child: Text('戻る', style: TextStyle(color: Colors.white)),
      ),
    );

    // タイマー
    final timerRow = Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.red, width: 2.0),
        borderRadius: BorderRadius.circular(15.0),
      ),
      padding: const EdgeInsets.all(5.0),
      child: Row(
        children: [
          Icon(Icons.lock_clock),
          TextButton(onPressed: () => {}, child: Text('30')),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
            ),
            onPressed: () => {},
            child: Text('スタート'),
          ),
        ],
      ),
    );

    // トロフィー・タイマー行
    final rowTop = Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(onPressed: () => {}, icon: Icon(Icons.factory)),
        timerRow,
      ],
    );

    // 前回セットリスト
    final lastSetList = SizedBox(
      width: 200.0,
      child: Column(
        children: stubLastSets
            .map(
              (item) => Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('${item.setNo}'),
                  Text('${item.omosa} kg * ${item.kaisu}回'),
                ],
              ),
            )
            .toList(),
      ),
    );

    // 前回記録
    final lastRecord = Container(
      margin: EdgeInsetsGeometry.only(top: 5.0),
      padding: EdgeInsetsGeometry.directional(start: 20.0),
      decoration: BoxDecoration(
        color: Colors.grey,
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
              Text('Last Record: $lastRecordDtStr'),
              TextButton(
                onPressed: () => {},
                child: Text('履歴', style: TextStyle(color: Colors.blue)),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              lastSetList,
              IconButton(onPressed: () => {}, icon: Icon(Icons.copy)),
            ],
          ),
        ],
      ),
    );

    // セットリスト
    final setList = Column(
      children: stubCurrentSets
          .map(
            (item) => Container(
              padding: EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border(
                  bottom: BorderSide(color: Colors.grey, width: 1.0),
                ),
              ),
              child: Column(
                children: [
                  // 1行目
                  Row(
                    children: [
                      Expanded(flex: 1, child: Text('セット')),
                      Expanded(flex: 3, child: Center(child: Text('重さ'))),
                      Expanded(flex: 3, child: Center(child: Text('回数'))),
                    ],
                  ),
                  // 2行目
                  Row(
                    children: [
                      Expanded(child: Center(child: Text('${item.setNo}'))),
                      Expanded(
                        child: IconButton(
                          onPressed: () => {},
                          icon: Icon(Icons.arrow_circle_left, color: Colors.red),
                        ),
                      ),
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            labelText: '重さ',
                            labelStyle: TextStyle(color: Colors.grey),
                          ),
                        ),
                      ),
                      Expanded(child: Text('kg')),
                      Expanded(
                        child: IconButton(
                          onPressed: () => {},
                          icon: Icon(Icons.arrow_circle_left, color: Colors.red),
                        ),
                      ),
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            labelText: '回数',
                            labelStyle: TextStyle(color: Colors.grey),
                          ),
                        ),
                      ),
                      Expanded(child: Text('回')),
                    ],
                  ),
                  // 3行目
                  Row(
                    children: [
                      Expanded(child: Text('')),
                      Expanded(
                        flex: 1,
                        child: IconButton(
                          onPressed: () => {},
                          icon: Icon(Icons.arrow_circle_left, color: Colors.red),
                        ),
                      ),
                      Expanded(
                        flex: 5,
                        child: TextField(
                          decoration: InputDecoration(
                            labelText: 'メモ',
                            labelStyle: TextStyle(color: Colors.grey),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )
          .toList(),
    );

    // セットリストの底蓋
    final setListBottom = Container(
      margin: EdgeInsetsGeometry.only(bottom: 15.0),
      height: 40.0,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
      ),
    );

    // 動画・追加行
    final rowBottom = Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(onPressed: () => {}, icon: Icon(Icons.play_circle, color: Colors.red,)),
        IconButton(onPressed: () => {}, icon: Icon(Icons.add_circle), color: Colors.green,),
      ],
    );

    return Scaffold(
      appBar: appBar,
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white10,
          padding: const EdgeInsets.all(5.0),
          child: Column(
              children: [
                rowTop,
                lastRecord,
                setList,
                setListBottom,
                rowBottom,
              ]
          ),
        ),
      ),
    );
  }
}
