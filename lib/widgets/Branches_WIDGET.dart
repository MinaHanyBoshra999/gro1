import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:gro1/view/coBracnch_Page.dart';
import 'package:gro1/main.dart';


class BranchWidget extends StatelessWidget {
  BranchWidget({Key? key, required this.streamBranch, required this.branchName, required this.cref2, this.name, this.name2, required this.streamBranchOrders, required this.streamBranchRaw, required this.streamBranchFried, required this.streamBranchSauces, required this.deleteRef, required this.CrefBranchRaw, required this.CrefBranchFried, required this.CrefstreamBranchSauces}) : super(key: key);
  final Stream<QuerySnapshot> streamBranch;
  final Stream<QuerySnapshot> streamBranchOrders;
  final Stream<QuerySnapshot> streamBranchRaw;
  final Stream<QuerySnapshot> streamBranchFried;
  final Stream<QuerySnapshot> streamBranchSauces;
  final String branchName;
  final CollectionReference cref2;
  final CollectionReference deleteRef;
  final name;
  final name2;
  //final QueryDocumentSnapshot product;
   CollectionReference CrefBranchRaw;
   CollectionReference CrefBranchFried;
   CollectionReference CrefstreamBranchSauces;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(

      onTap: () {
        Get.to(()=>CoBranchPage(name: name,name2: name2,BranchName: branchName,productStream: streamBranch,cRef: cref2, streamBranchOrders: streamBranchOrders, streamBranchRaw: streamBranchRaw, streamBranchFried: streamBranchFried,streamBranchSauces: streamBranchSauces, deleteRef: deleteRef,CrefBranchFried: CrefBranchFried,CrefstreamBranchSauces: CrefstreamBranchSauces,CrefBranchRaw: CrefBranchRaw, ));
      },
      child: Container(
        height: 130,
        width: 150,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.orange
        ),
        child: Center(child: Text(branchName,style:const  TextStyle(fontSize: 22),)),


      ),
    );
  }
}
