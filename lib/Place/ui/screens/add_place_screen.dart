import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:platzi_trips_app/Place/model/place.dart';
import 'package:platzi_trips_app/Place/ui/widgets/card_image.dart';
import 'package:platzi_trips_app/Place/ui/widgets/title_input_location.dart';
import 'package:platzi_trips_app/User/block/bloc_user.dart';
import 'package:platzi_trips_app/widgets/button_purple.dart';
import 'package:platzi_trips_app/widgets/gradient_back.dart';
import 'package:platzi_trips_app/widgets/text_input.dart';
import 'package:platzi_trips_app/widgets/title_header.dart';

class AddPlaceScreen extends StatefulWidget {
  File image;
  AddPlaceScreen({Key key, this.image});
  @override
  _AddPlaceScreenState createState() => _AddPlaceScreenState();
}

class _AddPlaceScreenState extends State<AddPlaceScreen> {

  @override
  Widget build(BuildContext context) {

    UserBloc userBloc = BlocProvider.of<UserBloc>(context);
        double screenWidht = MediaQuery.of(context).size.width;
    final _controllerTitlePlace = TextEditingController();
    final _controllerDescriptionPlace = TextEditingController();
    return Scaffold(
        body: Stack(
          children: <Widget>[
            GradientBack(height: 300,),
            Row(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(top: 25.0, left: 5.0),
                  child: SizedBox(
                    height: 45.0,
                    width: 45.0,
                    child: IconButton(
                      icon:  Icon(Icons.keyboard_arrow_left, color: Colors.white, size: 45,),
                      onPressed: (){
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ),
                Flexible(
                  child: Container(
                    padding: EdgeInsets.only(top: 45.0, left: 20.0, right: 10.0),
                    width: screenWidht,
                    child: TitleHeader(title: "Add a new Place",),
                  ),
                ),

              ],
            ),

            Container(
              margin: EdgeInsets.only(top: 120, bottom: 20),
              child: ListView(
                children: <Widget>[
                  Container(
                    alignment: Alignment.center,
                    child: CardImageWithFabIcon(
                          pathImage: widget.image.path, 
                          iconData: Icons.favorite_border,
                          width: 300.0,
                          height: 250.0,
                          left: 0,),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20, bottom: 20),
                    child: TextInput(
                      hintText: "Title",
                      inputType: null,
                      maxLines: 1,
                      controller: _controllerTitlePlace,
                    ),
                  ),
                  TextInput(
                    hintText: "Descripción",
                    inputType: TextInputType.multiline,
                    maxLines: 4,
                    controller: _controllerDescriptionPlace,
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    child: TextInputLocation(
                      hintText: "Add Location",
                      iconData: Icons.location_on,
                      
                    ),
                  ),

                  Container(
                    width: 70.0,
                    child: ButtonPurple(
                      buttonText: "Add place",
                      onPressed: () {
                        //Firebase Store
                        //id usuario
                        userBloc.currentUser.then((FirebaseUser user) {
                          if(user != null){
                            //url
                            //Cloud Firestore
                            
                          }
                        });
                        
                        //Place - title, descripción, url
                        userBloc.updatePlaceData(Place(
                          name: _controllerTitlePlace.text,
                          description: _controllerDescriptionPlace.text,
                          likes: 0
                        )).whenComplete((){
                          print("Termin´o");
                          Navigator.pop(context);
                        });
                      },
                    ),
                  )
                ],
              ),
            )
          ],
        ),
    );
  }
}