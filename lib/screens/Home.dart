import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:practice_flutter_well/components/grid_card.dart';
import 'package:practice_flutter_well/screens/login.dart';
import 'package:practice_flutter_well/screens/login.dart';
import 'package:practice_flutter_well/screens/product.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  onCardPress() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => Login()));
  }

  @override
  Widget build(BuildContext context) {
    final data = ["1", "2"];
    return Container(
      child: GridView.builder(
          itemCount: data.length,
          padding: const EdgeInsets.symmetric(vertical: 30),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, mainAxisSpacing: 30, crossAxisSpacing: 30),
          itemBuilder: (BuildContext context, int index) {
            return GridCard(index: index, onPress: onCardPress);
          }),
    );
  }
}
