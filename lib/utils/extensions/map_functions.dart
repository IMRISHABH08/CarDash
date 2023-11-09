const emptyJson = <String, Object?>{};

typedef Json<T extends Object?> = Map<String, T>;

extension JsonParse on Json {
  List<T> asList<T>(String key, {List<T>? fallback}) =>
      (this[key] as List? ?? fallback ?? <T>[]).cast<T>();
}
