import 'dart:math';

import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:vividgold_app/models/page_view_model.dart';
import 'package:vividgold_app/ui/intro/intro_button.dart';
import 'package:vividgold_app/ui/intro/intro_content.dart';
import 'package:vividgold_app/ui/intro/intro_page.dart';
import 'package:vividgold_app/utils/uiconstants.dart';

const kImageDemo = UIConstants.loginLogo;

class IntroductionPage extends StatefulWidget {
  static const Size kProgressSize = const Size.fromRadius(5.0);
  static const EdgeInsets kDotsSpacing = const EdgeInsets.all(4.0);

  //final List<PageViewModel> pages;

  List<PageViewModel> pages = [
    PageViewModel(
      "First title page",
      "Text of the first page",
      image: new Image(
          height: 175.0,
          fit: BoxFit.contain,
          image: new AssetImage(UIConstants.loginLogo)
      ),
      titleTextStyle: TextStyle(color: Colors.white, fontSize: 28.0, fontWeight: FontWeight.w600),
      bodyTextStyle: TextStyle(color: Colors.white, fontSize: 22.0),
    ),
    PageViewModel(
      "Second title page",
      "Text of the second page, with a button.",
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
      titleTextStyle: TextStyle(color: Colors.white, fontSize: 28.0, fontWeight: FontWeight.w600),
      bodyTextStyle: TextStyle(color: Colors.white, fontSize: 22.0),
    ),
    PageViewModel(
      "Third title page",
      "Text of the third page",
      image: new Image(
          height: 175.0,
          fit: BoxFit.contain,
          image: new AssetImage(UIConstants.loginLogo)
      ),
      titleTextStyle: TextStyle(color: Colors.white, fontSize: 28.0, fontWeight: FontWeight.w600),
      bodyTextStyle: TextStyle(color: Colors.white, fontSize: 22.0),
      progressColor: Colors.red,
      progressSize: Size.fromRadius(8),
    ),
  ];

  final bool showSkipButton = true;
  final VoidCallback onDone = null;
  final VoidCallback onSkip = null;
  final ValueChanged<int> onChange = null;
  final Size progressSizes = kProgressSize;
  final EdgeInsets dotsSpacing = kDotsSpacing;
  final bool isProgress = true;
  final bool freeze = false;
  final Widget next = const Icon(Icons.arrow_forward, color: Colors.white,);
  final Widget done = const Text('DONE', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600));
  final Widget skip = const Text('SKIP', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600));
  final int animationDuration = 350;
  final int initialPage = 0;

  //const IntroductionPage({Key key, this.onDone, this.onSkip, this.onChange}) : super(key: key);

  /*const IntroductionPage({
    Key key,
    @required this.pages,
    @required this.onDone,
    @required this.done,
    this.onSkip,
    this.next,
    this.skip,
    this.showSkipButton = false,
    this.onChange,
    this.progressSizes = kProgressSize,
    this.dotsSpacing = kDotsSpacing,
    this.isProgress = true,
    this.freeze = false,
    this.animationDuration = 350,
    this.initialPage = 0,
  })  : assert(pages != null),
        assert(onDone != null),
        assert(done != null),
        assert((skip != null && showSkipButton) || !showSkipButton),
        super(key: key);*/

  @override
  _IntroductionPageState createState() => _IntroductionPageState();
}

class _IntroductionPageState extends State<IntroductionPage> {
  PageController _pageController;
  int _currentPage = 0;
  bool _isSkipPressed = false;
  bool _isScrolling = false;

  @override
  void initState() {
    super.initState();
    if (widget.pages.length < 1)
      throw Exception("You provide at least one page on introduction screen !");
    _currentPage = min(widget.initialPage, widget.pages.length - 1);
    _pageController = PageController(initialPage: _currentPage);
  }

  List<Widget> _buildPages() {
    return widget.pages.map((page) {
      return IntroPage(
        decoration: page.decoration,
        bgColor: page.pageColor,
        image: page.image,
        content: IntroContent(
          title: page.title,
          body: page.body,
          footer: page.footer,
          titleStyle: page.titleTextStyle,
          bodyStyle: page.bodyTextStyle,
        ),
      );
    }).toList();
  }

  void _onNext() {
    animateScroll(min(_currentPage + 1, widget.pages.length - 1));
  }

  Future<void> _onSkip() async {
    if (widget.onSkip != null) return widget.onSkip();

    setState(() => _isSkipPressed = true);
    await animateScroll(widget.pages.length - 1);
    setState(() => _isSkipPressed = false);
  }

  void _onIntroEnd(context) {
    Navigator.pushNamed(context, UIConstants.ROUTE_HOME);
  }

  Future<void> animateScroll(int page) async {
    setState(() => _isScrolling = true);
    await _pageController.animateToPage(
      page,
      duration: Duration(milliseconds: widget.animationDuration),
      curve: Curves.easeIn,
    );
    setState(() => _isScrolling = false);
  }

  @override
  Widget build(BuildContext context) {
    final isLastPage = (_currentPage == widget.pages.length - 1);
    bool isSkipBtn = (!_isSkipPressed && !isLastPage && widget.showSkipButton);
    final page = widget.pages[_currentPage];

    final skipBtn = Opacity(
      opacity: isSkipBtn ? 1.0 : 0.0,
      child: IntroButton(
          child: widget.skip,
          onPressed: _onSkip
      ),
    );

    final nextBtn = IntroButton(
      child: widget.next,
      onPressed: _isScrolling ? null : _onNext,
    );

    final doneBtn = IntroButton(
      child: widget.done,
      //onPressed: widget.onDone,
      onPressed: () => _onIntroEnd(context),
    );

    return Scaffold(
      body: new Stack(
          children: <Widget>[

            new Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: FadeInImage(
                fit: BoxFit.cover,
                placeholder: AssetImage(UIConstants.placeholder),
                image: AssetImage(UIConstants.intro1),
              ),
            ),

            new Container(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: PageView(
                      controller: _pageController,
                      physics: (widget.freeze)
                          ? const NeverScrollableScrollPhysics()
                          : BouncingScrollPhysics(),
                      children: _buildPages(),
                      onPageChanged: (index) {
                        setState(() => _currentPage = index);
                        if (widget.onChange != null) widget.onChange(index);
                      },
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
                    child: Row(
                      children: [
                        skipBtn,
                        Expanded(
                          child: Center(
                            child: widget.isProgress
                                ? DotsIndicator(
                              numberOfDot: widget.pages.length,
                              position: _currentPage,
                              dotSpacing: widget.dotsSpacing,
                              dotActiveSize: page.progressSize,
                              dotSize: widget.progressSizes,
                              dotActiveColor: page.progressColor,
                            )
                                : const SizedBox(),
                          ),
                          flex: 36,
                        ),
                        isLastPage ? doneBtn : nextBtn,
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ]
      ),
    );
  }
}
