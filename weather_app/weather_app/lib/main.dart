// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:weather_app/models/cart_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Cart? cart;
  Future<void> getData() async {
    const String apiUrl = "https://dummyjson.com/carts";
    try {
      Response response = await Dio().get(apiUrl);
      if (response.data != null) {
        setState(() {
          cart = Cart.fromJson(response.data);
        });
      }
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
      home: Scaffold(
        body: cart == null
            ? Center(child: CircularProgressIndicator())
            : ListView.builder(
  itemCount: cart?.carts?.length ?? 0,
  itemBuilder: (context, cartIndex) {
    final currentCart = cart!.carts![cartIndex];
    
    return ExpansionTile(
      title: Text("Sepet No: ${currentCart.id}"),
      subtitle: Text("Toplam Ürün: ${currentCart.totalProducts} - Toplam fiyat: ${currentCart.total}"),
      leading: Icon(Icons.shopify_outlined),
      children: currentCart.products!.map((product) {
        return ListTile(
          leading: Image.network(product.thumbnail ?? "", width: 50),
          title: Text(product.title ?? ""),
          subtitle: Text("${product.price} TL x ${product.quantity}"),
          trailing: Text("${product.total} TL"),
        );
      }).toList(),
    );
  },
)
      ),
    );
  }
}
