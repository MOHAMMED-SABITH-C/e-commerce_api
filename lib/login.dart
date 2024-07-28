

import 'package:e_commerce_app/authentication.dart';
import 'package:e_commerce_app/forgotPass.dart';
import 'package:e_commerce_app/register.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:shared_preferences/shared_preferences.dart';

class loginPage extends StatefulWidget {
  const loginPage({super.key});

  @override
  State<loginPage> createState() => _loginState();
}

class _loginState extends State<loginPage> {
    bool PasswordVisible = false;
    late String password ;
    // late String name1;
    late String email;
  void initState(){
    super.initState();
    PasswordVisible = false;
  }

Future<SharedPreferences> _prefR = SharedPreferences.getInstance();

  // final _userName =TextEditingController();
  final _email = TextEditingController();
  final _password = TextEditingController();
  @override
  Widget build(BuildContext context) {
var Mheight = MediaQuery.of(context).size.height*0.68;
var Mwidth = MediaQuery.of(context).size.width*0.84;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,title: Text('e-Shop',style: TextStyle(color: Color(0xF704357F),fontWeight:FontWeight.bold,fontSize: 35),),),

      body: Center(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(30)),
          color: Colors.grey.withOpacity(0.5),
          ),
          height:Mheight ,
          width: Mwidth,
          child:Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Padding(
              //   padding: const EdgeInsets.all(20.0),
              //   child: TextFormField(
              //     controller:_userName ,
              //     decoration: InputDecoration(
              //       prefixIcon: Icon(Icons.person),
              //       label: Text('USER NAME'),
              //       border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(13)))
              //     ),
              //   ),
              // ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: TextFormField(
                  controller:_email ,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.email_rounded),
                    label: Text('Email'),
                    border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(13)))
                  ),
                ),
              ),
////////////////////////////password hiding////////////////////
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: TextFormField(
                  obscureText: PasswordVisible,
                  controller: _password,

                  decoration: InputDecoration(
                  suffixIcon:IconButton(onPressed: (){
                    setState(() {
                      PasswordVisible = !PasswordVisible;
                      
                    });
                  }, icon: Icon(!PasswordVisible ? Icons.visibility :Icons.visibility_off )),
                    prefixIcon: Icon(Icons.lock),
                    label: Text('Password'),
                    border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(13)))
                  ),
                ),
              ),
              // SizedBox(height: 50),
              GestureDetector(
                onTap: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>forgotPass()));
                },
              child:Text('Forgot password?',style: TextStyle(color: Colors.blue),)
              ),
              SizedBox(height: 20,),
              ElevatedButton(    
                    //////////////////button shadow//////////////////////
                style:ElevatedButton.styleFrom( backgroundColor: Color(0xF704357F),
                  shadowColor: Color.fromARGB(0, 0, 0, 0),
                  elevation: 10,
                    side: BorderSide(color: Color.fromARGB(255, 57, 19, 71)),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)
                  )
                  ////////////////////////////////
                // ButtonStyle(shape: MaterialStateProperty.all(
                  // RoundedRectangleBorder(
                  //   borderRadius: BorderRadius.circular(50),
                    
                  // Shadow(color: Colors.black),
                  // ),
                // )
                ),
                  
                // )
                
                onPressed: (){

                  sendData(context);
                  if(_email.text == '' || _password.text == '')
                  {
                      // setSp(password,email);

                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  behavior:SnackBarBehavior.floating,
                  backgroundColor: Colors.cyan,
                  margin:EdgeInsets.all(10),
                  content: Text("Please Enter Password or Email",style: TextStyle(color: Colors.red),)
                  )
                          );
                      }
                // Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>ListClasses()));
              }, child:Text('Login',style: TextStyle(color: Colors.white),) ),
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                    Text('Not a member?'),
                    //////////////////////link text on anything/////////////
                  InkWell(
                    child: Text(' Register now',style: TextStyle(color: Colors.blue),),
                    onTap: (){
                      Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: ((context) {
                        return RegisterU();
                      })),
                      (route)=>false,
                      );
                    },
                  ),
                ],
              )

            ],
          ) 
        
        ),
      ),
    );
  }

  sendData(BuildContext context) async{
    //  name1 = _userName.text.trim();
    email = _email.text.trim();
     password = _password.text.trim();


  //////////////////////validity check
  if( password.isNotEmpty && email.isNotEmpty){
    AuthService(email,password,'sign',context);
    
  }
    final SharedPreferences sp = await _prefR;

     sp.setString('paswword', password);
    // sp.setString('name', name);
    sp.setString('email', email);
  }

  // }
}