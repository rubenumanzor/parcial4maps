import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:maps_launcher/maps_launcher.dart';

class MovilSVApp extends StatefulWidget {
  MovilSVApp({Key? key}) : super(key: key);

  @override
  State<MovilSVApp> createState() => _MovilSVAppState();
}

class _MovilSVAppState extends State<MovilSVApp> {
  //Direcciones de las sucursales
  final List<Map<String, dynamic>> clityList = const [
    {
      "address": "Central de servidores MovilSV",
      "id": "SV-SALM",
      "image":
          "https://upload.wikimedia.org/wikipedia/commons/thumb/3/37/Monumento_al_Salvador_del_Mundo_1.jpg/1024px-Monumento_al_Salvador_del_Mundo_1.jpg",
      "lat": 13.700947,
      "lng": -89.222945,
      "name": "Sucursal MovilSV - Salvador del Mundo",
      "phone": "23013141",
      "region": "Area Central"
    },
    {
      "address": "Servidores Occidental MovilSV",
      "id": "SV-CARCE",
      "image":
          "https://upload.wikimedia.org/wikipedia/commons/thumb/d/d7/Ciudad_Arce_Central_y_Alcaldia_2012.jpg/1024px-Ciudad_Arce_Central_y_Alcaldia_2012.jpg",
      "lat": 13.8506564,
      "lng": -89.4519801,
      "name": "Sucursal MovilSV - Arce",
      "phone": "23013449",
      "region": "Area Occidental"
    },
    {
      "address": "Servidores Central 3 MovilSV",
      "id": "SV-CSOYA",
      "image":
          "https://upload.wikimedia.org/wikipedia/commons/thumb/c/c3/Soyapango.jpg/800px-Soyapango.jpg",
      "lat": 13.691116,
      "lng": -89.138054,
      "name": "Sucursal MovilSV - Centro de Soyapango",
      "phone": "20913449",
      "region": "Area Central"
    },
    {
      "address": "Servidores Central 2 MovilSV",
      "id": "SV-SJAC",
      "image":
          "https://upload.wikimedia.org/wikipedia/commons/thumb/0/0e/Cerro_San_Jacinto.JPG/800px-Cerro_San_Jacinto.JPG",
      "lat": 13.688108,
      "lng": -89.190322,
      "name": "Sucursal MovilSV - San Jacinto",
      "phone": "60913449",
      "region": "Area Central"
    }
  ];

  final Map<String, Marker> _sucursales = {};

  Future<void> _onMapCreated(GoogleMapController controller) async {
    _sucursales.clear();
    setState(() {
      for (int i = 0; i < clityList.length; i++) {
        print("For Loop");
        final marker = Marker(
          markerId: MarkerId(clityList[i]['id']),
          position: LatLng(clityList[i]['lat'], clityList[i]['lng']),
          infoWindow: InfoWindow(
              title: clityList[i]['name'],
              snippet: clityList[i]['address'],
              onTap: () {
                print("${clityList[i]['lat']}, ${clityList[i]['lng']}");
                launchMap(clityList[i]['lat'], clityList[i]['lng']);
              }),
          onTap: () {
            print("Ha hecho clic en la sucursal");
          },
        );
        print("${clityList[i]['lat']}, ${clityList[i]['lng']}");
        _sucursales[clityList[i]['name']] = marker;
      }
    });
  }

  launchMap(lat, long) {
    MapsLauncher.launchCoordinates(lat, long);
  }

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      onMapCreated: _onMapCreated,
      initialCameraPosition: CameraPosition(
        target: LatLng(clityList[0]['lat'], clityList[0]['lng']),
        zoom: 8.8,
      ),
      markers: _sucursales.values.toSet(),
    );
  }
}
