import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String name;
  final int score;
  final int position;
  final String id;

  const User(this.name, this.score, this.position, this.id);
  User copyWith({
    String? name,
    int? score,
    int? position,
    String? id,
  }) {
    return User(
      name ?? this.name,
      score ?? this.score,
      position ?? this.position,
      id ?? this.id,
    );
  }

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      json['name'] as String,
      json['score'] as int,
      json['position'] as int,
      json['id'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'score': score,
      'position': position,
      'id': id,
    };
  }

  @override
  // TODO: implement props
  List<Object?> get props => [id];
}
