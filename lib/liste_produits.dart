import 'package:atelier4_aimrane_essakhi_iir5g7/produit.dart';
import 'package:atelier4_aimrane_essakhi_iir5g7/produitItem.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ListProduits extends StatefulWidget {
  const ListProduits({super.key});

  @override
  State<ListProduits> createState() => _ListProduitsState();
}

class _ListProduitsState extends State<ListProduits> {
  FirebaseFirestore db = FirebaseFirestore.instance;

  void supprimerProduit(String produitId) {
    db.collection('produits').doc(produitId).delete();
  }

  void ajouterProduit() {
    FirebaseFirestore.instance.collection('produits').add({
      'nom': 'aimrane',
      'prix': 1600,
      'quantiter': 13,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('List des produits'),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: db.collection('produits').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return const Center(child: Text('Une erreur est survenue'));
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          List<Produit> produits = snapshot.data!.docs.map((doc) {
            return Produit.fromFirestore(doc);
          }).toList();
          return ListView.builder(
            itemCount: produits.length,
            itemBuilder: (context, index) => ProduitItem(
              produit: produits[index],
            ),
          );
        },
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              ajouterProduit();
            },
            tooltip: 'Ajouter',
            child: const Icon(Icons.add),
          ),
          const SizedBox(height: 16),
          FloatingActionButton(
            onPressed: () {
              supprimerProduit('emcUkHpaF0Bco2uDHyJM');
            },
            tooltip: 'Supprimer',
            child: const Icon(Icons.delete),
          ),
        ],
      ),
    );
  }
}
