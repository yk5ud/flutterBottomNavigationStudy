import 'package:flutter/material.dart';
import 'package:flutter_sample/provider/status_provider.dart';
import 'package:provider/provider.dart';

class Fine1 extends StatelessWidget {
  final String title;

  final Color color;

  Fine1(this.title, this.color);

  @override
  Widget build(BuildContext context) {
    final statusProvider = Provider.of<StatusProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: color,
        title: Text(title),
      ),
      backgroundColor: Colors.white,
      body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [Text("Fine1")],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 100,
                ),
                SizedBox(
                  width: 100,
                  child: RaisedButton(
                    child: const Text('next'),
                    color: color,
                    textColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    onPressed: () {
                      statusProvider.setNextFineState();
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
    );
  }
}
