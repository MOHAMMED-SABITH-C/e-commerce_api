import 'package:e_commerce_app/forgotPass.dart';
import 'package:e_commerce_app/json_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:rich_readmore/rich_readmore.dart';
// import 'package:flutter_application_2/3rddb/db_fundtion3.dart';
// import 'package:flutter_application_2/Users/cart/db_functionC.dart';
// import 'package:flutter_application_2/db/functions/db_functions.dart';
// import 'package:flutter_application_2/list.dart';
// import 'package:flutter_application_2/model/data_model.dart';
// import 'package:flutter_application_2/seconddb/db_functions2.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tap_to_expand/tap_to_expand.dart';

// import 'Buy.dart';

class Buyobject extends StatefulWidget {
   Buyobject({super.key,required this.product,required this.showDiscountedPrice});

// late String image;
// late String name='';
// late String table; 
// late String type;
//  late int limit;
  // late String warranty;
  final bool showDiscountedPrice;
  final product;

  @override
  State<Buyobject> createState() => _BuyobjectState();
}

class _BuyobjectState extends State<Buyobject> {

Future<SharedPreferences> _pref = SharedPreferences.getInstance();
final actionTextStyle =
    TextStyle(color: Colors.blue[900], fontWeight: FontWeight.bold);
late String phone='';
late String name='';
 int _itemCount=1;
 List<Review> review=[];
 late String tag='';
 late double price0=widget.showDiscountedPrice==true? ((widget.product.price)*(1-(widget.product.discountPercentage)/100)):widget.product.price;
late String price=price0.toString();
 late String count='';
//  late String image = widget.image;
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    review=widget.product.reviews;
    // print(widget.product.tags.length.toString()+'#fkjfdskjsdj');
    for(int i=0;i<(widget.product.tags.length);i++){
      setState(() {
        
      tag=tag+'#${widget.product.tags[i]} ';
      // print('heloo #${widget.product.tags[i]}  '+tag);
      });
                                      } 
  }
   @override
  Widget build(BuildContext context) {

     return Scaffold(
                              //Text('')
    appBar: AppBar(
      backgroundColor:Color(0xF704357F) ,
        centerTitle: true,title: Text('e-Shop',style: TextStyle(color: Colors.white,fontWeight:FontWeight.bold,fontSize: 35),),),

      // backgroundColor: Color(0xF704357F),title:  Text('e-shop',style:TextStyle(color:Colors.white)),actions: []),
      //actions: [IconButton(onPressed: (){
      //     //signout(context);
      //     Navigator.of(context).pushAndRemoveUntil(
      //       MaterialPageRoute(
      //         builder: (context)=>listcreation0(
      //           type: widget.table,)
      //         ),
      //         (route)=>false
      //       );
      //   }, icon:Icon(Icons.exit_to_app))
      //],
                           //       print(data);
      body: SingleChildScrollView(//SafeArea( 
                             // return //Center(
                               child:
                                 Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(height: 350,
                                    // child:Image(width:10,height: 50,image:// )
                                    child:Center(child: Image.network("${widget.product.thumbnail}"))
                                    // backgroundImage:lib/images/acer.jpeg
                                    // child:Image(image:AssetImage("${widget.product.thumbnail}") ),
                                    ),
                                   // Padding(
                                     // padding: const EdgeInsets.only(left: 0),
                                      //child: 
                                   //   Column( 
                                     // children:[ 
                                        Center(
                                          child: Text(widget.product.title,
                                          style: TextStyle(fontSize: 45,color: Colors.black,fontWeight: FontWeight.bold),),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(left:8.0,right: 8),
                                          child: RichReadMoreText.fromString(
                                                text:
                                                    '${widget.product.description}',
                                                textStyle: TextStyle(
                                                    color: Colors.blueGrey, fontWeight: FontWeight.bold),
                                                settings: LengthModeSettings(
                                                  trimLength: 50,
                                                  trimCollapsedText: '...Show more',
                                                  trimExpandedText: ' Show less',
                                                  lessStyle: actionTextStyle,
                                                  moreStyle: actionTextStyle,
                                                  
                                                ),
                                              ),
                                        ),
              
                                      
                                       Padding(
                                         padding: const EdgeInsets.only(left:8.0),
                                         child: Text(tag),
                                       ), 
                                      // SizedBox(height: 8,),
                                      Padding(
                                        padding: const EdgeInsets.only(left:0.0),
                                        child: widget.showDiscountedPrice==true?Image.asset('disc.png',height: 30,width: 80,):Text(''),
                                      ),
                                     Row(
                                      mainAxisAlignment :MainAxisAlignment.spaceBetween,
                                      children: [
                                   //SizedBox(width: 60),
                                      Flexible(

                                        child: Padding(
                                          padding: const EdgeInsets.only(left: 20),
                                          child: Text('\$${(_itemCount*(price0)).toStringAsFixed(2)}',
                                          style: TextStyle(
                                            fontSize: 25,color: Color.fromARGB(250, 15, 0, 0),
                                            fontWeight: FontWeight.bold),)
                                          // :Text((_itemCount*(widget.product.price)).toString(),
                                          // style: TextStyle(
                                          //   fontSize: 25,color: Color.fromARGB(100, 15, 0, 0),
                                          //   fontWeight: FontWeight.bold),),
                                        ),
                                      ),
                                  // SizedBox(width: 120),
                                      Flexible(
                                        child: Padding(
                                          padding: const EdgeInsets.only(right: 10),
                                          child: Container(
                                            
                                                                margin: EdgeInsets.symmetric(horizontal: 3),
                                                          width: 84,
                                                          padding: EdgeInsets.all(3),
                                                          decoration: BoxDecoration(
                                                            
                                                              borderRadius: BorderRadius.circular(5),
                                                              color:Color.fromARGB(255, 197, 144, 9)), //Theme.of(context).accentColor),
                                                          child: Row(
                                                            children: [
                                                              InkWell(
                                                                  onTap: () {
                                                                    setState(() {
                                                                      if(_itemCount > 1 )
                                                                        {_itemCount--;
                                                                        count = (widget.product.stock- _itemCount).toString();
                                                          price = (_itemCount*(price0)).toString();
                                                                        }
                                                                    });
                                                                  },
                                                                  child: Icon(
                                                                    Icons.remove,
                                                                    color: Colors.white,
                                                                    size: 16,
                                                                  )),
                                                              Container(
                                                                width: 40,
                                                                margin: EdgeInsets.symmetric(horizontal: 3),
                                                                padding:
                                                                    EdgeInsets.symmetric(horizontal: 3, vertical: 2),
                                                                decoration: BoxDecoration(
                                                                    borderRadius: BorderRadius.circular(3),
                                                                    color: Colors.white),
                                                                child: Text(_itemCount.toString(),
                                                                  style: TextStyle(color: Colors.black, fontSize: 16),
                                                                ),
                                                              ),
                                                              InkWell(
                                                                  onTap: () {
                                                                    //print(widget.limit);
                                                                    setState(() {
                                                                      if(_itemCount < widget.product.stock)
                                                                        {_itemCount++;
                                                             count = (widget.product.stock - _itemCount).toString();
                                                          price = (_itemCount*(price0)).toString();
                                                                        }
                                                                  });
                                                                  },
                                                                  child: Icon(
                                                                    Icons.add,
                                                                    color: Colors.white,
                                                                    size: 16,
                                                                  )),
                                                            ],
                                                          ),
                                                        ),
                                        ),
                                      ),
                                     ],),
                                      Padding(
                                                   padding: const EdgeInsets.only(left:18.0),
                                                   child: widget.showDiscountedPrice==true?RichText(
                                                                                                     text: TextSpan(
                                                    text: 'M.R.P ',
                                                    style: TextStyle(fontWeight: FontWeight.bold,fontSize: 10,color: const Color.fromARGB(255, 53, 49, 49)),//
                                                    children:  <TextSpan>[
                                                      TextSpan(text:' ${(widget.product.price.toString())}',
                                                       style: TextStyle(decoration: TextDecoration.lineThrough,fontWeight: FontWeight.normal)),
                                                    ],
                                                                                                     ),
                                                                                                   ):Text(''),
                                                 ),

                                     // ]
                                     // ),
                                    //),

                                    SizedBox(height: 30,),
                                     Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [

                                       ElevatedButton(onPressed: (){
                                        print(widget.product.title+'byproduct');
                                       
                                        Navigator.of(context).push(
                                          MaterialPageRoute(builder: ((context) {
                                            return forgotPass();
                                        // BuyLog(from: 'buy',table:widget.table,image:widget.image,name:widget.name,price:price,count: _itemCount.toString(),Ccount:count,type: '2nd',list: list,);
                                          }))
                                        );
                                       }, 
                                       child: Text('\n    Buy    \n')),
                                      ElevatedButton.icon(onPressed: (){
                                        getData();
                                        print(name);
                                        //  print(_itemCount);
                                        // final objects = CartModel(price: price, count: _itemCount.toString(), objName: widget.name, phone: widget.phone)
                                      }, icon: Icon(Icons.shopping_cart), label:Text('Add\nto\ncart'))
                                      ],

                                     ),
                                     ExpansionTile(
          title: Text('Ratings & Reviews'),
          subtitle: Text('Tap to see !'),
          children: <Widget>[
            ListTile(title: Text(review[0].reviewerName),
            leading: CircleAvatar(backgroundColor: const Color.fromARGB(255, 101, 97, 97),
            child: Row(mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(review[0].rating.toString()),
                Image.asset('starpng.png',height: 13,width: 13,)
              ],
            ),),
            subtitle: Text(review[0].comment),
            ),
            ListTile(title: Text(review[1].reviewerName),
            leading: CircleAvatar(backgroundColor: const Color.fromARGB(255, 101, 97, 97),
            child: Row(mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(review[1].rating.toString()),
                Image.asset('starpng.png',height: 13,width: 13,)
              ],
            ),),
            subtitle: Text(review[1].comment),
            ),
            ListTile(title: Text(review[2].reviewerName),
            leading: CircleAvatar(backgroundColor: const Color.fromARGB(255, 101, 97, 97),
            child: Row(mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(review[2].rating.toString()),
                Image.asset('starpng.png',height: 13,width: 13,)
              ],
            ),),
            subtitle: Text(review[2].comment),
            ),
          ],),
                //                       TapToExpandLetter(
                // // autoClose: false, default is true
                // title: const Text(
                //   'Reviews',
                //   style: TextStyle(
                //       color: Colors.white,
                //       fontSize: 16,
                //       fontWeight: FontWeight.w600),
                // ),
                // content: Column(
                //   children:  [
                //     Text(review[0].comment,
                //       style: TextStyle(
                //         color: const Color.fromARGB(255, 104, 39, 39),
                //         fontSize: 18,
                //         fontWeight: FontWeight.w400,
                //       ),
                //     ),
                //     Text(review[1].comment),
                //     Text(review[2].comment)
                //     // Image.asset(
                //     //   'assets/image_ex.png',
                //     //   width: 150,
                //     //   height: 150,
                //     // ),
                //   ],
                // ),
                // centerWidget: const Icon(
                //   Icons.expand_less_rounded,
                //   size: 20,
                // ))
          
                                    //  Container(
                                    //   child: Text('Reviews'),
                                    //  )
                                  ],
                               // ),
                              ),
      ),
                  ); 
  }

  Future<void> getData()async{
    // String ph='';
    // String na='';
    final SharedPreferences sp = await _pref;

    setState(() {
    // final 
    //  ph 
      // = ph;
     phone= sp.getString('phone')??'';
      //final
      //  na
       name= sp.getString('name')??'';
        // =na; 

      print(price+'hm');
    });
      // print(ph+'pinne'+na);
      // final obj = await CartModel(table: widget.table,price: price,image: image,ogPrice: widget.price,lim: (widget.limit).toString(),count: _itemCount.toString(),objName: widget.name,phone: phone);
      // addToCart1(obj);
      // getcart(phone);
  }
}