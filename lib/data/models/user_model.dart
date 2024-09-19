class User {
  final String name;
  final int score;
  final int position;

  User(this.name, this.score, this.position);
}

List<User> getLeaderboard() {
  return [
    User('Alice', 1000, 1),
    User('Bob', 900, 2),
    User('Charlie', 850, 3),
    User('David', 800, 4),
    User('Eve', 750, 5),
    User('Frank', 700, 6),
    User('Grace', 650, 7),
    User('Hannah', 600, 8),
    User('Ivy', 550, 9),
    User('Jack', 500, 10),
    // Add more users as needed
  ];
}
