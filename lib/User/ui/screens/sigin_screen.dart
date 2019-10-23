import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:platzi_trips_app/User/block/bloc_user.dart';
import 'package:platzi_trips_app/User/model/user.dart';
import 'package:platzi_trips_app/platzi_trips_cupertino.dart';
import 'package:platzi_trips_app/widgets/button_green.dart';
import 'package:platzi_trips_app/widgets/gradient_back.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';

class SignInScreen extends StatefulWidget {
  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  UserBloc userBloc;
  double mediawidth;
  @override
  Widget build(BuildContext context) {
    mediawidth = MediaQuery.of(context).size.width;
    userBloc = BlocProvider.of(context);
    return _handleCurretSession (context);
  }
  Widget _handleCurretSession (BuildContext context) {
    return StreamBuilder(
      stream: userBloc.authStatus,
      builder: (BuildContext context, AsyncSnapshot snapshot){
          if(!snapshot.hasData || snapshot.hasError) {
            return singInGoogleUI();
          }else {
            return PlatziTripsCupertino();
          }  

      },
    );
  }
  Widget singInGoogleUI(){
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          GradientBack(height: null,),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Flexible(
                child:  Container(
                  width: mediawidth,
                  child: Text( "Welcome \n this is your travel app",
                    style: TextStyle(
                      fontSize:  37.0,
                      fontFamily: "Lato",
                      color: Colors.white,
                      fontWeight: FontWeight.bold
                    ),),
                ),
              ),
             
                ButtonGreen(text: "Login with Gmail", onPressed: (){
                  userBloc.signOut();
                  userBloc.signIn().then((FirebaseUser user){
                    userBloc.updateUserData(User(
                      uid: user.uid,
                      name: user.displayName,
                      email: user.email,
                      photo: user.photoUrl
                    ));
                  });
                }, width: 300.0, height: 50.0,)
            ],
          )
        ],        
      ),
    );
  }
}