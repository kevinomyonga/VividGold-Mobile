import 'dart:ui';

import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:vividgold_app/components/horizontal_listview.dart';
import 'package:vividgold_app/components/products.dart';
import 'package:vividgold_app/utils/uiconstants.dart';
import 'package:vividgold_app/utils/themes.dart';

class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List list = ['12', '11'];

  String avatarURL = 'https://avatarfiles.alphacoders.com/149/149117.jpg';
  String firstName = 'Kevin';
  String lastName = 'Omyonga';
  String emailAddress = 'komyonga@gmail.com';

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: new AppBar(
          elevation: 0.1,
          //title: Text(Constants.appName),
          title: new Image.asset(UIConstants.appBarLogo, fit: BoxFit.cover),
          actions: <Widget>[
            new Padding(
              padding: const EdgeInsets.all(10.0),
              child: new Container(
                height: 150.0,
                width: 30.0,
                child: new GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, UIConstants.ROUTE_CART);
                  },
                  child: Stack(
                    children: <Widget>[
                      new IconButton(
                          icon: new Icon(
                            Icons.shopping_cart,
                          ),
                          onPressed: (){
                            Navigator.pushNamed(context, UIConstants.ROUTE_CART);
                          }
                      ),
                      list.length == 0
                          ? new Container()
                          : new Positioned(
                          child: new Stack(
                            children: <Widget>[
                              new Icon(Icons.brightness_1,
                                  size: 20.0, color: UIConstants.cartIconColor),
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
        drawer: _buildDrawer(context),
        body: _buildHomePage(context)
    );
  }

  _buildDrawer(BuildContext context) {

    return new Drawer(
      child: new ListView(
        children: <Widget>[
          // header
          new UserAccountsDrawerHeader(
            accountName: Text(firstName + " " + lastName,
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
            accountEmail: Text(emailAddress,
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
            currentAccountPicture: Container(
              /*child: new CircleAvatar(
                backgroundColor: Colors.grey,
                child: Icon(Icons.person, color: Colors.white,),
              ),*/
              /*decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      fit: BoxFit.fill,
                      image: NetworkImage("https://avatarfiles.alphacoders.com/149/149117.jpg")
                  )
              ),*/
              child: ClipRRect(
                borderRadius: BorderRadius.circular(35),
                child: FadeInImage(
                  fit: BoxFit.fill,
                  placeholder: AssetImage(UIConstants.placeholder),
                  image: NetworkImage(avatarURL),
                ),
              ),
            ),
            decoration: /*new BoxDecoration(
              image: new DecorationImage(
                image: new NetworkImage(avatarURL),
                fit: BoxFit.cover,
              ),*/
            new BoxDecoration(
              gradient: new LinearGradient(
                  colors: [
                    Themes.loginGradientEnd,
                    Themes.loginGradientStart
                  ],
                  begin: const FractionalOffset(0.2, 0.2),
                  end: const FractionalOffset(1.0, 1.0),
                  stops: [0.0, 1.0],
                  tileMode: TileMode.clamp),
            ),
          ),

          // body
          InkWell(
            onTap: (){},
            child: ListTile(
              title: Text(UIConstants.home),
              leading: Icon(Icons.home),
            ),
          ),

          InkWell(
            onTap: (){
              Navigator.pushNamed(context, UIConstants.ROUTE_CATEGORIES);
            },
            child: ListTile(
              title: Text(UIConstants.categories),
              leading: Icon(Icons.dashboard),
            ),
          ),

          InkWell(
            onTap: (){
              Navigator.pushNamed(context, UIConstants.ROUTE_NOTIFICATIONS);
            },
            child: ListTile(
              title: Text(UIConstants.notifications),
              leading: Icon(Icons.notifications),
            ),
          ),

          Divider(),

          InkWell(
            onTap: (){
              Navigator.pushNamed(context, UIConstants.ROUTE_ACCOUNT);
            },
            child: ListTile(
              title: Text(UIConstants.my_account),
              leading: Icon(Icons.person),
            ),
          ),

          InkWell(
            onTap: (){
              Navigator.pushNamed(context, UIConstants.ROUTE_ORDERS);
            },
            child: ListTile(
              title: Text(UIConstants.my_orders),
              leading: Icon(Icons.shopping_basket),
            ),
          ),

          InkWell(
            onTap: (){
              Navigator.pushNamed(context, UIConstants.ROUTE_FAVOURITES);
            },
            child: ListTile(
              title: Text(UIConstants.favourites),
              leading: Icon(Icons.favorite),
            ),
          ),

          Divider(),

          InkWell(
            onTap: (){
              Navigator.pushNamed(context, UIConstants.ROUTE_SETTINGS);
            },
            child: ListTile(
              title: Text(UIConstants.settings),
              leading: Icon(Icons.settings, color: Colors.blue,),
            ),
          ),

          InkWell(
            onTap: (){
              Navigator.pushNamed(context, UIConstants.ROUTE_ABOUT);
            },
            child: ListTile(
              title: Text(UIConstants.about),
              leading: Icon(Icons.info, color: Colors.green),
            ),
          ),
        ],
      ),
    );
  }

  _buildHomePage(BuildContext context) {

    return new ListView(
      children: <Widget>[
        //image carousel begins here
        _buildImageCarousel(context),

        new Container(
          //color: Theme.of(context).primaryColor,
          decoration: new BoxDecoration(
            boxShadow: <BoxShadow>[
              BoxShadow(
                color: Themes.loginGradientStart,
                offset: Offset(1.0, 6.0),
                blurRadius: 20.0,
              ),
              BoxShadow(
                color: Themes.loginGradientEnd,
                offset: Offset(1.0, 6.0),
                blurRadius: 20.0,
              ),
            ],
            gradient: new LinearGradient(
                colors: [
                  Themes.loginGradientEnd,
                  Themes.loginGradientStart
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
                Navigator.pushNamed(context, UIConstants.ROUTE_SEARCH);
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
                  hintText: UIConstants.search_hint1,
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
          child: new Text(UIConstants.categories),),

        //Horizontal list view begins here
        HorizontalList(),

        //padding widget
        new Padding(padding: const EdgeInsets.all(20.0),
          child: new Text(UIConstants.recent_products),),

        //grid view
        Container(
          //height: 320.0,
          child: Products(),
        )
      ],
    );
  }

  _buildImageCarousel(BuildContext context) {
    Widget imageCarousel = new Container(
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

    return imageCarousel;
  }
}
