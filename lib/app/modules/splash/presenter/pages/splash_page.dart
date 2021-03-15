import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'components/ioasys/ioasys_widget.dart';

class SplashPage extends StatefulWidget {
  final String title;
  SplashPage({Key? key, this.title = "Splash"}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 3)).then(
      (value) => Modular.to.navigate('/login'),
    );
  }

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Color(0xFF8325BB),
              Color(0xFFAF1A7D),
              Color(0xFFCB2E6C),
              Color(0xFFDE94BC),
            ],
          ),
        ),
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Center(
                child: Padding(
                  padding: EdgeInsets.only(top: screenHeight * 0.50),
                  child: IoasysWidget(
                    size: screenHeight * 0.11,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
