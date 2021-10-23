class todo {
  final String title;
  final int id;
  final DateTime dateTime;
  final String shortDesc;

  todo(this.title, this.id, this.dateTime, this.shortDesc);

  Map<String, dynamic> toMap() {
    return ({
      'id': id,
      "title": title,
      "date": dateTime.toString(),
      "shortdesc": shortDesc,
    });
  }
}
