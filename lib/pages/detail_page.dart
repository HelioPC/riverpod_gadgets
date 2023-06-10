import 'package:flutter/material.dart';
import 'package:gadgets/model/product.dart';

class DetailPage extends StatelessWidget {
  final Product p;

  const DetailPage({super.key, required this.p});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product ${p.title}'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            children: [
              Center(
                child: CircleAvatar(
                  backgroundImage: NetworkImage(p.images[0]),
                ),
              ),
              Text(p.description),
            ],
          ),
        ),
      ),
    );
  }
}
