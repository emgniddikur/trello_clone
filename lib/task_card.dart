class TaskCard {
  int id;
  String name;

  static int createdCount = 0;

  TaskCard(String name) {
    this.id = ++createdCount;
    this.name = name;
  }
}
