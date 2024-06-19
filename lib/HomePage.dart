import 'package:ecommerce_app/details.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List categories = [
    {"iconName": Icons.laptop, "title": "Laptop"},
    {"iconName": Icons.phone_android_outlined, "title": "Mobile"},
    {"iconName": Icons.electric_bike_outlined, "title": "Bike"},
    {"iconName": Icons.card_giftcard_outlined, "title": "Gifts"},
    {"iconName": Icons.electric_car_outlined, "title": "Car"},
  ];
  
  List items = [
    {"image": Image.asset("images/1.png", height: 100, fit: BoxFit.fill,), "title": "HeadPhone","subtitle": "Description","price" : "350\$"},
    {"image": Image.asset("images/2.png", height: 100, fit: BoxFit.fill,), "title": "Watch","subtitle": "Description","price" : "350\$"},
    {"image": Image.asset("images/1.png", height: 100, fit: BoxFit.fill,), "title": "HeadPhone","subtitle": "Description","price" : "350\$"},
    {"image": Image.asset("images/2.png", height: 100, fit: BoxFit.fill,), "title": "Watch","subtitle": "Description","price" : "350\$"},
  ];
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
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
        child: Container(
          padding: EdgeInsets.all(20),
          child: ListView(
            children: [
              Row(
                children: [
                  Expanded(
                      child: TextFormField(
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.search, color: Colors.blue,),
                          hintText: "Search",
                          border: InputBorder.none,
                          fillColor: Colors.grey[200],
                          filled: true,
                        ),
                      ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Icon(Icons.menu, size: 40,),
                  ),
                ],
              ),
              Container(height: 30,),
              Text("Categories", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
              Container(height: 20,),
              Container(
                height: 100,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: categories.length,
                  itemBuilder: (context, i){
                   return Container(
                      child: Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(100),
                            ),
                            child: Icon(categories[i]["iconName"], size: 40,),
                            padding: EdgeInsets.all(15),
                          ),
                          Text(categories[i]["title"],style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey[800]),),
                        ],
                      ),
                      margin: EdgeInsets.only(right: 10),
                    );
                  }
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  "Best Selling",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ),
              GridView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, mainAxisExtent: 250),
                itemCount: items.length,
                itemBuilder: (context, i){
                  return InkWell(
                    onTap: (){Navigator.of(context).push(MaterialPageRoute(builder: (context) => ItemDetails(dataItems: items[i],)));},
                    child: Card(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: EdgeInsets.all(20),
                            width: 300,
                            color: Colors.grey[200],
                            child: items[i]['image'],
                          ),
                          Text(items[i]["title"], style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
                          Container(height: 2,),
                          Text(items[i]["subtitle"], style: TextStyle(fontSize: 14, color: Colors.grey),),
                          Container(height: 10,),
                          Text(items[i]["price"], style: TextStyle(fontSize: 14, color: Colors.orange, fontWeight: FontWeight.bold),),
                        ],
                      ),
                    ),
                  );
                }
              ),
            ],
          ),
        ),
      ),
    );
  }
}
