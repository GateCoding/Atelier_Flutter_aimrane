import 'package:atelier4_aimrane_essakhi_iir5g7/produit.dart';
import 'package:flutter/material.dart';

class ProduitItem extends StatelessWidget {
  const ProduitItem({Key? key, required this.produit}) : super(key: key);
  final Produit produit;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(produit.nom),
      subtitle: Text('Prix : ${produit.prix}'),
      trailing: Text('Quantiter : ${produit.quantiter} DH'),
    );
  }
}
