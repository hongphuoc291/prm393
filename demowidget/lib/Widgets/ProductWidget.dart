import 'package:flutter/material.dart';
class ProductListWidget extends StatelessWidget {
  const ProductListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        for (int i = 1; i <= 5; i++) Productwidget(),
      ],
    );
  }
}

class Productwidget extends StatelessWidget{
  const Productwidget({super.key});

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
      width: double.infinity,
      height: 500,
      //decoration: BoxDecoration(border: Border.all(width: 3, color: Colors.purpleAccent)),
      child: Column(
        children: [
          //Product Image
          Expanded(
            flex: 7,
            child: Container(
              width: double.infinity,
              height: 700,
              child: Stack(children: [
               Container(
                  width: double.infinity,
                  height: 700,
                  child: Image.asset('assets/images/phuoc.jpg', fit: BoxFit.fill)),
                Align(
                  alignment: AlignmentGeometry.bottomRight,
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: FloatingActionButton.extended(
                      onPressed: (){},
                      label: Text("Add to cart"),
                      icon: Icon(Icons.shopping_cart),
    ),
  ),
)

              ],
              ) ,
            ),
          ),

          // Product name, price, like
          Expanded(
            flex: 2,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  flex: 8,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [Text("Product Name: Tea cup dog"),
                    Text("Price: 450\$")
                    ],
                  ),
                ),
                Expanded(
                    flex:1,
                    child: Icon(Icons.star, color: Colors.yellow, fontWeight: FontWeight.bold,)),
                Expanded(
                    flex:1,
                    child: Text("41"))
              ],
            ),
          ),
          //List Icons
          Expanded(
            flex: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                for(int i=1; i<=5; i++) Icon( Icons.star, color: Colors.yellow, fontWeight: FontWeight.bold,)
              ],
            ),
          ),
          SizedBox(height: 10),
          //Product Description
          Expanded(
            flex: 3,

            child: Card(
              child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Text("Con chó là loài động vật gần gũi và trung thành với con người. "
                    "Chúng có bộ lông mềm mại, đôi mắt lanh lợi. "
                    "Chó không chỉ giúp trông nhà mà còn là người bạn thân thiết của nhiều"
                    " gia đìnhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh"
                    "hhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh"
                    "hhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh"
                    "hhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh"
                ),


              ),
            ),
          ),
          ),
        ],
      ),
    ),
    );
  }
}