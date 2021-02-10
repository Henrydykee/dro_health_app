
import 'package:dro_health_app/models/drug_model.dart';
import 'package:dro_health_app/utils/color.dart';
import 'package:dro_health_app/viewmodels/cartViewmodels.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'checkout_button.dart';
import 'checkout_items.dart';
import 'instruction_widget.dart';

void modalBottomSheet(BuildContext context) {
  showModalBottomSheet(
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      context: context,
      builder: (context) {
        return Consumer<Cart>(
          builder: (context, vm, child){
            return Container(
              height: MediaQuery.of(context).size.height * 0.90,
              decoration: new BoxDecoration(
                color: DroColor.DarkPurple,
                borderRadius: new BorderRadius.only(
                  topLeft: const Radius.circular(25.0),
                  topRight: const Radius.circular(25.0),
                ),
              ),
              child: Column(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        SizedBox(height: 50,),
                        Instruction(),
                        SizedBox(height: 10,),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 20,right: 20),
                            child: ListView.separated(
                                shrinkWrap: true,
                                itemBuilder: (context , index){
                                  return CheckoutItem(
                                    name: vm.cartItems[index].name,
                                    sub: vm.cartItems[index].tablet,
                                    amount: "₦${vm.cartItems[index].price.toString()}",
                                    image: vm.cartItems[index].image,
                                  );
                                },
                                separatorBuilder: (BuildContext context, int index) => Divider(),
                                itemCount: vm.cartItems.length
                            ),
                          ),
                        ),

                      ],
                    ),
                  ),
                  SizedBox(height: 20,),
                  Visibility(
                    visible: vm.cartItems.length > 0,
                    child: Total(
                      total:"${vm.cartItems.length}00",
                    ),
                  ),
                  SizedBox(height: 20,),
                  CheckoutButton(),
                  SizedBox(height: 10,),
                ],
              ),
            );
          },
        );
      });
}




class Total extends StatelessWidget {
  final String total;

  Total({@required this.total});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20,right: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("Total",style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w800
          ),),
          Text("₦${total}",style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.w800
          ),)
        ],
      ),
    );
  }
}

