import 'package:flutter/material.dart';
import 'package:flutter_sample/provider/status_provider.dart';
import 'package:flutter_sample/ui/cloud/cloud1.dart';
import 'package:flutter_sample/ui/cloud/cloud2.dart';
import 'package:flutter_sample/ui/cloud/cloud3.dart';
import 'package:provider/provider.dart';

class Cloud extends StatelessWidget {
  final String title;

  final Color color;

  Cloud(this.title, this.color);

  @override
  Widget build(BuildContext context) {
    final statusProvider = Provider.of<StatusProvider>(context);
    return Stack(children: <Widget>[
      Offstage(
        offstage: statusProvider.cloudState != 0,
        child: Cloud1(title, color),
      ),
      Offstage(
        offstage: statusProvider.cloudState != 1,
        child: Cloud2(title, color),
      ),
      Offstage(
        offstage: statusProvider.cloudState != 2,
        child: Cloud3(title, color),
      ),
    ]);
  }
}
