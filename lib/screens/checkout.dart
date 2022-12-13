import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:practice_flutter_well/components/custom_button.dart';
import 'package:practice_flutter_well/components/list_card.dart';
import 'package:practice_flutter_well/utils/custom_theme.dart';

class Checkout extends StatefulWidget {
  const Checkout({Key? key}) : super(key: key);

  @override
  State<Checkout> createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> {
  final carts = ["1", "2"];
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(vertical: 30),
      child: Column(children: [
        ListView.builder(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: carts.length,
          itemBuilder: (context, index) {
            return ListCard();
          },
        ),
        priceFooter(),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
          child: CustomButton(
            text: "CHECKOUT",
            onPress: () {},
            loading: false,
          ),
        )
      ]),
    );
  }

  priceFooter() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Divider(
            height: 2,
            color: CustomTheme.grey,
            thickness: 2,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Row(children: [
              Text("Total", style: Theme.of(context).textTheme.headlineSmall),
              const Spacer(),
              Text("\$ price", style: Theme.of(context).textTheme.headlineSmall)
            ]),
          )
        ],
      ),
    );
  }
}
