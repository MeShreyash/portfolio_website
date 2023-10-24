import 'dart:convert';

import 'package:flutter/foundation.dart';

class Project {
  final String projectId;
  final String projectName;
  final String projDesc;
  final List<dynamic> image;
  Project({
    required this.projectId,
    required this.projectName,
    required this.projDesc,
    required this.image,
  });

  Project copyWith({
    String? projectId,
    String? projectName,
    String? projDesc,
    List<dynamic>? image,
  }) {
    return Project(
      projectId: projectId ?? this.projectId,
      projectName: projectName ?? this.projectName,
      projDesc: projDesc ?? this.projDesc,
      image: image ?? this.image,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'projectId': projectId,
      'projectName': projectName,
      'projDesc': projDesc,
      'image': image,
    };
  }

  factory Project.fromMap(Map<String, dynamic> map) {
    return Project(
      projectId: map['projectId'] ?? '',
      projectName: map['projectName'] ?? '',
      projDesc: map['projDesc'] ?? '',
      image: List.from(map['image']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Project.fromJson(String source) =>
      Project.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Project(projectId: $projectId, projectName: $projectName, projDesc: $projDesc, image: $image,)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Project &&
        other.projectId == projectId &&
        other.projectName == projectName &&
        other.projDesc == projDesc &&
        listEquals(other.image, image);
  }

  @override
  int get hashCode {
    return projectId.hashCode ^
        projectName.hashCode ^
        projDesc.hashCode ^
        image.hashCode;
  }
}
