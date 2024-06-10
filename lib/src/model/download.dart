import 'dart:convert';

class Download {
  final String id;
  final String name;
  final String file;
  Download({
    required this.id,
    required this.name,
    required this.file,
  });

  Download copyWith({
    String? id,
    String? name,
    String? file,
  }) {
    return Download(
      id: id ?? this.id,
      name: name ?? this.name,
      file: file ?? this.file,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'file': file,
    };
  }

  factory Download.fromMap(Map<String, dynamic> map) {
    return Download(
      id: map['id'] as String,
      name: map['name'] as String,
      file: map['file'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Download.fromJson(String source) => Download.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Download(id: $id, name: $name, file: $file)';

  @override
  bool operator ==(covariant Download other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.name == name &&
      other.file == file;
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode ^ file.hashCode;
}