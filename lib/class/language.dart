class Language {
  final int id;
  final String flag;
  final String name;
  final String languageCode;

  Language(this.id, this.flag, this.name, this.languageCode);

  static List<Language> languageList() {
    return <Language>[
      Language(1, "πΊπΈ", "English", "en"),
      Language(1, "ET", "α αα­α", "am"),
      Language(3, "ET", "Afaan Oromoo", "om"),
      Language(4, "ET", "α΅ααͺα", "ti"),
    ];
  }
}