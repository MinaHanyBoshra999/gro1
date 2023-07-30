import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gro1/view/coBracnch_Page.dart';
import 'package:gro1/widgets/raw_category.dart';

class ShopCategoryPage extends StatelessWidget {
  const ShopCategoryPage({Key? key, required this.streamBranchOrders, required this.productStream, required this.BranchName, required this.cRef, required this.deleteRef, required this.streamBranchRaw, required this.streamBranchFried, required this.streamBranchSauces}) : super(key: key);
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
    return Scaffold(
      body: Column(
        children: [
          RawCategory(streamBranchOrders: streamBranchOrders, productStream: productStream, BranchName: BranchName, cRef: cRef, deleteRef: deleteRef, streamBranchRaw: streamBranchRaw, streamBranchFried: streamBranchFried, streamBranchSauces: streamBranchSauces),
          FriedCategory(streamBranchOrders: streamBranchOrders, productStream: productStream, BranchName: BranchName, cRef: cRef, deleteRef: deleteRef, streamBranchRaw: streamBranchRaw, streamBranchFried: streamBranchFried, streamBranchSauces: streamBranchSauces),
          SaucesCategory(streamBranchOrders: streamBranchOrders, productStream: productStream, BranchName: BranchName, cRef: cRef, deleteRef: deleteRef, streamBranchRaw: streamBranchRaw, streamBranchFried: streamBranchFried, streamBranchSauces: streamBranchSauces)
          
        ],
      ),
    );
  }
}
