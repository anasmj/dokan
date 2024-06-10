import 'dart:convert';

class ImageData {
  final int? id;
  final String? dateCreated;
  final String? dateCreatedGmt;
  final String? dateModified;
  final String? dateModifiedGmt;
  final String? src;
  final String? name;
  final String? alt;
  final int? position;
  ImageData({
    this.id,
    this.dateCreated,
    this.dateCreatedGmt,
    this.dateModified,
    this.dateModifiedGmt,
    this.src,
    this.name,
    this.alt,
    this.position,
  });

  ImageData copyWith({
    int? id,
    String? dateCreated,
    String? dateCreatedGmt,
    String? dateModified,
    String? dateModifiedGmt,
    String? src,
    String? name,
    String? alt,
    int? position,
  }) {
    return ImageData(
      id: id ?? this.id,
      dateCreated: dateCreated ?? this.dateCreated,
      dateCreatedGmt: dateCreatedGmt ?? this.dateCreatedGmt,
      dateModified: dateModified ?? this.dateModified,
      dateModifiedGmt: dateModifiedGmt ?? this.dateModifiedGmt,
      src: src ?? this.src,
      name: name ?? this.name,
      alt: alt ?? this.alt,
      position: position ?? this.position,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'date_created': dateCreated,
      'dateCreated_gmt': dateCreatedGmt,
      'date_modified': dateModified,
      'dateModified_gmt': dateModifiedGmt,
      'src': src,
      'name': name,
      'alt': alt,
      'position': position,
    };
  }

  factory ImageData.fromMap(Map<String, dynamic> map) {
    return ImageData(
      id: map['id'].toInt() as int?,
      dateCreated: map['date_created'] as String?,
      dateCreatedGmt: map['date_created_gmt'] as String?,
      dateModified: map['date_modified'] as String?,
      dateModifiedGmt: map['date_modified_gmt'] as String?,
      src: map['src'] as String?,
      name: map['name'] as String?,
      alt: map['alt'] as String?,
      position: map['position'].toInt() as int?,
    );
  }

  String toJson() => json.encode(toMap());

  factory ImageData.fromJson(String source) =>
      ImageData.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ImageData(id: $id, dateCreated: $dateCreated, dateCreatedGmt: $dateCreatedGmt, dateModified: $dateModified, dateModifiedGmt: $dateModifiedGmt, src: $src, name: $name, alt: $alt, position: $position)';
  }

  @override
  bool operator ==(covariant ImageData other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.dateCreated == dateCreated &&
        other.dateCreatedGmt == dateCreatedGmt &&
        other.dateModified == dateModified &&
        other.dateModifiedGmt == dateModifiedGmt &&
        other.src == src &&
        other.name == name &&
        other.alt == alt &&
        other.position == position;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        dateCreated.hashCode ^
        dateCreatedGmt.hashCode ^
        dateModified.hashCode ^
        dateModifiedGmt.hashCode ^
        src.hashCode ^
        name.hashCode ^
        alt.hashCode ^
        position.hashCode;
  }
}
