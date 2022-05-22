import 'package:flutter/material.dart';
import 'dart:async';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';

class Transit extends StatefulWidget {
  const Transit({Key? key}) : super(key: key);

  @override
  _TransitState createState() => _TransitState();
}
class _TransitState extends State<Transit> {
  late Position _currentPosition;
  //const transit({Key? key}) : super(key: key);
  late GoogleMapController _googleMapController;
  @override
  void dispose(){
   _googleMapController.dispose();
   // super.dispose();
  }
   
  _getCurrentLocation() {
    Geolocator
      .getCurrentPosition(desiredAccuracy: LocationAccuracy.best, forceAndroidLocationManager: true)
      .then((Position position) {
        setState(() {
          _currentPosition = position;
        });
      }).catchError((e) {
        print(e);
      });
  }
  /*void _onMapCreated(GoogleMapController controller) {
    mapController = controller;

    final marker = Marker(
      markerId: MarkerId('place_name'),
      position: LatLng(9.669111, 80.014007),
      // icon: BitmapDescriptor.,
      infoWindow: InfoWindow(
        title: 'title',
        snippet: 'address',
      ),
    );

    setState(() {
      markers[MarkerId('place_name')] = marker;
    });
  } */
  var lat1 = -1.3151808023973;
  var long1 =  36.806520049636;
  void _onMapCreated(GoogleMapController controller) {
    //mapController = controller;

    final marker = Marker(
      markerId: MarkerId('Kiplandia'),
      position: LatLng(lat1, long1),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
       
      infoWindow: InfoWindow(
        title: 'title',
        snippet: 'address',
      ),
    );

    /*setState(() {
      //markers[MarkerId('place_name')] = marker;
    });*/
  }
  @override
  Widget build(BuildContext context) {
    
    //final lat1 = 
    return Scaffold(
      body:Center(
        child:Card(
          color: Colors.grey.shade900,
          child:Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children:[
              ListTile(),
              ListTile(title:Text("Start transit stream",style:TextStyle(fontWeight: FontWeight.bold,color:Colors.white),textAlign: TextAlign.center,)),
              ListTile(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children:[
                  InkWell(child:Text("Start",style:TextStyle(fontWeight: FontWeight.bold,color:Colors.green)),onTap:(){}),
                  ]),

            ]
          )
        )
      )
    );/*Scaffold(
      extendBodyBehindAppBar: true,//i like this
      backgroundColor:Colors.transparent,
      appBar:AppBar(
       centerTitle: true,
        title:_currentPosition != null?Chip(avatar:Icon(Icons.timer_outlined,color:Colors.deepPurple),label:Text( _currentPosition.toString(),style:TextStyle(color:Colors.deepPurple)),backgroundColor:Colors.yellow,):Text(""),
        elevation:0.0,
        backgroundColor:Colors.transparent,
        actions:[
         FloatingActionButton(
           mini:true,
           onPressed:(){
             _getCurrentLocation();
           },
           child:Center(
             child:Icon(Icons.person)
           ),
         )
        ]
      ),
      body: Center(
        child: GoogleMap(
        mapType: MapType.hybrid,
         initialCameraPosition: CameraPosition( target: LatLng(lat1, long1),
    zoom: 17.4746,),
    
        onMapCreated: (GoogleMapController controller) => _googleMapController = controller,
        markers:{
          

        }
      ),
      
      ),
      //floatingActionButtonPosition:FloatingActionButtonPosition.center,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: ()=> _googleMapController.animateCamera(
          CameraUpdate.newCameraPosition(CameraPosition(
             target: LatLng(-2.3151808023973, 37.806520049636),
    zoom: 17.4746,
          ))
         
        ),
        label: Text('Bus Location'),
        icon: Icon(Icons.directions_bus),
      ),
    );*/
  }
   Future<void> _goToTheLake() async {
    
}
}