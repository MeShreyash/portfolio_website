import 'dart:convert';

class Services {
  final String icon;
  final String name;
  final String desc;

  Services({
    required this.icon,
    required this.name,
    required this.desc,
  });

  Services copyWith({
    String? icon,
    String? name,
    String? desc,
  }) {
    return Services(
      icon: icon ?? this.icon,
      name: name ?? this.name,
      desc: desc ?? this.desc,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'icon': icon,
      'name': name,
      'desc': desc,
    };
  }

  factory Services.fromMap(Map<String, dynamic> map) {
    return Services(
      icon: map['icon'] ?? '',
      name: map['name'] ?? '',
      desc: map['desc'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Services.fromJson(String source) =>
      Services.fromMap(json.decode(source));

  @override
  String toString() => 'Services(icon: $icon, name: $name, desc: $desc)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Services &&
        other.icon == icon &&
        other.name == name &&
        other.desc == desc;
  }

  @override
  int get hashCode => icon.hashCode ^ name.hashCode ^ desc.hashCode;
}
