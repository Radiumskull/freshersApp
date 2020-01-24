import 'package:flutter/material.dart';

class ChartBarR extends StatelessWidget {
  double scoreperc;

  ChartBarR({this.scoreperc});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text("  "),
        SizedBox(
          height: 20,
        ),
        Container(
          height: 200,
          width: 40,
          child: Stack(
            alignment: AlignmentDirectional.bottomEnd,
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black45, width: 1),
                    color: Color.fromRGBO(225,173,109,0),
                    borderRadius: BorderRadius.circular(20)),
              ),
              FractionallySizedBox(
                heightFactor: scoreperc,
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black45, width: 1),
                      color: Color.fromRGBO(34,47,91,1),
                      borderRadius: BorderRadius.circular(20)),
                ),
              )
            ],
          ),
        ),
        SizedBox(
          height: 4,
        ),
        Text("Ravenclaw",
                  style: TextStyle(color: Colors.black, fontSize: 18,fontWeight: FontWeight.bold,),),
      ],
    );
  }
}
