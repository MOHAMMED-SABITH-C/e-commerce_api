// import 'dart:js_interop';



// import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:convert';
// import 'package:flutter_advanced_switch/flutter_advanced_switch.dart';
// import 'package:lite_rolling_switch/lite_rolling_switch.dart';
// import 'package:e_commerce_app/forgotPass.dart';
import 'package:e_commerce_app/json_model.dart';
import 'package:e_commerce_app/login.dart';
import 'package:e_commerce_app/objDetails.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';

class homepage extends StatefulWidget {
   homepage({super.key});
  // CollectionReference plants=FirebaseFirestore.instance.collection('plants');
@override
  // _ProductListPageState createState() => _ProductListPageState();
  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  // late Future<bool> showDiscountedPrice;
  // bool _switch=false;
  bool showDiscountedPrice=false;
  // late Future<dynamic> info;
 List<Welcome> productModelList=[];
 List<dynamic> products=[];
  // remoteConfig.setDefalt{

  // }
  initState(){
    
    super.initState();
    final remoteConfig = FirebaseRemoteConfig.instance;
    remoteConfig.onConfigUpdated.listen((RemoteConfigUpdate event)async{
      await remoteConfig.activate();
      setState(() {
        showDiscountedPrice=remoteConfig.getBool('showDiscountedPrice');
      });
    });
    //  fetchShowDiscountedPrice();
  //  _switch=  showDiscountedPrice;
  }
  Future<Welcome> fetchProducts()async{
    String url='https://dummyjson.com/products';
    Uri uri=Uri.parse(url);
    final result= await http.get(uri);
    if(result.statusCode==200 || result.statusCode==201){
       await Future.delayed(Duration(seconds: 1)); // Simulate network delay
    // return welcomeFromJson(response);
      return Welcome.fromJson(jsonDecode(result.body));
    }else{
      throw Exception("Fail to load");
    }
  }
  
