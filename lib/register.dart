import 'package:e_commerce_app/authentication.dart';
import 'package:e_commerce_app/login.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
// // import 'package:flutter_timetable/db/db_hiveFunc.dart';
// // import 'package:flutter_timetable/db/db_hiveModel.dart';
// import 'package:flutter_timetable/db/db_classD.dart';
// import 'package:flutter_timetable/db/db_model.dart';
// import 'package:flutter_timetable/listClasses.dart';
// import 'package:flutter_timetable/secondMain.dart';
// import 'package:hive_flutter/hive_flutter.dart';

import 'package:shared_preferences/shared_preferences.dart';

//import 'db_functions2.dart';
//import 'db_fundtion3.dart';

class RegisterU extends StatefulWidget {
   RegisterU({super.key});

  @override
  State<RegisterU> createState() => _RegisterUState();
}

class _RegisterUState extends State<RegisterU> {
//String name='Fruits';
final _txte1=TextEditingController();

// final _txte2=TextEditingController();

final _txte3=TextEditingController();

final _txte4 =TextEditingController();

    bool PasswordVisible = false;

 late String name1 ='' ;

    late String password ='';

    late String email='';

    // late String email ='';
//////////////////////////////
Future<SharedPreferences> _prefR = SharedPreferences.getInstance();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( 
                centerTitle: true,title: Text('e-Shop',style: TextStyle(color: Color(0xF704357F),fontWeight:FontWeight.bold,fontSize: 35),),

        actions: [

      ]),
      body: SafeArea(
        child:Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
              //  keyboardType: TextInputType.number,
                controller: _txte1,
                decoration: const InputDecoration(
                  hintText: 'Enter User Name',
                  label: Text('Name'),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10))
                  )
                ),

              ),
              SizedBox(height: 20,),
              TextField(
                controller: _txte4,
                decoration: InputDecoration(
                  hintText: 'Enter Email',
                  label: Text('Email'),
                  border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10)))
                ),
              ),

              SizedBox(height:20),

              // TextField(
              //   keyboardType: TextInputType.datetime,
              //   controller: _txte2,
              //   decoration: const InputDecoration(
              //     label: Text('Date of Birth'),
              //     border: OutlineInputBorder(borderRadius:BorderRadius.all(Radius.circular(10)))
              //   ),
              // ),

              // SizedBox(height: 20,),

              TextField(
                controller: _txte3,
                obscureText: PasswordVisible,
                // keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  suffixIcon: IconButton(onPressed: (){
                    setState(() {
                      
                    PasswordVisible = !PasswordVisible ;
                    });
                  },icon:!PasswordVisible ? Icon(Icons.visibility):Icon(Icons.visibility_off),),
                  hintText: 'Enter a password ',
                  label: Text('Password'),
                  border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10)))
                ),
              ),

              
              SizedBox(height: 20,),


              Flexible(
                child: ElevatedButton(
                  onPressed: (){
                  setState(() {
                    name1=_txte1.text.trim();
                    password=_txte3.text.trim();
                    email=(_txte4.text.trim()).toLowerCase();
                  });
                      // sendDataU2();///////////////////////////
                    if(_txte1.text != '' && _txte3.text != '' && _txte4.text !=''){
                      setSP(name1,password,email);
                    AuthService(email, password,'register',context);
  // //  final user = login(name:name1,password:password, college:_txte4.text.trim());
  // //                     addlog(user).then((value){

  //     setSP(name1,password,email)//,value)
  //     .whenComplete(() {

  //                     Navigator.of(context).pushAndRemoveUntil(
  //                       MaterialPageRoute(builder: ((context) {
  //                         return loginPage();//(id:value);
  //                       }
  //                       ),
  //                       ),
  //                       (route)=>false
  //                     );
  //     }
  //     // ); } 
  //                     );
                    }
              
                  },
                  //  icon: Icon(Icons.sign),
                    // label:
                     child:Text('Sign up')
                    ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                    Text('Already have an account?'),
                    //////////////////////link text on anything/////////////
                  InkWell(
                    child: Text(' Login',style: TextStyle(color: Colors.blue),),
                    onTap: (){
                      Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: ((context) {
                        return loginPage();
                      })),
                      (route)=>false,
                      );
                    },
                  ),
                ],
              )
                  
            ],
          ),
        )
        ),
    );
  }

  // Future<void> sendDataU2() async{
  //    name1 = _txte1.text.trim();
  //    age = _txte2.text.trim();
  //    phone = _txte3.text.trim();
  //    email = _txte4.text.trim();

     

    
  // }
///////////////
  Future setSP(name,password,email) async{
    final SharedPreferences sp = await _prefR;
      // int? id;
  //   final logSea = await Hive.openBox<login>('log');
  // final _values = logSea.get('$name-$password');
  // if(_values != null)
    // sp.setInt('id', id);

      //  id = _values.id;
    sp.setString('password', password);
    sp.setString('name', name);
    sp.setString('email', email);
  }
}