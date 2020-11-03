import 'package:flutter/material.dart';
import 'package:flutter_sample/provider/status_provider.dart';
import 'package:flutter_sample/ui/fine/fine1.dart';
import 'package:flutter_sample/ui/fine/fine2.dart';
import 'package:provider/provider.dart';

class Fine extends StatelessWidget {
  final String title;

  final Color color;

  Fine(this.title, this.color);

  @override
  Widget build(BuildContext context) {
    final statusProvider = Provider.of<StatusProvider>(context);
    return Stack(children: <Widget>[
      Offstage(
        offstage: statusProvider.fineState != 0,
        child: Fine1(title, color),
      ),
      Offstage(
        offstage: statusProvider.fineState != 1,
        child: Fine2(title, color),
      ),
    ]);
  }
}
