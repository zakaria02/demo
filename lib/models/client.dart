class Client {
  String nom;
  String prenom;
  int age;
  String numTel;

  Client({
    required this.nom,
    required this.prenom,
    required this.age,
    required this.numTel,
  });

  Client.fromJson(Map<String, dynamic> json)
      : nom = json["nom"] ?? "",
        prenom = json["prenom"] ?? "",
        age = json["age"] ?? 0,
        numTel = json["numTel"] ?? "";

  Map<String, dynamic> toJson() => {
        "nom": nom,
        "prenom": prenom,
        "age": age,
        "numTel": numTel,
      };

  @override
  String toString() {
    return "Client(nom: $nom, prenom: $prenom, age: $age, numéro de téléphone: $numTel";
  }
}
