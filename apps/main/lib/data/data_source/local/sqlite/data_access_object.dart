enum SqliteTable {
  form('form'),
  formResponse('form_response'),
  ;

  const SqliteTable(this.name);

  final String name;
}
