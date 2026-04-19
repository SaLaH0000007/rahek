import 'package:flutter/material.dart';
import '../../../../sheredcomponent/custom_appbar.dart';

class HoneyPage extends StatelessWidget {
  HoneyPage({super.key});

  final List<String> imageList = [
    "assets/images/Container1.png",
    "assets/images/Container2.png",
    "assets/images/Container2.png",
    "assets/images/Container1.png",
  ];




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        showSearch: true,
        showCompare: true,
        onMenuPressed: () {
          print("Menu clicked");
        },
        onSearchPressed: () {
          print("Search clicked");
        },
        onComparePressed: () {
          print("Compare clicked");
        },
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // 🔶 Banner
            Container(
              height: 150,
              width: double.infinity,
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: AssetImage("assets/images/img.png"),
                  fit: BoxFit.cover,
                ),
              ),
            ),

            // 🔶 Offers
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset("assets/images/Container1.png", height: 60),
                SizedBox(width: 10),
                Image.asset("assets/images/Container2.png", height: 60),
              ],
            ),

            SizedBox(height: 10),

            // 🔶 Title
            Text(
              "New Products",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),

            SizedBox(height: 5),

            // 🔶 Filters
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                filterButton("New Products"),
                SizedBox(width: 6),
                filterButton("Final Sale"),
                SizedBox(width: 6),
                filterButton("Top Sales"),
              ],
            ),

            SizedBox(height: 10),

            // 🔶 Products Grid
            GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: 6,
              padding: EdgeInsets.all(10),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.7,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemBuilder: (context, index) {
                return productCard();
              },
            ),
            GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: imageList.length,
              padding: EdgeInsets.all(10),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 1.3,
              ),
              itemBuilder: (context, index) {
                return ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    imageList[index],
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: double.infinity,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
  // 🔶 Filter Button
  Widget filterButton(String text) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.orange),
      ),
      child: Text(text, style: TextStyle(fontSize: 12)),
    );
  }

  // 🔶 Product Card
  Widget productCard() {
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Stack(
              children: [
                Container(
                  width: double.infinity,
                  color: Colors.grey[200],
                  child: Center(child: Icon(Icons.image, size: 50)),
                ),
                Positioned(
                  top: 8,
                  right: 8,
                  child: Column(
                    children: [
                      Icon(Icons.swap_horiz,
                          color: Colors.blueGrey, size: 20),
                      SizedBox(height: 8),
                      Icon(Icons.favorite,
                          color: Colors.red, size: 20),
                    ],
                  ),
                ),
              ],
            ),
          ),

          SizedBox(height: 5),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              5,
                  (index) =>
                  Icon(Icons.star_border, color: Colors.orange, size: 16),
            ),
          ),

          SizedBox(height: 5),

          Text(
            "EGP 120.00",
            style:
            TextStyle(fontWeight: FontWeight.bold, color: Colors.orange),
          ),

          SizedBox(height: 5),

          Text(
            "EGP 150.00",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.grey,
              decoration: TextDecoration.lineThrough,
            ),
          ),

          SizedBox(height: 5),

          Text(
            "20% OFF",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.grey,
            ),
          ),

          SizedBox(height: 5),

          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(vertical: 6),
            decoration: BoxDecoration(
              color: Color(0xFFE2A331),
              borderRadius: BorderRadius.circular(5),
            ),
            child: Center(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.shopping_cart,
                      color: Colors.white, size: 16),
                  SizedBox(width: 5),
                  Text(
                    "Add to cart",
                    style:
                    TextStyle(color: Colors.white, fontSize: 12),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
