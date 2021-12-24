import 'package:flutter/material.dart';

class notFound404 extends StatelessWidget {
  const notFound404({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('HATA')),
        backgroundColor: Colors.purple,
      ),
      body: Center(
        child: Container(
          child: Text(
            '404 Not Found',
            style: TextStyle(
              fontSize: 40,
              color: Colors.red,
            ),
          ),
        ),
      ),
    );
  }
}
