import 'package:flutter/material.dart';
import 'package:flutter_sample/provider/status_provider.dart';
import 'package:flutter_sample/ui/rain/rain1.dart';
import 'package:flutter_sample/ui/rain/rain2.dart';
import 'package:flutter_sample/ui/rain/rain3.dart';
import 'package:flutter_sample/ui/rain/rain4.dart';
import 'package:provider/provider.dart';

class Rain extends StatelessWidget {
  final String title;

  final Color color;

  Rain(this.title, this.color);

  @override
  Widget build(BuildContext context) {
    final statusProvider = Provider.of<StatusProvider>(context);
    return Stack(children: <Widget>[
      Offstage(
        offstage: statusProvider.rainState != 0,
        child: Rain1(title, color),
      ),
      Offstage(
        offstage: statusProvider.rainState != 1,
        child: Rain2(title, color),
      ),
      Offstage(
        offstage: statusProvider.rainState != 2,
        child: Rain3(title, color),
      ),
      Offstage(
        offstage: statusProvider.rainState != 3,
        child: Rain4(title, color),
      ),
    ]);
  }
}
