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
              Text('部位'),
              const SizedBox(height: 30),
              DropdownButton<String>(
                value: _selectedItem,
                icon: const Icon(Icons.arrow_downward),
                // ドロップダウンのアイコン
                iconSize: 24,
                elevation: 16,
                style: const TextStyle(color: Colors.deepPurple, fontSize: 16),
                underline: Container(
                  // ドロップダウンの下線
                  height: 2,
                  color: Colors.deepPurpleAccent,
                ),
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedItem = newValue; // 選択された値を更新
                  });
                },
                items: shumokuList.map<DropdownMenuItem<String>>((
                  String value,
                ) {
                  // 4. ドロップダウンの各項目
                  return DropdownMenuItem<String>(
                    value: value,
                    child: SizedBox(width: 120, child: Text(value)),
                  );
                }).toList(),
              ),
            ],
          ),
          Row(
            children: [
              Text('種目'),
              Expanded(
                child: TextField(
                  decoration: const InputDecoration(
                    labelText: '種目を入力してください',
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
