import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:gro1/view/fried_view.dart';
import 'package:gro1/view/raw_view.dart';
import 'package:gro1/view/sauces_view.dart';
import 'package:gro1/widgets/shop_view_list.dart';

class RawCategory extends StatelessWidget {
  const RawCategory({Key? key, required this.streamBranchOrders, required this.productStream, required this.BranchName, required this.cRef, required this.deleteRef, required this.streamBranchRaw, required this.streamBranchFried, required this.streamBranchSauces}) : super(key: key);
  final Stream<QuerySnapshot> streamBranchOrders;
  final Stream<QuerySnapshot> productStream ;
  final String BranchName;
  final CollectionReference cRef;
  final CollectionReference deleteRef;


  final Stream<QuerySnapshot> streamBranchRaw;
  final Stream<QuerySnapshot> streamBranchFried;
  final Stream<QuerySnapshot> streamBranchSauces;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        width: 150,
        height:130 ,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.orange
        ),
        child: Center(child: Text('Raw',style: TextStyle(fontSize: 22))),

      ),
      onTap: () {



        Get.to(()=>RawView(productStream, BranchName, cRef, streamBranchRaw, streamBranchFried, streamBranchSauces));

      },
    ); ;
  }
}
class FriedCategory extends StatelessWidget {
  const FriedCategory({Key? key, required this.streamBranchOrders, required this.productStream, required this.BranchName, required this.cRef, required this.deleteRef, required this.streamBranchRaw, required this.streamBranchFried, required this.streamBranchSauces}) : super(key: key);
  final Stream<QuerySnapshot> streamBranchOrders;
  final Stream<QuerySnapshot> productStream ;
  final String BranchName;
  final CollectionReference cRef;
  final CollectionReference deleteRef;


  final Stream<QuerySnapshot> streamBranchRaw;
  final Stream<QuerySnapshot> streamBranchFried;
  final Stream<QuerySnapshot> streamBranchSauces;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        width: 150,
        height:130 ,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.orange
        ),
        child: Center(child: Text('Fried',style: TextStyle(fontSize: 22))),

      ),
      onTap: () {



        Get.to(()=>FriedView(productStream: productStream, BranchName: BranchName, cRef: cRef, streamBranchRaw: streamBranchRaw, streamBranchFried: streamBranchFried, streamBranchSauces: streamBranchSauces));

      },
    ); ;
  }
}
class SaucesCategory extends StatelessWidget {
  const SaucesCategory({Key? key, required this.streamBranchOrders, required this.productStream, required this.BranchName, required this.cRef, required this.deleteRef, required this.streamBranchRaw, required this.streamBranchFried, required this.streamBranchSauces}) : super(key: key);
  final Stream<QuerySnapshot> streamBranchOrders;
  final Stream<QuerySnapshot> productStream ;
  final String BranchName;
  final CollectionReference cRef;
  final CollectionReference deleteRef;


  final Stream<QuerySnapshot> streamBranchRaw;
  final Stream<QuerySnapshot> streamBranchFried;
  final Stream<QuerySnapshot> streamBranchSauces;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        width: 150,
        height:130 ,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.orange
        ),
        child: Center(child: Text('Sauces',style: TextStyle(fontSize: 22))),

      ),
      onTap: () {



        Get.to(()=>SaucesView(productStream: productStream, BranchName: BranchName, cRef: cRef, streamBranchRaw: streamBranchRaw, streamBranchFried: streamBranchFried, streamBranchSauces: streamBranchSauces));


      },
    ); ;
  }
}
