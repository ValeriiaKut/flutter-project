class Note {
  final int? id;
  final String title;
  final String content;
  final String color;
  final String dateTime;

  Note({
    required this.title, required this.content, required this.color, required this.dateTime, this.id,
  });

  Map<String, dynamic> toMap(){
    return {
      'id': id,
      'title': title,
      'content': content,
      'color': color,
      'dateTime': dateTime,
    };
  }

  factory Note.fromMap(Map<String, dynamic> map) {
    return Note(
      id: map['id'] is int ? map['id'] as int : null,
      title: map['title'] as String,
      content: map['content'] as String,
      color: map['color'] as String,
      dateTime: map['dateTime'] as String,
    );
  }
}
