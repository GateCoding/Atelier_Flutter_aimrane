import 'package:cloud_firestore/cloud_firestore.dart';

class Produit {
  String id;
  String nom;
  double prix;
  int quantiter;

  Produit(
      {required this.id,
      required this.prix,
      required this.nom,
      required this.quantiter});

  factory Produit.fromFirestore(DocumentSnapshot doc) {
    Map data = doc.data() as Map;
    return Produit(
      id: doc.id,
      nom: data['nom'] ?? '',
      quantiter: data['quantiter'] ?? 0.0,
      prix: (data['prix'] ?? 0.0).toDouble(),
    );
  }
}
