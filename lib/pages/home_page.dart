import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gadgets/pages/detail_page.dart';
import 'package:gadgets/provider/data_provider.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productsList = ref.watch(dataProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Riverpod CRUD'),
      ),
      body: productsList.when(
        data: (data) => Column(
          children: [
            Expanded(
              child: ListView.separated(
                itemBuilder: (context, index) {
                  final product = data[index];
                  return InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => DetailPage(p: product),
                      ));
                    },
                    child: Card(
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundImage: NetworkImage(product.images[0]),
                        ),
                        title: Text(product.title),
                        subtitle: Text('${product.price} \$'),
                      ),
                    ),
                  );
                },
                separatorBuilder: (context, index) => const SizedBox(
                  height: 2,
                ),
                itemCount: data.length,
              ),
            ),
          ],
        ),
        error: (err, bt) {
          return Center(
            child: Text(err.toString()),
          );
        },
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
