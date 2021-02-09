import 'package:dro_health_app/models/drug_model.dart';
import 'package:dro_health_app/utils/color.dart';
import 'package:dro_health_app/widgets/product_details.dart';
import 'package:dro_health_app/widgets/sold_by.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatefulWidget {
  Drug drug;

  DetailScreen({this.drug});

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 70, left: 25, right: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: Icon(
                        Icons.arrow_back,
                        color: Colors.black,
                        size: 25,
                      )),
                  Container(
                    height: 35,
                    width: 50,
                    decoration: BoxDecoration(
                        color: DroColor.DROPurple,
                        borderRadius: BorderRadius.circular(5.0)),
                  )
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                height: 150,
                width: MediaQuery.of(context).size.width,
                child: Center(
                  child: Image.asset("${widget.drug.image}"),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                widget.drug.name,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 22,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                "Tablet-${widget.drug.tablet}",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 10,
              ),
              SoldBy(),
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 35,
                    width: 90,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(color: Colors.black38)),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10, right: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "-",
                            style: TextStyle(
                              color: Colors.black38,
                              fontSize: 30,
                            ),
                          ),
                          Text(
                            "1",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 22,
                                fontWeight: FontWeight.w600),
                          ),
                          Text(
                            "+",
                            style: TextStyle(
                                color: Colors.black38,
                                fontSize: 22,
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Text(
                    "₦${widget.drug.price.toString()}",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 22,
                        fontWeight: FontWeight.w600),
                  ),
                ],
              ),
              SizedBox(
                height: 25,
              ),
              Text(
                "PRODUCT DETAILS",
                style: TextStyle(
                    color: DroColor.Grey,
                    fontSize: 10,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 25,
              ),
              ProductDetails(
                title: widget.drug.name,
              ),
              SizedBox(
                height: 25,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "1 pack of ${widget.drug.name} contains 3 units of Tablet(s)",
                    style: TextStyle(
                        color: DroColor.Grey,
                        fontSize: 12,
                        fontWeight: FontWeight.w600),
                  ),
                ],
              ),
              SizedBox(
                height: 50,
              ),
            ],
          ),
        ),
      ),
    );
  }
}




