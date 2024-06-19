import 'package:flutter/material.dart';

class ItemDetails extends StatefulWidget {
  final dataItems;
  const ItemDetails({super.key, this.dataItems});

  @override
  State<ItemDetails> createState() => _ItemDetailsState();
}

class _ItemDetailsState extends State<ItemDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        iconSize: 40,
        selectedItemColor: Colors.orange,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: "*",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag_outlined),
            label: "*",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: "*",
          ),
        ],
      ),
      appBar: AppBar(
        backgroundColor: Colors.grey[200],
        elevation: 0.0,
        iconTheme: IconThemeData(
          color: Colors.grey
        ),
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.shop_outlined, color: Colors.black,),
            Text(" Ecommerce", style: TextStyle(color: Colors.black),),
            Text(" Shop", style: TextStyle(color: Colors.orange),)
          ],
        ),
        //centerTitle: true,
      ),
      endDrawer: Drawer(),
      body: ListView(
        children: [
          Container(
            height: 300,
            margin: EdgeInsets.symmetric(vertical: 30),
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: widget.dataItems['image'],
          ),
          Container(
              child: Text(widget.dataItems['title'],
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 20,
                ),
              )
          ),
          Container(
            margin: EdgeInsets.only(top: 10),
              child: Text(widget.dataItems['subtitle'],
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.grey,
                  fontSize: 16
                ),
              )
          ),
          Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              child: Text(widget.dataItems['price'],
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.orange,
                  fontWeight: FontWeight.bold,
                  fontSize: 16
                ),
              )
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Color : ", style: TextStyle(color: Colors.grey),),
              SizedBox(
                width: 10,
              ),
              Container(
                width: 20,
                height: 20,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(color: Colors.orange)
                ),
              ),
              Text("  Grey"),
              SizedBox(
                width: 20,
              ),
              Container(
                width: 20,
                height: 20,
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(30),
                ),
              ),
              Text("  Black"),
            ],
          ),
          Container(
            margin: EdgeInsets.only(top: 20),
              child: Text("Size :     34  35  40  41",
                style: TextStyle(color: Colors.grey),
                textAlign: TextAlign.center,
              ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 60, vertical: 20),
            padding: EdgeInsets.symmetric(vertical: 15),
            child: MaterialButton(onPressed: (){},
              color: Colors.black,
              textColor: Colors.white,
              padding: EdgeInsets.all(15),
              child: Text("Add to Cart"),
            ),
          ),
        ],
      ),
    );
  }
}
