class User {
  final String id;
  final String title;
  final String avatarUrl;
  final String genero;
  // final String faixaEtaria;
  final String duration;
  // final String ano;
  // final String nota;
  final String description;

  const User(
      {required this.id,
      required this.title,
      required this.genero,
      required this.avatarUrl,
      required this.duration,
      required this.description});
}
