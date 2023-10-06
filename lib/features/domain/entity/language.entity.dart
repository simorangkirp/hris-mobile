class LanguageEntity {
  final String? code;
  final String? value;

  const LanguageEntity({
    this.code,
    this.value,
  });
}

class Languages {
  const Languages._();

  static const languages = [
    LanguageEntity(code: 'en', value: 'English'),
    LanguageEntity(code: 'es', value: 'Spanish'),
  ];
}
