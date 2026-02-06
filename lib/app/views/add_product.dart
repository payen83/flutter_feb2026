import 'package:flutter/material.dart';

class AddProduct extends StatelessWidget {
  AddProduct({super.key, required this.onAddProduct});

  final titleController = TextEditingController();
  final priceController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final Function onAddProduct;

  void submitForm(BuildContext context){
    if(formKey.currentState!.validate()){
      final productData = {
        'title': titleController.text,
        'price': priceController.text
      };
      onAddProduct(productData);
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Products'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Padding(padding: EdgeInsets.all(8),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                controller: titleController,
                decoration: InputDecoration(
                  labelText: 'Title',
                  hintText: 'Enter product name',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.note)
                ),
                textInputAction: TextInputAction.next,
                validator: (value){
                  if(value==null || value.isEmpty) return "Please enter title";
                  return null;
                },
              ),
              SizedBox(height: 16,),
              TextFormField(
                controller: priceController,
                decoration: InputDecoration(
                  labelText: 'Price',
                  hintText: 'Enter price',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.attach_money)
                ),
                textInputAction: TextInputAction.next,
                validator: (value){
                  if(value==null || value.isEmpty) return "Please enter price";
                  return null;
                },
              ),
              SizedBox(height: 16,),
              ElevatedButton(
                onPressed: (){
                  submitForm(context);
                }, 
                child: Text('Submit')
              )
            ],
          ),
        ),
      ),

    );
  }
}