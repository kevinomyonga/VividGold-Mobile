import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:vividgold_app/ui/about/about_app.dart';
import 'package:vividgold_app/ui/about/about_store.dart';
import 'package:vividgold_app/utils/themes.dart';
import 'package:vividgold_app/utils/uicolors.dart';
import 'package:vividgold_app/utils/uiconstants.dart';

class AboutPage extends StatefulWidget {

  @override
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {

  ScrollController scrollController;
  var headerImageHeight = 260.0;

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    scrollController = new ScrollController();
    scrollController.addListener(() => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {

    var flexibleSpaceWidget = new SliverAppBar(
      expandedHeight: 200.0,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        //centerTitle: true,
          title: Text(
            UIConstants.about,
          ),
          background: new Stack(
              children: <Widget>[

                new Container(
                  width: MediaQuery.of(context).size.width,
                  height: headerImageHeight,
                  child: Image.asset(
                    UIConstants.loginLogo,
                  ),
                ),

                new Container(
                  height: headerImageHeight,
                  /*decoration: new BoxDecoration(
                    image: new DecorationImage(
                      image: NetworkImage("https://avatarfiles.alphacoders.com/149/149117.jpg"),
                      fit: BoxFit.cover,
                    ),
                  ),*/
                  child: new BackdropFilter(
                    filter: new ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                    child: new Container(
                      decoration: new BoxDecoration(color: Colors.white.withOpacity(0.0)),
                    ),
                  ),
                ),

                new Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[

                    new Container(
                        alignment: Alignment.topCenter,
                        child: Container(
                          width: 120.0,
                          height: 120.0,
                          margin: const EdgeInsets.all(10.0),
                          decoration: new BoxDecoration(
                            //shape: BoxShape.circle,
                            //color: Colors.grey,
                            image: new DecorationImage(
                              image: new ExactAssetImage(UIConstants.loginLogo),
                              fit: BoxFit.contain,
                            ),
                          ),
                        )
                    ),
                  ],
                ),
              ]
          )
      ),
    );

    return Scaffold(
      body: new DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            elevation: 1.0,
            title: Text(UIConstants.about,),
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(72.0),
              child: Card(
                margin: new EdgeInsets.all(0.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(0.0),
                ),
                child: TabBar(
                  labelColor: UIColors.tabsSelectedLabelColor,
                  //labelColor: UIColors.tabsLabelThemeColor(context),
                  unselectedLabelColor: UIColors.tabsUnselectedLabelColor,
                  tabs: [
                    Tab(
                      icon: Icon(Icons.store),
                      text: UIConstants.store_name,
                    ),
                    Tab(
                        icon: Icon(Icons.phone_iphone),
                        text: UIConstants.the_app
                    ),
                  ],
                ),
              ),
            ),
          ),
          body: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height >= 955.0
                ? MediaQuery.of(context).size.height
                : 955.0,
            decoration: new BoxDecoration(
              gradient: new LinearGradient(
                  colors: [
                    Themes.loginGradientStart,
                    Themes.loginGradientEnd
                  ],
                  begin: const FractionalOffset(0.0, 0.0),
                  end: const FractionalOffset(1.0, 1.0),
                  stops: [0.0, 1.0],
                  tileMode: TileMode.clamp),
            ),
            child: new TabBarView(
              children: <Widget>[
                new AboutStoreTabPage(),
                new AboutAppTabPage(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  final TabBar _tabBar;

  _SliverAppBarDelegate(this._tabBar);

  @override
  double get minExtent => _tabBar.preferredSize.height;

  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return new Card(
      margin: new EdgeInsets.all(0.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(0.0),
      ),
      child: _tabBar,
    );
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return false;
  }
}
