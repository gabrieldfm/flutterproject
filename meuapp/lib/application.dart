
String dbName = 'adotapet.db';

int dbVersion = 1;

List<String> dbCreate = [
  //tb lista
  """CRATE TABLE lista (
    pk_lista INTEGER PRIMARY KEY,
    name TEXT,
    created TEXT
  ) """,

  //tb item
  """CRATE TABLE item (
    pk_item INTEGER PRIMARY KEY,
    fk_lista INTEGER,
    name TEXT,
    quantidade INTEGER,
    valor DECIMAL(10,2),
    created TEXT
  ) """,

];