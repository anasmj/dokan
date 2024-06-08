import 'dart:convert';

class ImageData {
  int? id;
  String? src;
  String? name;
  int? position;

  ImageData({
    this.id,
    this.src,
    this.name,
    this.position,
  });

  ImageData copyWith({
    int? id,
    String? src,
    String? name,
    int? position,
  }) {
    return ImageData(
      id: id ?? this.id,
      src: src ?? this.src,
      name: name ?? this.name,
      position: position ?? this.position,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'src': src,
      'name': name,
      'position': position,
    };
  }

  static ImageData fromMap(Map<String, dynamic> map) {
    return ImageData(
      id: map['id'] != null ? map['id'] as int : null,
      src: map['src'] != null ? map['src'] as String : null,
      name: map['name'] != null ? map['name'] as String : null,
      position: map['position'] != null ? map['position'] as int : null,
    );
  }

  String toJson() => json.encode(toMap());

  ImageData fromJson(String source) =>
      ImageData.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ImageData(id: $id, src: $src, name: $name, position: $position)';
  }

  @override
  bool operator ==(covariant ImageData other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.src == src &&
        other.name == name &&
        other.position == position;
  }

  @override
  int get hashCode {
    return id.hashCode ^ src.hashCode ^ name.hashCode ^ position.hashCode;
  }
}
