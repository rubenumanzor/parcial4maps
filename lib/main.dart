/*
   PARCIAL 4 ETPS3-I
   Integrantes
      Umanzor Giron Ruben Alexander	        25-6554-2014
      Orellana Hernandez Mauricio Ernesto   25-5919-2014
*/

import 'package:flutter/material.dart';
import 'package:maps_launcher/maps_launcher.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:parcial4maps/movilsv.dart';

void main() {
  runApp(MovilSV());
}

class MovilSV extends StatelessWidget {
  const MovilSV({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Parcial 4 MovilSV',
      home: MovilSVApp(),
    );
  }
}
