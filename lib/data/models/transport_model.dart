// ignore_for_file: public_member_api_docs, sort_constructors_first
abstract class Transport {
  final String name;
  const Transport({
    required this.name,
  });

  String get image;

  @override
  bool operator ==(covariant Transport other) {
    if (identical(this, other)) return true;
  
    return 
      other.name == name;
  }

  @override
  int get hashCode => name.hashCode;
}
