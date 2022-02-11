import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:weather_app/models/page.dart';
import 'package:weather_app/preference.dart';


 CameraPosition _kInitialPosition =
    CameraPosition(target: LatLng(37.3754865, -5.9250989), zoom: 11.0);

    LatLng _lastTap = LatLng(37.3754865, -5.9250989);

class MapClickPage extends GoogleMapExampleAppPage {
  const MapClickPage() : super(const Icon(Icons.mouse), 'Map click');

  @override
  Widget build(BuildContext context) {
    return const _MapClickBody();
  }
}

class _MapClickBody extends StatefulWidget {
  const _MapClickBody();

  @override
  State<StatefulWidget> createState() => _MapClickBodyState();
}

class _MapClickBodyState extends State<_MapClickBody> {
  _MapClickBodyState();

  GoogleMapController? mapController;
  
  LatLng? _lastLongPress;

  coor() async{
    if(PreferenceUtils.getDouble('lat') != null){
      double? lat = PreferenceUtils.getDouble('lat');
      double? lng = PreferenceUtils.getDouble('lng');

      _lastTap = LatLng(lat!, lng!);
      _kInitialPosition = CameraPosition(target: _lastTap , zoom: 5.0);

    }else {
      _kInitialPosition = const CameraPosition(target: LatLng(37.3754865, -5.9250989), zoom: 11.0);
      return _lastTap = const LatLng(37.3754865, -5.9250989);
    }
  }


  @override
  void initState() {
    coor();
    PreferenceUtils.init().whenComplete(() => setState((){}));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final GoogleMap googleMap = GoogleMap(
      mapType:MapType.hybrid,
      onMapCreated: onMapCreated,
      initialCameraPosition: _kInitialPosition,
      onTap: (LatLng pos) async {
        
        setState(() {
          _lastTap = pos;
        });
              PreferenceUtils.setDouble('lat', pos.latitude);
              PreferenceUtils.setDouble('lng', pos.longitude);
      },
      markers: <Marker>{_createMarker()},
      onLongPress: (LatLng pos) {
        setState(() {
          _lastLongPress = pos;
        });
      },
    );

    final List<Widget> columnChildren = <Widget>[
      Padding(
        padding: const EdgeInsets.only(top: 0.0),
        child: Column(
          children: [
            Center(
              child: SizedBox(
                width: MediaQuery.of(context).size.width ,
                height: MediaQuery.of(context).size.height -175 ,
                
                child: googleMap,
    
              ),
              
            ),
            
          ],
        ),
      ),
    ];
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: columnChildren,
    );
  }
  void onMapCreated(GoogleMapController controller) async {
    
    setState(() {
      coor();
      mapController = controller;
    });
    
  }
  Marker _createMarker() {
      return Marker(
        
        markerId: MarkerId("marker_1"),
        position: _lastTap,
      );
  }
}