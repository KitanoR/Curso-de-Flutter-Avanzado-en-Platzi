import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:platzi_trips_app/User/block/bloc_user.dart';
import 'package:platzi_trips_app/User/model/user.dart';
import 'package:platzi_trips_app/User/ui/widgets/button_bar.dart';
import 'package:platzi_trips_app/User/ui/widgets/user_info.dart';


class ProfileHeader extends StatelessWidget {
  UserBloc userBloc;
  User user;
  @override
  Widget build(BuildContext context) {
    userBloc = BlocProvider.of<UserBloc>(context);

    
    return StreamBuilder(
      stream: userBloc.streamFirebase ,
      builder: (BuildContext context, AsyncSnapshot snapshot){
        switch(snapshot.connectionState){
          case ConnectionState.waiting: 
            return CircularProgressIndicator();
          case ConnectionState.none: 
            return CircularProgressIndicator();
          case ConnectionState.active:
            return showProfuleData(snapshot);
          case ConnectionState.done:
            return showProfuleData(snapshot);
        }
      },
    );

  
  }

   Widget showProfuleData(AsyncSnapshot snapshot){
    if(!snapshot.hasData || snapshot.hasError){
       print('No está logueado');
       return Container(
            margin: EdgeInsets.only(
                left: 20.0,
                right: 20.0,
                top: 50.0
            ),
            child: Column(
              children: <Widget>[
                CircularProgressIndicator(),
                Text("No se pudo cargar la información. Haz login.")
              ],
            ),
          );
    }else {
      print('logueado');
      user = User(name: snapshot.data.displayName, email: snapshot.data.email, photo: snapshot.data.photoUrl);

      final title = Text(
      'Profile',
        style: TextStyle(
            fontFamily: 'Lato',
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 30.0
        ),
      );
      return Container(
            margin: EdgeInsets.only(
                left: 20.0,
                right: 20.0,
                top: 50.0
            ),
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    title
                  ],
                ),
                UserInfo(user),
                ButtonsBar()
              ],
            ),
          );
    }
  }
}