  late int flag=1;
// late var _controller = ValueNotifier<bool>(showDiscountedPrice);
  @override
  Widget build(BuildContext context) {
    //  fetchShowDiscountedPrice();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,title: Text('e-Shop',style: TextStyle(color: Colors.white,fontWeight:FontWeight.bold,fontSize: 35),),
      backgroundColor:Color(0xF704357F) ,
        // ),

        // leading: IconButton(onPressed: (){Navigator.of(context).push(MaterialPageRoute(builder:(context){return loginPage();}));}, icon: Icon(Icons.arrow_back_ios_new_outlined)),
        actions: [
          InkWell(
          child: Container(width: 50,height: 50,
            child: Center(child: Text('e',style: TextStyle(color: Colors.white,fontSize: 30,fontWeight: FontWeight.bold),)),decoration: BoxDecoration(boxShadow: [BoxShadow(color: Colors.black)], borderRadius: BorderRadius.circular(50)),),
          onTap: (){},
          )
          ]),
      body: 
      Column(
        children: [
      Container(
        height: 40,
        width: double.infinity,
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left:10.0),
              child: Container(
                width: MediaQuery.of(context).size.width-70,
                height: 50,
                child: TextField(textAlign: TextAlign.justify,decoration: InputDecoration(border: InputBorder.none,hintText: 'Search'),),
                decoration: BoxDecoration(boxShadow: [BoxShadow(color: Colors.grey)],borderRadius: BorderRadius.circular(10)),),
            ),
            
            SizedBox(width: 10,),
            Container(
              height: 40,
              width:40,// MediaQuery.of(context).size.width-100,
              decoration: BoxDecoration(color: Colors.grey,borderRadius: BorderRadius.circular(10)),
              child: Center(child: IconButton(onPressed: (){
              if(flag==1){
                flag=0;
              }
            }, icon: Icon(flag==1?Icons.menu:Icons.close_outlined,),)))
          ],
        ),
      ),
          Expanded(
            child: Container(
              height: MediaQuery.of(context).size.height-150,
              width: double.infinity,
              child: Row(
                children: [
                  Expanded( 
                    child: Column(
                      children: [
                        // ...
// ...
// _switch==false?Text('Tap to see discount price'):
// Text('Tap to see original price'),
// AdvancedSwitch(
//     controller: _controller,
//     activeColor: Colors.green,
//     inactiveColor: Colors.grey,
//     activeChild: Text(''),
//     inactiveChild: Text(''), 
//     activeImage: AssetImage('og.jpg'),
//     inactiveImage: AssetImage('dis.jpg'),
//     borderRadius: BorderRadius.all(const Radius.circular(15)),
//     width: 100.0,
//     height: 30.0,
//     enabled: true,
//     disabledOpacity: 0.5,
//     onChanged: (value) {
//       setState(() {
//     _controller = ValueNotifier<bool>(!_switch);

//         remoteConfig.setDefalt('showDiscountedPrice')=!_switch;
//       _switch=!_switch;
//       });
//     },
// ),
                        SizedBox(height: 50,child:showDiscountedPrice==true? Image.asset('discountP.jpg'):Image.asset('ogprice.jpg')),//Text('Result found'),),
                        Expanded(
                          child: FutureBuilder(
                            future: fetchProducts(),
                            // stream: ().snapshots(),
                            builder: (context, AsyncSnapshot snapshot) {
                               if (snapshot.connectionState == ConnectionState.waiting) {
                                  return Center(child: CircularProgressIndicator());
                                //  else if(snapshot.hasData){
                                }else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.products.isEmpty) {
            return Center(child: Text('No products found'));
          } else {
                                  final products = snapshot.data!.products;
                              return ListView.separated(
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                itemBuilder:((BuildContext context, index) {
                                  final product = products[index];
                                  // final DocumentSnapshot plantSnap=snapshot.data!.docs[index];
                                  // final plantSnap=snapshot.data!.data[index];
                                   return 
                                   Padding(
                                     padding: const EdgeInsets.all(8.0),
                                     child: InkWell(
                                       child: Container(
                                          width: MediaQuery.of(context).size.width/2,
                                          // height: 180,
                                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)
                                          ,color: Colors.white30,
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.grey
                                            )
                                          ]
                                          ),
                                          child: 
                                          Column(
                                        // mainAxisAlignment: MainAxisAlignment.end,

                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                            
                                              Image.network(product.thumbnail),
                                              Center(child: Text(product.title)),
                                              showDiscountedPrice==true?Image.asset('disc.png',height: 25,width: 130,alignment: Alignment.centerLeft,):Text(''),
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [Padding(
                                                  padding: const EdgeInsets.all(8.0),
                                                  child: showDiscountedPrice==true?Text("\$${((product.price)*(1-((product.discountPercentage)/100))).toStringAsFixed(2)}",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20 ),):Text("\$${(product.price)}",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20 ),),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.all(15.0),
                                                  child: Container(
                                                    height: 20,
                                                      width:  45,
                                                    decoration: BoxDecoration(
                                                      borderRadius: BorderRadius.circular(5),
                                                      border: Border.all(width: 1,color: Color.fromARGB(255, 240, 240, 240)),
                                                      color: Color.fromARGB(255, 11, 94, 0)
                                                    ),
                                                    child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                      children: [
                                                        // Wrap(children:[
                                                           Text(product.rating.toString(),style: TextStyle(color: Colors.white),),
                                                        Image.asset('starpng.png',height: 15,width: 15,),
                                                      // ],),
                                                      ],
                                                    ),
                                                    // child: IconButton(onPressed: (){
                                                    //   setState(() {
                                                        
                                                    //   plantSnap['favor']==1?widget.plants.doc(plantSnap.id).update({'favor':0}):widget.plants.doc(plantSnap.id).update({'favor':1});
                                                      
                                                    //   });
                                                    // }, icon: Icon(Icons.favorite,color:plantSnap['favor']==1?Colors.pink: Colors.white,size: 25,)),
                                                  ),
                                                ),
                                                ],),
                                                Padding(
                                                  padding:  EdgeInsets.only(left:18.0),
                                                  child: showDiscountedPrice==true?RichText(
                                                    text: TextSpan(
                                                      text: 'M.R.P ',
                                                      style: TextStyle(fontWeight: FontWeight.bold,fontSize: 10,color: const Color.fromARGB(255, 53, 49, 49)),//
                                                      children:  <TextSpan>[
                                                        TextSpan(text:' ${(product.price.toString())}',
                                                         style: TextStyle(decoration: TextDecoration.lineThrough,fontWeight: FontWeight.normal),),
                                                        // TextSpan(text: ' world!'),
                                                      ],
                                                    ),
                                                  ):Text(''),
                                                ),
                                                // Text('M.R.P ${(product.price)}',style: TextStyle(decoration: TextDecoration.lineThrough),)
                                            ],
                                          )
                                          ),
                                          onTap: (){
                                            Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Buyobject(product:product,showDiscountedPrice: showDiscountedPrice,)));
                                          },
                                     ),
                                   );
                                  
                                }) , 
                                separatorBuilder: ((context, index) => SizedBox(height: 15,)), 
                                itemCount: ((products.length)/2).floor(),//(images.length/2).floor()
                                );
                            }
                            // return Container(
                            //   child: Text('sorry No elements found'),
                            // );
                            }
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 10,),
                    Expanded(
                      child: FutureBuilder<Welcome>(
                        future: fetchProducts(),
                      // child: StreamBuilder(
                      //   stream: (products).snapshots(),
                        builder: (context,AsyncSnapshot snapshot) {
                           if (snapshot.connectionState == ConnectionState.waiting) {
                                  return Center(child: CircularProgressIndicator());
                                } else if(snapshot.hasData){
                                  final products = snapshot.data!.products;
                          return ListView.separated(
                            shrinkWrap: true,
                            // controller: scrollcont,
                          scrollDirection: Axis.vertical,
                          itemBuilder:((BuildContext context, index) {
                            final int itemIndex = ((products.length)/2).floor()+index;//((leng/ 2).floor())+index;
                                  // final  plantSnap2=snapshot.data!.data[itemIndex];
                                  // Map map= snapshot.data!.docs[itemIndex];
                                  // final plantsn=snapshot.data();
                                  // print(plantSnap2['Name']);
                              final product = products[itemIndex];
                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: InkWell(
                                    child: Container(
                                      width: MediaQuery.of(context).size.width/2,
                                      // height: 180,
                                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),
                                          // ,color: Colors.red
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.grey
                                            )
                                          ]
                                      ),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          // Image.asset(plantSnap2['image']),
                                              Image.network(product.thumbnail),
                                      
                                          // plantSnap2.get('Name') == isUndefined
                                          //  snapshot.data!.docs[itemIndex].get("Name") ?Text('Welcome $itemIndex'):
                                           Center(child: Text(product.title,textAlign: TextAlign.center,)),
                                            
                                              showDiscountedPrice==true?Padding(
                                                padding: const EdgeInsets.only(left:8.0,bottom: 0),
                                                child: Image.asset('disc.png',height: 25,width: 130,alignment: Alignment.centerLeft,),
                                              ):Text(''),
                                      
                                          Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [Padding(
                                                  padding: const EdgeInsets.all(8.0),
                                                  child: showDiscountedPrice==true?Text("\$${((product.price)*(1-((product.discountPercentage)/100))).toStringAsFixed(2)}",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20 ),):Text("\$${(product.price)}",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20 ),),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.all(15.0),
                                                  child: Container(
                                                    height: 20,
                                                    width:  45,
                                                    decoration: BoxDecoration(
                                                      borderRadius: BorderRadius.circular(5),
                                                      border: Border.all(width: 1,color: Color.fromARGB(255, 240, 240, 240)),
                                                      color: Color.fromARGB(255, 11, 94, 0)
                                                    ),child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                      children: [
                                                        // Wrap(children:[
                                                           Text(product.rating.toString(),style: TextStyle(color: Colors.white),),
                                                        Image.asset('starpng.png',height: 15,width: 15,),
                                                      // ],),
                                                      ],
                                                    ),
                                                    // child: IconButton(onPressed: (){
                                                    //   setState(() {
                                                        
                                                    //   // favor[itemIndex]==1?favor[itemIndex]=0:favor[itemIndex]=1;
                                                    //   plantSnap2['favor']==1?widget.plants.doc(plantSnap2.id).update({'favor':0}):widget.plants.doc(plantSnap2.id).update({'favor':1});
                                                    //   });
                                                      
                                                    // }, icon: Icon(Icons.favorite,color:plantSnap2['favor']==1?Colors.pink: Colors.white,size: 25,)),
                                                  ),
                                                ),
                                                ],),
                                                 Padding(
                                                   padding: const EdgeInsets.only(left:18.0),
                                                   child: showDiscountedPrice==true?RichText(
                                                                                                     text: TextSpan(
                                                    text: 'M.R.P ',
                                                    style: TextStyle(fontWeight: FontWeight.bold,fontSize: 10,color: const Color.fromARGB(255, 53, 49, 49)),//
                                                    children:  <TextSpan>[
                                                      TextSpan(text:' ${(product.price.toString())}',
                                                       style: TextStyle(decoration: TextDecoration.lineThrough,fontWeight: FontWeight.normal)),
                                                      // TextSpan(text: ' world!'),
                                                    ],
                                                                                                     ),
                                                                                                   ):Text(''),
                                                 ),
                                                // showDiscountedPrice==true?Text('M.R.P ${(product.price)}',style: TextStyle(decoration: TextDecoration.lineThrough),):Text(''),
                                      
                                        ],
                                      )),
                                        onTap: (){
                                            Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Buyobject(product: product,showDiscountedPrice: showDiscountedPrice,)));
                                          },
                                  ),
                                );
                            
                          }) , 
                          separatorBuilder: ((context, index) => SizedBox(height: 15,)), 
                          // initialScrollIndex:leng,
                          itemCount:((products.length)/2).floor() //((images.length)/2).floor()
                          );
                        }
                        return Container(
                              child: Text('sorry No elements found'));
                        }
                      ),
                    )
                ],
              )
            ),
          ),
        ],
      ),
    );
  }

  void getUserData1()async{
    
    String url='https://dummyjson.com/products';
    Uri uri=Uri.parse(url);
    final response= await http.get(uri);
    print(response.statusCode);
    print(response.body);
    if(response.statusCode==200 || response.statusCode==201){
      // final productD=await json.decode(result.body);
      final product= jsonDecode(response.body);
      setState(() {
        products=product["Products"];
        print("number ${products.length}");
      });
      // return Data.fromJson(jsonDecode(result.body));
      // List decodeJson =json.decode(result.body);
      // List<Map<String,dynamic>>productDataList=decodeJson.map((productDataList)=>productDataList as Map<List,dynamic>).toList();
      // productModelList=productDataList.map((product)=>Welcome.fromJson( product)).toList();
    }
    // print(productModelList.length);
    print("number of items ${products}");
  }

Future<void>  fetchShowDiscountedPrice() async {

  // Future<void> fetchRemoteConfig() async {
    final remoteConfig = FirebaseRemoteConfig.instance;
    await remoteConfig.setConfigSettings(RemoteConfigSettings(
      fetchTimeout: Duration(seconds: 10),
      minimumFetchInterval: Duration(hours: 1),
    ));
    await remoteConfig.fetchAndActivate();
    setState(() {
      showDiscountedPrice = remoteConfig.getBool('showDiscountedPrice');
      // _switch=showDiscountedPrice;
    });
  }
  // final RemoteConfig remoteConfig = RemoteConfig.instance;
  // final remoteConfig = FirebaseRemoteConfig.instance;

  // try {
  //   await remoteConfig.setConfigSettings(
  //     RemoteConfigSettings(
  //       fetchTimeout: Duration(seconds: 10),
  //       minimumFetchInterval: Duration(hours: 1),
  //     ),
  //   );
  //   await remoteConfig.fetchAndActivate();
  //   return remoteConfig.getBool('showDiscountedPrice');
  // } catch (e) {
  //   print('Remote Config fetch failed: $e');
  //   return false; // default value in case of an error
  // }
}
