import 'package:flutter/material.dart';

const List<String> shumokuList = <String>['胸', '背中', '脚', '肩', '腕', '腹筋'];

class ShumokuTsuika extends StatefulWidget {
  const ShumokuTsuika({super.key});

  @override
  State<ShumokuTsuika> createState() => _ShumokuTsuikaState();
}

class _ShumokuTsuikaState extends State<ShumokuTsuika> {
  String? _selectedItem;

  @override
  void initState() {
    super.initState();
    _selectedItem = shumokuList.first; // 初期値を設定
  }

  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
      backgroundColor: Colors.blue,
      leading: IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back)),
      title: const Text('種目追加'),
      actions: [ElevatedButton(onPressed: () {}, child: Text('登録'))],
    );

    return Scaffold(
      appBar: appBar,
      body: Column(
        children: [
          Row(
            children: [
              Expanded(flex: 1, child: Center(child: Text('部位'))),
              const SizedBox(height: 30),
              Expanded(
                flex: 5,
                child: DropdownButton<String>(
                  hint: Text("部位を選択してください"),
                  value: _selectedItem,

                  // ドロップダウンのアイコン
                  icon: const Icon(Icons.arrow_downward),
                  iconSize: 24,
                  style: const TextStyle(color: Colors.black, fontSize: 16),

                  // ドロップダウンの下線
                  underline: Container(height: 2, color: Colors.black),
                  onChanged: (String? newValue) {
                    setState(() {
                      _selectedItem = newValue; // 選択された値を更新
                    });
                  },
                  items: shumokuList.map<DropdownMenuItem<String>>((
                    String value,
                  ) {
                    // ドロップダウンの各項目
                    return DropdownMenuItem<String>(
                      value: value,
                      child: SizedBox(width: 120, child: Text(value)),
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(flex: 1, child: Center(child: Text('種目'))),

              Expanded(
                flex: 5,
                child: TextField(
                  decoration: const InputDecoration(
                    labelText: '種目名を入力してください',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
