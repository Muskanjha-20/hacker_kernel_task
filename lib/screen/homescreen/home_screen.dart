import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hacker_kernel_task/models/product.dart';
import 'package:hacker_kernel_task/screen/add_product.dart';
import 'package:hacker_kernel_task/screen/authentication/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<ProductModel> product = [];
  Future<void> loadProduct() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final productList = prefs.getStringList("products") ?? [];
    setState(() {
      product.addAll(
          productList.map((item) => ProductModel.fromMap(jsonDecode(item))));
    });
  }

  @override
  void initState() {
    loadProduct();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print(product.length);
    
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () async {
                    final SharedPreferences prefs =
                        await SharedPreferences.getInstance();
                    await prefs.setString("token", "");
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LoginScreen(),
                        ),
                        (route) => false);
                  },
                  child: Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Icon(
                      Icons.arrow_back_ios_new_outlined,
                      color: Colors.grey,
                    ),
                  ),
                ),
                Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Colors.grey,
                    ),
                  ),
                  child: const Icon(
                    Icons.search,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Hi-Fi Shop & Service",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Text(
                "Audio shop on Rustaveli Ave 57.",
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              const Text(
                "This shop offers both products and services",
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: 'Products',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        TextSpan(
                          text: ' 41',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    "Show all",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.blue,
                      fontWeight: FontWeight.w400,
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Expanded(
                child: ListView.separated(
                  separatorBuilder: (context, index) => const SizedBox(
                    width: 8,
                  ),
                  shrinkWrap: true,
                  // physics: NeverScrollableScrollPhysics(),
                  itemCount: product.length,
                  // scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => ProductCard(
                    productName: product[index].name,
                    productPrice: product[index].price.toString(),
                  ),
                ),
              ),
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        floatingActionButton: FloatingActionButton(
          child: Icon(
            Icons.add,
            color: Colors.white,
          ),
          backgroundColor: Colors.blue,
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => AddProduct(),
              ),
            );
          },
        ),
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final String productName;
  final String productPrice;
  const ProductCard({
    super.key,
    required this.productName,
    required this.productPrice,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 150,
          width: 180,
          decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Image.asset(
            "assets/headphone1.png",
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          productName,
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w500,
          ),
        ),
        Text(productPrice),
      ],
    );
  }
}
