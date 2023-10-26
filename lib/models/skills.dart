import 'dart:convert';

class Skill {
  final String name;
  final String desc;

  Skill(
    this.name,
    this.desc,
  );

  Skill copyWith({
    String? name,
    String? desc,
  }) {
    return Skill(
      name ?? this.name,
      desc ?? this.desc,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'desc': desc,
    };
  }

  factory Skill.fromMap(Map<String, dynamic> map) {
    return Skill(
      map['name'] ?? '',
      map['desc'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Skill.fromJson(String source) => Skill.fromMap(json.decode(source));

  @override
  String toString() => 'Skill(name: $name, desc: $desc)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Skill &&
      other.name == name &&
      other.desc == desc;
  }

  @override
  int get hashCode => name.hashCode ^ desc.hashCode;
}
