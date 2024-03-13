// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';



class SectionOption {
  int? id;
  String? title; 
  SectionOption({
    this.id,
    this.title,
  });

  SectionOption copyWith({
    int? id,
    String? title,
  }) {
    return SectionOption(
      id: id ?? this.id,
      title: title ?? this.title,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
    };
  }

  factory SectionOption.fromMap(Map<String, dynamic> map) {
    return SectionOption(
      id: map['id'] != null ? map['id'] as int : null,
      title: map['title'] != null ? map['title'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory SectionOption.fromJson(String source) => SectionOption.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'SectionOption(id: $id, title: $title)';

  @override
  bool operator ==(covariant SectionOption other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.title == title;
  }

  @override
  int get hashCode => id.hashCode ^ title.hashCode;
}
