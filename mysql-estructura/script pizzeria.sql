Table Clients {
  ID INT [pk]
  Nom VARCHAR(50)
  Cognoms VARCHAR(50)
  Adreca VARCHAR(100)
  CodiPostal VARCHAR(10)
  Localitat VARCHAR(50)
  Provincia VARCHAR(50)
  Telefon VARCHAR(20)
}

Table Comandes {
  ID INT [pk]
  ID_Client INT [ref: > Clients.ID]
  DataHora DATETIME
  Tipus VARCHAR(20)
  PreuTotal DECIMAL(10, 2)
}

Table Productes {
  ID INT [pk]
  Nom VARCHAR(50)
  Descripcio VARCHAR(200)
  Imatge VARCHAR(100)
  Preu DECIMAL(10, 2)
  Tipus VARCHAR(20)
}

Table Botigues {
  ID INT [pk]
  Adreca VARCHAR(100)
  CodiPostal VARCHAR(10)
  Localitat VARCHAR(50)
  Provincia VARCHAR(50)
}

Table Empleats {
  ID INT [pk]
  ID_Botiga INT [ref: > Botigues.ID]
  Nom VARCHAR(50)
  Cognoms VARCHAR(50)
  NIF VARCHAR(20)
  Telefon VARCHAR(20)
  Rol VARCHAR(20)
}
