import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:introduction_screen/model/page_view_model.dart';
import 'package:vividgold_app/utils/uiconstants.dart';

const kImageDemo = UIConstants.loginLogo;

class IntroPage extends StatefulWidget {

  @override
  _IntroPageState createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {

  final pages = [
    PageViewModel(
      "First title page",
      "Text of the first page",
      image: new Image(
          height: 175.0,
          fit: BoxFit.contain,
          image: new AssetImage(UIConstants.loginLogo)
      ),
    ),
    PageViewModel(
      "Second title page",
      "Text of the second page, with a button",
      image: new Image(
          height: 175.0,
          fit: BoxFit.contain,
          image: new AssetImage(UIConstants.loginLogo)
      ),
      footer: RaisedButton(
        onPressed: () {/* Nothing */},
        child: const Text('Button', style: TextStyle(color: Colors.white)),
        color: Colors.amber,
      ),
    ),
    PageViewModel(
      "Third title page",
      "Text of the third page",
      image: new Image(
          height: 175.0,
          fit: BoxFit.contain,
          image: new AssetImage(UIConstants.loginLogo)
      ),
      titleTextStyle: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w600),
      bodyTextStyle: TextStyle(fontSize: 22.0),
      progressColor: Colors.red,
      progressSize: Size.fromRadius(8),
    ),
  ];

  void _onIntroEnd(context) {
    Navigator.pushNamed(context, UIConstants.ROUTE_HOME);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Introduction',
      home: IntroductionScreen(
        pages: pages,
        onDone: () => _onIntroEnd(context),
        onSkip: () => _onIntroEnd(context),
        showSkipButton: true,
        skip: const Text('Skip'),
        next: const Icon(Icons.arrow_forward),
        done: const Text('Done', style: TextStyle(fontWeight: FontWeight.w600)),
      ),
    );
  }
}
