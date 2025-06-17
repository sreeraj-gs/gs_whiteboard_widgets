class Lesson extends Base {
  final int id;
  Lesson({required this.id, required super.name}) : super(value: id);
}

class Grade extends Base {
  Grade({required super.name, required super.value});
}

class Subject extends Base {
  Subject({required super.name, required super.value});
}

class Topic extends Base {
  Topic({required super.name, required super.value});
}

class Level extends Base {
  Level({required super.name, required super.value});
}

class Name extends Base {
  Name({required super.name, required super.value});
}

/// Hashcode overriden for equality in dropdown,
///  assumming you are using freezed/equtable in actual models *
abstract class Base {
  final String name;
  final int value;

  const Base({required this.name, required this.value});

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Base &&
        other.runtimeType == runtimeType &&
        other.name == name &&
        other.value == value;
  }

  @override
  int get hashCode {
    return name.hashCode ^ value.hashCode;
  }
}
