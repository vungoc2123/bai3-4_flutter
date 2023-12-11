class Task {
  String? uid;
  String? name;

  Task({this.uid, this.name});

  factory Task.fromJson(Map<String, dynamic> json) => Task(
        uid: json['uid'],
        name: json['name'],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
      };
}
