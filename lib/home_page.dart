import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:trello_clone/task_card.dart';
import 'package:trello_clone/task_column.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<TaskColumn> taskColumns = [];

  TextEditingController _taskColumnTextController = TextEditingController();
  TextEditingController _taskCardTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('ホーム')),
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return CarouselSlider(
      options: CarouselOptions(
        height: double.infinity,
        enableInfiniteScroll: false,
      ),
      items: [
        taskColumns.map((taskColumn) {
          return Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.all(10.0),
              margin: EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                    blurRadius: 8,
                    offset: Offset(0, 0),
                    color: Color.fromRGBO(127, 140, 141, 0.5),
                    spreadRadius: 2)
              ], borderRadius: BorderRadius.circular(4.0), color: Colors.white),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    [
                      Container(
                          child: Text(taskColumn.name),
                          padding: EdgeInsets.symmetric(
                              vertical: 5.0, horizontal: 10.0),
                          margin: EdgeInsets.only(bottom: 5.0),
                      ),
                    ],
                    taskColumn.taskCards.map((taskCard) {
                      return Container(
                        width: double.infinity,
                        padding: EdgeInsets.all(10.0),
                        margin: EdgeInsets.only(bottom: 10.0),
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                  blurRadius: 8,
                                  offset: Offset(0, 0),
                                  color: Color.fromRGBO(127, 140, 141, 0.5),
                                  spreadRadius: 2)
                            ],
                            borderRadius: BorderRadius.circular(4.0),
                            color: Colors.white),
                        child: Text(taskCard.name),
                      );
                    }).toList(),
                    [_buildAddTaskCard(taskColumn.id)]
                  ].expand((element) => element).toList()));
        }).toList(),
        [_buildAddTaskColumn()]
      ].expand((element) => element).toList(),
    );
  }

  Widget _buildAddTaskColumn() {
    void _addTaskColumn(String name) {
      setState(() {
        // 新しいカラム
        final newTaskColumn = new TaskColumn(name);
        // カラムを追加
        taskColumns.add(newTaskColumn);

        // 入力欄をリセット
        _taskColumnTextController.text = '';
      });
    }

    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.all(10.0),
      margin: EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
            blurRadius: 8.0,
            offset: Offset(0, 0),
            color: Color.fromRGBO(127, 140, 141, 0.5),
            spreadRadius: 2)
      ], borderRadius: BorderRadius.circular(4.0), color: Colors.white),
      child: Column(
        children: [
          SizedBox(
            height: 40.0,
            child: TextField(
                controller: _taskColumnTextController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  isDense: true,
                  contentPadding: EdgeInsets.all(8),
                )),
          ),
          SizedBox(
            height: 40.0,
            child: RaisedButton(
              child: Text('カラムを追加'),
              color: Colors.blue,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4.0),
              ),
              onPressed: () {
                // 新しいカラム名
                final newTaskColumnName = _taskColumnTextController.text.trim();
                // 空文字の場合は早期リターン
                if (newTaskColumnName == '') {
                  return;
                }
                // カラムを追加
                _addTaskColumn(newTaskColumnName);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAddTaskCard(int taskColumnId) {
    void _addTaskCard(int taskColumnId, String name) {
      setState(() {
        // カードを追加するカラム
        final taskColumn = taskColumns
            .firstWhere((taskColumn) => taskColumn.id == taskColumnId);
        // 新しいカード
        final newTaskCard = new TaskCard(name);
        // カードを追加
        taskColumn.taskCards.add(newTaskCard);

        // 入力欄をリセット
        _taskCardTextController.text = '';
      });
    }

    return Column(
      children: [
        SizedBox(
          height: 40.0,
          child: TextField(
              controller: _taskCardTextController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                isDense: true,
                contentPadding: EdgeInsets.all(8.0),
              )),
        ),
        SizedBox(
          height: 40.0,
          child: RaisedButton(
            child: Text('カードを追加'),
            color: Colors.blue,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4.0),
            ),
            onPressed: () {
              // 新しいカード名
              final newTaskCardName = _taskCardTextController.text.trim();
              // 空文字の場合は早期リターン
              if (newTaskCardName == '') {
                return;
              }
              // カードを追加
              _addTaskCard(taskColumnId, newTaskCardName);
            },
          ),
        ),
      ],
    );
  }
}
