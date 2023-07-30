import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:gro1/view/OrdersPage.dart';
import 'package:gro1/main.dart';

import '../widgets/shop_view_list.dart';

class CoBranchPage extends StatelessWidget {
  const CoBranchPage({Key? key, this.name, this.name2, required this.productStream, required this.BranchName, required this.cRef, required this.streamBranchOrders, required this.streamBranchRaw, required this.streamBranchFried, required this.streamBranchSauces, required this.deleteRef}) : super(key: key);
final name;
final name2;
  final Stream<QuerySnapshot> productStream ;
  final String BranchName;
  final CollectionReference cRef;
  final Stream<QuerySnapshot> streamBranchOrders;
  final Stream<QuerySnapshot> streamBranchRaw;
  final Stream<QuerySnapshot> streamBranchFried;
  final Stream<QuerySnapshot> streamBranchSauces;
  final CollectionReference deleteRef;
  // final Stream<QuerySnapshot> productSt
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          const SizedBox(height: 30,),
          ShopCoBranch(BranchName: BranchName,cRef: cRef,productStream: productStream,streamBranchOrders:streamBranchOrders ,streamBranchFried: streamBranchFried,streamBranchRaw: streamBranchRaw, streamBranchSauces: streamBranchSauces, deleteRef: deleteRef,),
          const SizedBox(height: 30,),
          OrdersCoBranch(streamBranchOrders: streamBranchOrders, productStream: productStream, BranchName: BranchName, cRef: cRef,deleteRef: deleteRef,),

        ],
      ),


    );
  }
}

class OrdersCoBranch extends StatelessWidget {


  final Stream<QuerySnapshot> streamBranchOrders;
  final Stream<QuerySnapshot> productStream ;
  final String BranchName;
  final CollectionReference cRef;
  final CollectionReference deleteRef;

  const OrdersCoBranch({super.key, required this.streamBranchOrders, required this.productStream, required this.BranchName, required this.cRef, required this.deleteRef});


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
        child: const Center(child: Text('Orders',style: TextStyle(fontSize: 22))),

      ),
      onTap: () {



          Get.to(()=>OrdersPage(productStream: productStream, BranchName: BranchName, cRef: cRef,streamBranchOrders: streamBranchOrders, deleteRef: deleteRef,));


      },
    );
  }
}
class ShopCoBranch extends StatelessWidget {


  final Stream<QuerySnapshot> streamBranchOrders;
  final Stream<QuerySnapshot> productStream ;
  final String BranchName;
  final CollectionReference cRef;
  final CollectionReference deleteRef;

  const ShopCoBranch({super.key, required this.streamBranchOrders, required this.productStream, required this.BranchName, required this.cRef, required this.streamBranchRaw, required this.streamBranchFried, required this.streamBranchSauces, required this.deleteRef});

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
        child: Center(child: Text('Shop',style: TextStyle(fontSize: 22))),

      ),
      onTap: () {



          Get.to(()=>ShopViewList(productStream: productStream, BranchName: BranchName, cRef: cRef, streamBranchRaw: streamBranchRaw, streamBranchSauces: streamBranchSauces,streamBranchFried: streamBranchFried,));


      },
    );
  }
}
