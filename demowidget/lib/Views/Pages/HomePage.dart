import 'package:flutter/material.dart';
import 'package:demowidget/Widgets/ProductWidget.dart';

class Homepage extends StatelessWidget{
  const Homepage({super.key});
  void onPress() {}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
        backgroundColor: Colors.pink[200],
        leading: IconButton(
          onPressed: onPress,
          icon: Icon(Icons.menu),
        ),
        actions: [
          IconButton(
            onPressed: onPress,
            icon: Icon(Icons.search),
          ),
          IconButton(
            onPressed: onPress,
            icon: Icon(Icons.fastfood),
          ),
          IconButton(
            onPressed: onPress,
            icon: Icon(Icons.face),
          ),
        ],
      ),
      // body: Container(
      //   height: MediaQuery.of(context).size.height,
      //   width: double.infinity,
      //   child: Image.asset("assets/images/phuoc.jpg", fit: BoxFit.contain,),
      //
      // ),
      body: const ProductListWidget(),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            label: "Home",
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            label: "Settings",
            icon: Icon(Icons.settings, color: Colors.purple,),
          ),
          BottomNavigationBarItem(
            label: "Favorite",
            icon: Icon(Icons.favorite, color: Colors.pink,),
          ),
        ],
      ),
      // body: SafeArea(
      //   child: RichText(
      //     text: TextSpan(
      //       text: "Hello ",
      //       style: TextStyle(
      //         color: Colors.deepPurple,
      //         fontSize: 20,
      //         fontWeight: FontWeight.bold,
      //       ),
      //       children: [
      //         TextSpan(
      //           text: "Phuoc ",
      //           style: TextStyle(
      //             color: Colors.blue,
      //             fontSize: 20,
      //             fontWeight: FontWeight.bold,
      //           ),
      //         ),
      //       ],
      //     ),
      //   ),
      // ),
    );
  }
}