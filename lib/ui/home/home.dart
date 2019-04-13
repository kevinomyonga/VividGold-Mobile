import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:vividgold_app/components/horizontal_listview.dart';
import 'package:vividgold_app/components/products.dart';
import 'package:vividgold_app/ui/account/account.dart';
import 'package:vividgold_app/ui/cart/cart.dart';
import 'package:vividgold_app/ui/settings/help.dart';
import 'package:vividgold_app/ui/items/items.dart';
import 'package:vividgold_app/ui/auth/auth.dart';
import 'package:vividgold_app/ui/orders/order_history.dart';
import 'package:vividgold_app/ui/settings/settings.dart';
import 'package:vividgold_app/utils/colors.dart' as ColorScheme;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    Widget image_carousel = new Container(
      height: 200.0,
      child:  new Carousel(
        boxFit: BoxFit.cover,
        images: [
          NetworkImage('https://vividgold.co.ke/wp-content/uploads/2019/04/days-gone.jpg'),
          NetworkImage('https://vividgold.co.ke/wp-content/uploads/2019/03/apex-legends.jpg'),
          NetworkImage('https://vividgold.co.ke/wp-content/uploads/2019/03/mortal-kombat-11.jpg'),
          NetworkImage('https://vividgold.co.ke/wp-content/uploads/2019/03/fifa-ultimate-team.jpg'),
          NetworkImage('https://vividgold.co.ke/wp-content/uploads/2019/01/game-pass.jpg'),
          NetworkImage('https://vividgold.co.ke/wp-content/uploads/2019/01/gaming-kenya.jpg'),
        ],
        autoplay: true,
        autoplayDuration: Duration(milliseconds: 5000),
        animationCurve: Curves.fastOutSlowIn,
        animationDuration: Duration(milliseconds: 1000),
        dotSize: 4.0,
        indicatorBgPadding: 7.0,
      ),
    );

    return Scaffold(
      appBar: new AppBar(
        elevation: 0.1,
        //backgroundColor: Colors.red,
        //title: Text('VividGold'),
        title: new Image.asset('images/vivid_gold_logo.png', fit: BoxFit.cover),
        actions: <Widget>[
          /*new IconButton(
              icon: Icon(
                Icons.search,
                //color: Colors.white,
              ),
              onPressed: () {}),*/
          new IconButton(
              icon: Icon(
                Icons.shopping_cart,
                //color: Colors.white,
              ),
              onPressed: () {
                Navigator.pushNamed(context, '/cart');
              }
          )
        ],
      ),
      drawer: new Drawer(
        child: new ListView(
          children: <Widget>[
//            header
            new UserAccountsDrawerHeader(
              accountName: Text('Kevin Omyonga',
                style: TextStyle(
                  color: Colors.white,
                  shadows: <Shadow>[
                    Shadow(
                      offset: Offset(10.0, 10.0),
                      blurRadius: 3.0,
                      color: Color.fromARGB(0, 0, 0, 0),
                    ),
                    /*Shadow(
                      offset: Offset(10.0, 10.0),
                      blurRadius: 8.0,
                      color: Color.fromARGB(125, 0, 0, 255),
                    ),*/
                  ],
                ),
              ),
              accountEmail: Text('komyonga@gmail.com',
                style: TextStyle(
                  color: Colors.white,
                  shadows: <Shadow>[
                    Shadow(
                      offset: Offset(10.0, 10.0),
                      blurRadius: 3.0,
                      color: Color.fromARGB(0, 0, 0, 0),
                    ),
                  ],
                ),
              ),
              currentAccountPicture: GestureDetector(
                child: new CircleAvatar(
                  backgroundColor: Colors.grey,
                  child: Icon(Icons.person, color: Colors.white,),
                ),
              ),
              decoration: new BoxDecoration(
                //color: Colors.red,
                image: new DecorationImage(
                  image: new AssetImage("images/m1.jpeg"),
                  fit: BoxFit.cover,
                ),
              ),
            ),

//            body

            InkWell(
              onTap: (){},
              child: ListTile(
                title: Text('Home'),
                leading: Icon(Icons.home),
              ),
            ),

            InkWell(
              onTap: (){
                Navigator.pushNamed(context, '/account');
              },
              child: ListTile(
                title: Text('My account'),
                leading: Icon(Icons.person),
              ),
            ),

            InkWell(
              onTap: (){
                Navigator.pushNamed(context, '/orders');
              },
              child: ListTile(
                title: Text('My Orders'),
                leading: Icon(Icons.shopping_basket),
              ),
            ),

            InkWell(
              onTap: (){
                Navigator.pushNamed(context, '/notifications');
              },
              child: ListTile(
                title: Text('Notifications'),
                leading: Icon(Icons.notifications),
              ),
            ),

            InkWell(
              onTap: (){},
              child: ListTile(
                title: Text('Categories'),
                leading: Icon(Icons.dashboard),
              ),
            ),

            InkWell(
              onTap: (){
                Navigator.pushNamed(context, '/items');
              },
              child: ListTile(
                title: Text('Favourites'),
                leading: Icon(Icons.favorite),
              ),
            ),

            Divider(),

            InkWell(
              onTap: (){
                Navigator.pushNamed(context, '/settings');
              },
              child: ListTile(
                title: Text('Settings'),
                leading: Icon(Icons.settings, color: Colors.blue,),
              ),
            ),

            InkWell(
              onTap: (){
                Navigator.pushNamed(context, '/about');
              },
              child: ListTile(
                title: Text('About'),
                leading: Icon(Icons.info, color: Colors.green),
              ),
            ),
          ],
        ),
      ),

      body: new ListView(
        children: <Widget>[
          //image carousel begins here
          image_carousel,

          new Container(
            //color: Theme.of(context).primaryColor,
            decoration: new BoxDecoration(
              boxShadow: <BoxShadow>[
                BoxShadow(
                  color: ColorScheme.Colors.loginGradientStart,
                  offset: Offset(1.0, 6.0),
                  blurRadius: 20.0,
                ),
                BoxShadow(
                  color: ColorScheme.Colors.loginGradientEnd,
                  offset: Offset(1.0, 6.0),
                  blurRadius: 20.0,
                ),
              ],
              gradient: new LinearGradient(
                  colors: [
                    ColorScheme.Colors.loginGradientEnd,
                    ColorScheme.Colors.loginGradientStart
                  ],
                  begin: const FractionalOffset(0.2, 0.2),
                  end: const FractionalOffset(1.0, 1.0),
                  stops: [0.0, 1.0],
                  tileMode: TileMode.clamp),
            ),
            child: new Padding(
              padding: new EdgeInsets.all(8.0),
              child: new InkWell(
                onTap: (){
                  Navigator.pushNamed(context, '/search');
                },
                child: new TextField(
                  enabled: false,
                  //controller: searchController,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    prefixIcon: Icon(
                      FontAwesomeIcons.search,
                      size: 22.0,
                      color: Colors.grey,
                    ),
                    hintText: 'Search Our Store',
                    hintStyle: TextStyle(
                      color: Colors.grey,
                      fontSize: 17.0,
                      fontWeight: FontWeight.w600,
                    ),
                    contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(32.0)),
                  ),
                ),
              ),
            ),
          ),

          //padding widget
          new Padding(padding: const EdgeInsets.all(20.0),
            child: new Text('Categories'),),

          //Horizontal list view begins here
          HorizontalList(),

          //padding widget
          new Padding(padding: const EdgeInsets.all(20.0),
            child: new Text('Recent products'),),

          //grid view
          Container(
            //height: 320.0,
            child: Products(),
          )
        ],
      ),
    );
  }
}

