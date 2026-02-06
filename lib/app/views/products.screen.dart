import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_feb2026/app/services/api.services.dart';
import 'package:flutter_feb2026/app/views/add_product.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({super.key});

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {

  @override
  void initState(){
    super.initState();
    getProducts();
  }

  List productList = [];
  void getProducts() async {
    try {
      var result = await api.getHttp('/products');
      if(result != null){
        setState(() {
          productList = result;
        });
      }
    } catch(e){
      log('Error in getting products');
    }
  }

  void addProduct(dynamic productData) async {
    try {
      var result = await api.postHttp('/products', productData);
      if(result != null){
        setState(() {
          productList.insert(0, result);
        });
      }
    } catch(e){
      log('Error ${e.toString()}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Products'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            for(var product in productList)
            Card(
              margin: EdgeInsets.fromLTRB(16, 8, 16, 0),
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.all(16),
                    width: MediaQuery.of(context).size.width,
                    height: 200,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey, width: 1)
                    ),
                    child: product['image'] != null ?
                    Image.network(product['image'], fit: BoxFit.cover)
                    : Image.asset('assets/images/lake.jpg', fit: BoxFit.cover),
                  ),
                  Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.all(16),
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(bottom: 8),
                          child: Text(product['title'], style: TextStyle(fontSize: 20),),
                        ),
                        Text('USD ${product['price']}',style: TextStyle(fontSize: 14),)
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        )
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(context, 
            MaterialPageRoute(builder: (context) => AddProduct(onAddProduct: addProduct,))
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}