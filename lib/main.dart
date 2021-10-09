import 'package:flutter/material.dart';
import 'package:ecommerce/http_helper.dart';
import 'package:ecommerce/product.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late Future<List<Product>> futureProduct;

  @override
  void initState() {
    super.initState();
    futureProduct = fetchProducts();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Invony App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Invony App'),
        ),
        body: Center(
          child: FutureBuilder<List<Product>>(
            future: futureProduct,
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                  shrinkWrap: true,
                  itemCount: snapshot.data.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Row(
                      children: [
                        Container(
                          height: 250,
                          alignment: Alignment.centerLeft,
                          child: Card(
                            child: Image.network(snapshot.data[index].image),
                          ),
                        ),
                        Container(),
                      ],
                    );
                  },
                );
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }

              // By default, show a loading spinner.
              return const CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}
