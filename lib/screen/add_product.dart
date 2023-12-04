import 'dart:convert';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:hacker_kernel_task/models/product.dart';
import 'package:hacker_kernel_task/screen/homescreen/home_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddProduct extends StatefulWidget {
  const AddProduct({super.key});

  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  TextEditingController nameController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  List<ProductModel> product = [];
  Future<void> _saveProducts() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList(
        'products', product.map((item) => jsonEncode(item.toMap())).toList());
  }

  void addProduct(String name, double price) {
    setState(() {
      product.add(ProductModel(name, price));
      _saveProducts();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              TextFormField(
                controller: nameController,
                decoration: const InputDecoration(
                  hintText: "Product Name",
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: priceController,
                decoration: const InputDecoration(
                  hintText: "Product price",
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              MaterialButton(
                color: Colors.blue,
                onPressed: () async {
                  addProduct(
                    nameController.text,
                    double.parse(priceController.text),
                  );
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => const HomeScreen(),
                    ),
                  );
                  setState(() {});
                },
                child: const Text("Save"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