/*const String _kGalleryAssetsPackage = 'flutter_gallery_assets';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new HomePageState();
// TODO: implement createState

}

class Photo {
  Photo({
    this.assetName,
    this.assetPackage,
    this.title,
    this.caption,
  });

  final String assetName;
  final String assetPackage;
  final String title;
  final String caption;
}

class HomePageState extends State<HomePage> {
  List list = ['12', '11'];

  List<Photo> photos = <Photo>[
    Photo(
      assetName: 'images/veg.jpg',
      title: 'Playstation',
    ),
    Photo(
      assetName: 'images/frozen.jpg',
      title: 'XBOX',
    ),
    Photo(
      assetName: 'images/bev.jpg',
      title: 'Nintendo',
    ),
    Photo(
      assetName: 'images/brand_f.jpg',
      title: 'PC',
    ),
    Photo(
      assetName: 'images/be.jpg',
      title: 'Pre Order',
    ),
    Photo(
      assetName: 'images/home.jpg',
      title: 'Trade In',
    ),
    Photo(
      assetName: 'images/nonveg.jpg',
      title: 'Non Veg',
    ),
    Photo(
      assetName: 'images/eggs.jpg',
      title: 'Dairy, Bakery & Eggs',
    ),
  ];

  final List<String> items = ['Balbhadra', 'Maulik', 'Roshi'];
  static const double height = 366.0;
  String name ='My Wishlist';
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final Orientation orientation = MediaQuery.of(context).orientation;
    final ThemeData theme = Theme.of(context);
    final TextStyle titleStyle =
    theme.textTheme.headline.copyWith(color: Colors.black54);
    final TextStyle descriptionStyle = theme.textTheme.subhead;
    ShapeBorder shapeBorder;


    return Scaffold(
      appBar: new AppBar(
        //backgroundColor: Colors.white,

        title: Text("VividGold"),
        actions: <Widget>[
          IconButton(
            tooltip: 'Search',
            icon: const Icon(Icons.search),
            onPressed: () async {
              final int selected = await showSearch<int>(
                context: context,
                //delegate: _delegate,
              );

            },
          ),
          new Padding(
            padding: const EdgeInsets.all(10.0),
            child: new Container(
              height: 150.0,
              width: 30.0,
              child: new GestureDetector(
                onTap: () {
                  *//*Navigator.of(context).push(
                  new MaterialPageRoute(
                      builder:(BuildContext context) =>
                      new CartItemsScreen()
                  )
              );*//*
                },
                child: Stack(
                  children: <Widget>[
                    new IconButton(
                        icon: new Icon(
                          Icons.shopping_cart,
                          //color: Colors.black,
                        ),
                        onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>CartPage()));
                        }),
                    list.length == 0
                        ? new Container()
                        : new Positioned(
                        child: new Stack(
                          children: <Widget>[
                            new Icon(Icons.brightness_1,
                                size: 20.0, color: Colors.green.shade500),
                            new Positioned(
                                top: 4.0,
                                right: 5.5,
                                child: new Center(
                                  child: new Text(
                                    list.length.toString(),
                                    style: new TextStyle(
                                        color: Colors.white,
                                        fontSize: 11.0,
                                        fontWeight: FontWeight.w500),
                                  ),
                                )),
                          ],
                        )),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
      drawer: new Drawer(
        child: new ListView(
          children: <Widget>[
            new Card(
              child: UserAccountsDrawerHeader(
                accountName: new Text("Naomi A. Schultz"),
                accountEmail: new Text("NaomiASchultz@armyspy.com"),
                onDetailsPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => AccountPage()));
                },
                decoration: new BoxDecoration(
                  backgroundBlendMode: BlendMode.difference,
                  color: Colors.white30,

                  *//* image: new DecorationImage(
               //   image: new ExactAssetImage('assets/images/lake.jpeg'),
                  fit: BoxFit.cover,
                ),*//*
                ),
                currentAccountPicture: CircleAvatar(
                    backgroundImage: NetworkImage(
                        "https://www.fakenamegenerator.com/images/sil-female.png"
                    )
                ),
              ),
            ),
            new Card(
              elevation: 4.0,
              child: new Column(
                children: <Widget>[
                  new ListTile(
                      leading: Icon(Icons.favorite),
                      title: new Text(name),
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> ItemsPage(toolbarname: name,)));
                      }),
                  new Divider(),
                  new ListTile(
                      leading: Icon(Icons.history),
                      title: new Text("Order History"),


                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> OrderHistoryPage(toolbarname: ' Order History',)));
                      }),
                ],
              ),
            ),
            new Card(
              elevation: 4.0,
              child: new Column(
                children: <Widget>[
                  new ListTile(
                      leading: Icon(Icons.settings),
                      title: new Text("Settings"),
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> SettingsPage(toolbarname: 'Setting',)));
                      }),
                  new Divider(),
                  new ListTile(
                      leading: Icon(Icons.help),
                      title: new Text("Help"),
                      onTap: () {

                        Navigator.push(context, MaterialPageRoute(builder: (context)=> HelpPage(toolbarname: 'Help',)));

                      }),
                ],
              ),
            ),
            new Card(
              elevation: 4.0,
              child: new ListTile(
                  leading: Icon(Icons.power_settings_new),
                  title: new Text(
                    "Logout",
                    style:
                    new TextStyle(color: Colors.redAccent, fontSize: 17.0),
                  ),
                  onTap: () {
                    Navigator.push(context,MaterialPageRoute(builder: (context) => AuthPage()));
                  }),
            )
          ],
        ),
      ),
      body: new SingleChildScrollView(
        child: Container(
          child: new Column(children: <Widget>[
            new Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  _verticalD(),
                  new GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> ItemsPage(toolbarname: 'Fruits & Vegetables',)));
                    },
                    child: new Text(
                      'Best value',
                      style: TextStyle(
                          fontSize: 20.0,
                          //color: Colors.black87,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  _verticalD(),
                  new GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> ItemsPage(toolbarname: 'Fruits & Vegetables',)));
                    },
                    child: new Text(
                      'Top sellers',
                      style: TextStyle(
                          fontSize: 20.0,
                          //color: Colors.black26,
                          color: Colors.grey,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  _verticalD(),
                  new Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      new GestureDetector(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=> ItemsPage(toolbarname: 'Fruits & Vegetables',)));
                        },
                        child: new Text(
                          'All',
                          style: TextStyle(
                              fontSize: 20.0,
                              //color: Colors.black26,
                              color: Colors.grey,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      _verticalD(),
                      IconButton(
                        icon: keyloch,
                        //color: Colors.black26,
                      )
                    ],
                  )
                ]),
            new Container(
              height: 188.0,
              margin: EdgeInsets.only(left: 5.0),
              child:
              ListView(scrollDirection: Axis.horizontal, children: <Widget>[
                SafeArea(
                  top: true,
                  bottom: true,
                  child: Container(
                    width: 270.0,

                    child: Card(
                      shape: shapeBorder,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          SizedBox(
                            height: 180.0,
                            child: Stack(
                              children: <Widget>[
                                Positioned.fill(
                                  child: Image.asset(
                                    'images/grthre.jpg',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ],
                            ),
                          )

                          *//*Positioned(
                          bottom: 16.0,
                          left: 16.0,
                          right: 16.0,
                          child: FittedBox(
                            fit: BoxFit.scaleDown,
                            alignment: Alignment.centerLeft,
                            child: Text('',
                              style: titleStyle,
                            ),
                          ),
                        ),*//*
                        ],
                      ),
                    ),
                    // description and share/explore buttons
                    // share, explore buttons
                  ),
                ),
                SafeArea(
                  top: true,
                  bottom: true,
                  child: Container(
                    width: 270.0,

                    child: Card(
                      shape: shapeBorder,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          SizedBox(
                            height: 180.0,
                            child: Stack(
                              children: <Widget>[
                                Positioned.fill(
                                  child: Image.asset(
                                    'images/grtwo.jpg',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ],
                            ),
                          )

                          *//*Positioned(
                          bottom: 16.0,
                          left: 16.0,
                          right: 16.0,
                          child: FittedBox(
                            fit: BoxFit.scaleDown,
                            alignment: Alignment.centerLeft,
                            child: Text('',
                              style: titleStyle,
                            ),
                          ),
                        ),*//*
                        ],
                      ),
                    ),
                    // description and share/explore buttons
                    // share, explore buttons
                  ),
                ),
                SafeArea(
                  top: true,
                  bottom: true,
                  child: Container(
                    width: 270.0,

                    child: Card(
                      shape: shapeBorder,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          SizedBox(
                            height: 180.0,
                            child: Stack(
                              children: <Widget>[
                                Positioned.fill(
                                  child: Image.asset(
                                    'images/groceries.jpg',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ],
                            ),
                          )

                          *//*Positioned(
                          bottom: 16.0,
                          left: 16.0,
                          right: 16.0,
                          child: FittedBox(
                            fit: BoxFit.scaleDown,
                            alignment: Alignment.centerLeft,
                            child: Text('',
                              style: titleStyle,
                            ),
                          ),
                        ),*//*
                        ],
                      ),
                    ),
                    // description and share/explore buttons
                    // share, explore buttons
                  ),
                ),
                SafeArea(
                  top: true,
                  bottom: true,
                  child: Container(
                    width: 270.0,

                    child: Card(
                      shape: shapeBorder,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          SizedBox(
                            height: 180.0,
                            child: Stack(
                              children: <Widget>[
                                Positioned.fill(
                                  child: Image.asset(
                                    'images/back.jpg',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ],
                            ),
                          )

                          *//*Positioned(
                          bottom: 16.0,
                          left: 16.0,
                          right: 16.0,
                          child: FittedBox(
                            fit: BoxFit.scaleDown,
                            alignment: Alignment.centerLeft,
                            child: Text('',
                              style: titleStyle,
                            ),
                          ),
                        ),*//*
                        ],
                      ),
                    ),
                    // description and share/explore buttons
                    // share, explore buttons
                  ),
                ),
              ]),
            ),
            new Container(
              margin: EdgeInsets.only(top: 7.0),
              child: new Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    _verticalD(),
                    new GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> ItemsPage(toolbarname: 'Fruits & Vegetables',)));
                      },
                      child: new Text(
                        'Categories',
                        style: TextStyle(
                            fontSize: 20.0,
                            //color: Colors.black87,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    _verticalD(),
                    new GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> ItemsPage(toolbarname: 'Fruits & Vegetables',)));
                      },
                      child: new Text(
                        'Popular',
                        style: TextStyle(
                            fontSize: 20.0,
                            //color: Colors.black26,
                            color: Colors.grey,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    _verticalD(),
                    new Row(
                      children: <Widget>[
                        new GestureDetector(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context)=> ItemsPage(toolbarname: 'Fruits & Vegetables',)));
                          },
                          child: new Text(
                            'Whats New',
                            style: TextStyle(
                                fontSize: 20.0,
                                //color: Colors.black26,
                                color: Colors.grey,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    )
                  ]),
            ),
            new Container(
              alignment: Alignment.topCenter,
              height: 700.0,

              child: new GridView.builder(
                  itemCount: photos.length,
                  primary: false,
                  physics: NeverScrollableScrollPhysics(),
                  padding: const EdgeInsets.all(10.0),
                  gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
                  itemBuilder: (BuildContext context, int index) {
                    return new GestureDetector(
                        onTap: (){

                          Navigator.push(context, MaterialPageRoute(builder: (context)=> ItemsPage(toolbarname: 'Fruits & Vegetables',)));
                        },

                        child: new Container(
                            margin: EdgeInsets.all(5.0),
                            child: new Card(
                              shape: shapeBorder,
                              elevation: 3.0,
                              child: new Container(
                                //  mainAxisSize: MainAxisSize.max,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    SizedBox(
                                      height: 152.0,
                                      child: Stack(
                                        children: <Widget>[
                                          Positioned.fill(
                                              child: Image.asset(
                                                photos[index].assetName,
                                                fit: BoxFit.cover,
                                              )),
                                          Container(
                                            color: Colors.black38,
                                          ),
                                          Container(
                                            //margin: EdgeInsets.only(left: 10.0),
                                            padding: EdgeInsets.only(
                                                left: 3.0, bottom: 3.0),
                                            alignment: Alignment.bottomLeft,
                                            child: new GestureDetector(
                                              onTap: () {
                                                Navigator.push(context, MaterialPageRoute(builder: (context)=> ItemsPage(toolbarname: 'Fruits & Vegetables',)));
                                              },
                                              child: new Text(
                                                photos[index].title,
                                                style: TextStyle(
                                                    fontSize: 18.0,
                                                    color: Colors.white,
                                                    fontWeight:
                                                    FontWeight.bold),
                                              ),
                                            ),
                                          ),

                                          *//*Positioned(
                                    child: FittedBox(
                                     fit: BoxFit.fill,
                                      alignment: Alignment.centerLeft,
                                      child: Text(photos[index].title,
                                        style: TextStyle(color: Colors.black87,fontSize: 15.0),
                                      ),
                                  )
                                  )*//*
                                        ],
                                      ),
                                    ),

                                    // new Text(photos[index].title.toString()),
                                  ],
                                ),
                              ),
                            )
                        )

                    );
                  }),
            )
          ]),
        ),
      ),
    );
  }

*//*
  new Container(
  alignment: Alignment.topCenter,
  child: GridView.count(
  primary: true,
  crossAxisCount: 2,
  childAspectRatio: 0.80,
  children: List.generate(photos.length, (index) {
  return getStructuredGridCell(photos[index]);
  }),
  ))*//*
  Icon keyloch = new Icon(
    Icons.arrow_forward,
    //color: Colors.black26,
  );

  _verticalD() => Container(
    margin: EdgeInsets.only(left: 5.0, right: 0.0, top: 5.0, bottom: 0.0),
  );


}*/
