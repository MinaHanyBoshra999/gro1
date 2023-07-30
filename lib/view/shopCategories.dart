import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gro1/view/coBracnch_Page.dart';
import 'package:gro1/widgets/raw_category.dart';

class ShopCategoryPage extends StatelessWidget {
   ShopCategoryPage({Key? key, required this.streamBranchOrders, required this.productStream, required this.BranchName, required this.cRef, required this.deleteRef, required this.streamBranchRaw, required this.streamBranchFried, required this.streamBranchSauces, required this.CrefBranchFried,required this.CrefstreamBranchSauces, required this.CrefBranchRaw}) : super(key: key);
  final Stream<QuerySnapshot> streamBranchOrders;
  final Stream<QuerySnapshot> productStream ;
  final String BranchName;
  final CollectionReference cRef;
  final CollectionReference deleteRef;

  CollectionReference CrefBranchRaw;
  CollectionReference CrefBranchFried;
  CollectionReference CrefstreamBranchSauces;
  final Stream<QuerySnapshot> streamBranchRaw;
  final Stream<QuerySnapshot> streamBranchFried;
  final Stream<QuerySnapshot> streamBranchSauces;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          RawCategory(streamBranchOrders: streamBranchOrders, productStream: productStream, BranchName: BranchName, cRef: cRef, deleteRef: deleteRef, streamBranchRaw: streamBranchRaw, streamBranchFried: streamBranchFried, streamBranchSauces: streamBranchSauces, CrefstreamBranchSauces: CrefstreamBranchSauces, CrefBranchFried: CrefBranchFried,CrefBranchRaw: CrefBranchRaw),
          FriedCategory(streamBranchOrders: streamBranchOrders, productStream: productStream, BranchName: BranchName, cRef: cRef, deleteRef: deleteRef, streamBranchRaw: streamBranchRaw, streamBranchFried: streamBranchFried, streamBranchSauces: streamBranchSauces,CrefBranchRaw: CrefBranchRaw,CrefBranchFried: CrefBranchFried,CrefstreamBranchSauces: CrefstreamBranchSauces),
          SaucesCategory(streamBranchOrders: streamBranchOrders, productStream: productStream, BranchName: BranchName, cRef: cRef, deleteRef: deleteRef, streamBranchRaw: streamBranchRaw, streamBranchFried: streamBranchFried, streamBranchSauces: streamBranchSauces,CrefBranchFried: CrefBranchFried, CrefstreamBranchSauces: CrefstreamBranchSauces,CrefBranchRaw: CrefBranchRaw,)
          
        ],
      ),
    );
  }
}
