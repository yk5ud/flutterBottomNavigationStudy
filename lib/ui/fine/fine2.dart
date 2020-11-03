import 'package:flutter/material.dart';
import 'package:flutter_sample/provider/status_provider.dart';
import 'package:provider/provider.dart';

class Fine2 extends StatelessWidget {
  final String title;

  final Color color;

  Fine2(this.title, this.color);

  @override
  Widget build(BuildContext context) {
    final statusProvider = Provider.of<StatusProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: color,
        title: Text(title),
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [Text("Fine2")],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 100,
                  child: RaisedButton(
                    child: const Text('back'),
                    color: Colors.white,
                    textColor: Colors.deepOrange,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(color: Colors.deepOrange),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    onPressed: () {
                      statusProvider.setBackFineState();
                    },
                  ),
                ),
                SizedBox(
                  width: 100,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
