import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class OrdersPage extends StatelessWidget {
  const OrdersPage({Key? key, required this.productStream, required this.BranchName, required this.cRef, required this.streamBranchOrders, required this.deleteRef}) : super(key: key);
  final Stream<QuerySnapshot> productStream ;
  final Stream<QuerySnapshot> streamBranchOrders;
  final String BranchName;
  final CollectionReference cRef;
  final CollectionReference deleteRef;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(actions: [
        IconButton(onPressed: () async{

          var doc = deleteRef.get();
          doc.then((snapshot) {
            snapshot.docs.forEach((doc) {
              doc.reference.delete();
            });
          });
          // var path= deleteRef;
          // deleteCollection(path) {
          //   FirebaseFirestore().collection(collectionPath)
          //   FirebaseFirestore().collection(path).listDocuments().then(val => {
          //   val.map((val) => {
          //   val.delete()
          //   })
          //   });
          // }
          // await deleteRef.snapshots().map((event) => event.docs.remove(deleteRef.snapshots()));
        }, icon: Icon(Icons.delete))
      ]),
      body: Column(
        children: [
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
                stream: streamBranchOrders ,
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Center(child: Text(' Loading'));
                  }
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  final data = snapshot.requireData;
                  for(int i=0;i<data.size;i++){
                    // dynamic dataa=data.docs[i]['order']['orderlist'][0];
                    // print('Here ${dataa}');
                    print(data.docs[i]['order']['orderlist']);
                  }



                  return ListView.builder(
                    itemCount: data.docs.length,
                    itemBuilder: (context, index) {
                      // print("Order :${ data.docs[index].get('order')['totalprice'].runtimeType}");
                      // final docId= data.docs[index]['docId'];
                      // dynamic dataa=data.docs[index]['order'];
                      // print('Here ${dataa}');

                      //****another Widget to build order
                      // return Padding(
                      //   padding: const EdgeInsets.all(8.0),
                      //   child: Container(
                      //     width: double.infinity,
                      //      height: 150,
                      //     decoration: BoxDecoration(
                      //       color: Colors.orangeAccent[100]
                      //     ),
                      //     child:Column(
                      //       crossAxisAlignment: CrossAxisAlignment.stretch,
                      //       children: [
                      //         Text('TotalPrice : ${data.docs[index]['order']['totalprice']}'),
                      //         Row(children: [
                      //           Text(
                      //
                      //             'Order : ${data.docs[index]['order']['orderlist'][index]['ProductName'] }'
                      //             ,
                      //             style: TextStyle(
                      //                 fontSize: 28
                      //             ),
                      //
                      //
                      //
                      //           ),
                      //          const  SizedBox(width: 10,),
                      //           Text(
                      //
                      //             '${data.docs[index]['order']['orderlist'][index]['Quantity']} '
                      //             ,
                      //             style: TextStyle(
                      //                 fontSize: 28
                      //             ),
                      //
                      //
                      //
                      //           ),
                      //         ]),
                      //
                      //       ],
                      //     ),
                      //   ),
                      // );
                      return OrderCart(product: data.docs[index]['order']['orderlist'],total: data.docs[index]['order']['totalprice'],name: data.docs[index]['order']['Name'],address: data.docs[index]['order']['Address'],phone: data.docs[index]['order']['Phone'],deleteRef: deleteRef,);
                    },
                  );
                }),
          ),

        ],
      )
    );
  }
}
class OrderCart extends StatefulWidget {
   OrderCart({Key? key, required this.product, this.total, this.name, this.address, this.phone, required this.deleteRef, }) : super(key: key);
 final List<dynamic> product;
 final dynamic total;
 final dynamic name;
 final dynamic address;
 final dynamic phone;
  final CollectionReference deleteRef;
  var colr=true;
  var Colore=Colors.orange[100];

  @override
  State<OrderCart> createState() => _OrderCartState();
}

class _OrderCartState extends State<OrderCart> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child:Container(
        height: 180,
        decoration: BoxDecoration(
          color: widget.Colore
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children:[
            Expanded(
              child: ListView.builder(
                  itemCount: widget.product.length,
                  itemBuilder:(context, index) =>  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text('Name :${widget.product[index]['ProductName']} Quantity: ${widget.product[index]['Quantity']}    ',style: TextStyle(
                          fontSize: 22
                      ),),

                    ],
                  )),
            ),
            Text('TotalPrice : ${widget.total}'),
            Text('UserName : ${widget.name}'),
            Text('Phone :${widget.phone}'),
            Text('Address : ${widget.address}'),
            Switch(value:widget.colr, onChanged: (value) {

              setState(() {

                widget.colr=value;
                if(widget.Colore==Colors.orange[100]){
                  widget.Colore=Colors.black54;
                }else{widget.Colore=Colors.orange[100];}


              });

            },)


          ]

        ),
      )
    );
  }
}

