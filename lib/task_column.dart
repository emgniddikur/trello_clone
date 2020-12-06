import 'package:trello_clone/task_card.dart';

class TaskColumn {
  int id;
  String name;
  List<TaskCard> taskCards;

  static int createdCount = 0;

  TaskColumn(String name) {
    this.id = ++createdCount;
    this.name = name;
    this.taskCards = [];
  }
}
