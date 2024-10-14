class OrderNotes {
  int? id;
  String? author;
  DateTime? dateCreated;
  DateTime? dateCreatedGmt;
  String? note;
  bool? customerNote;

  OrderNotes({
    this.id,
    this.author,
    this.dateCreated,
    this.dateCreatedGmt,
    this.note,
    this.customerNote,
  });

  OrderNotes.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    author = json['author'];
    dateCreated = DateTime.parse(json['date_created']);
    dateCreatedGmt = DateTime.parse(json['date_created_gmt']);
    note = json['note'];
    customerNote = json['customer_note'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['author'] = author;
    data['date_created'] = dateCreated?.toIso8601String();
    data['date_created_gmt'] = dateCreatedGmt?.toIso8601String();
    data['note'] = note;
    data['customer_note'] = customerNote;

    return data;
  }
}
