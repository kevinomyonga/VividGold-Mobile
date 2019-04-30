import 'package:flutter/material.dart';
import 'package:vividgold_app/ui/account/account.dart';
import 'package:vividgold_app/ui/categories/categories.dart';
import 'package:vividgold_app/ui/favourites/favourites.dart';
import 'package:vividgold_app/ui/home/home.dart';
import 'package:vividgold_app/ui/notifications/notifications.dart';
import 'package:vividgold_app/ui/orders/order_history.dart';
import 'package:vividgold_app/utils/themes.dart';
import 'package:vividgold_app/utils/uicolors.dart';
import 'package:vividgold_app/utils/uiconstants.dart';

class DrawerItem {
  String title;
  IconData icon;
  DrawerItem(this.title, this.icon);
}

class LandingPage extends StatefulWidget {

  final drawerItems = [
    new DrawerItem(UIConstants.home, Icons.home),
    new DrawerItem(UIConstants.categories, Icons.dashboard),
    new DrawerItem(UIConstants.notifications, Icons.notifications),
    new DrawerItem(UIConstants.my_account, Icons.person),
    new DrawerItem(UIConstants.my_orders, Icons.shopping_basket),
    new DrawerItem(UIConstants.favourites, Icons.favorite),
  ];

  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {

  List list = ['12', '11'];

  String avatarURL = 'https://avatarfiles.alphacoders.com/149/149117.jpg';
  String firstName = 'Kevin';
  String lastName = 'Omyonga';
  String emailAddress = 'komyonga@gmail.com';

  int _selectedDrawerIndex = 0;

  _getDrawerItemWidget(int pos) {
    switch (pos) {
      case 0:
        return new HomePage();
      case 1:
        return new CategoriesPage();
      case 2:
        return new NotificationsPage();
      case 3:
        return new AccountPage();
      case 4:
        return new OrdersPage();
      case 5:
        return new FavouritesPage();

      default:
        return new Text("Error");
    }
  }

  _onSelectItem(int index) {
    setState(() => _selectedDrawerIndex = index);
    Navigator.of(context).pop(); // close the drawer
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: new AppBar(
        elevation: 1.0,
        // here we display the title corresponding to the fragment
        // you can instead choose to have a static title
        title: new Text(_selectedDrawerIndex != 0 ? widget.drawerItems[_selectedDrawerIndex].title : UIConstants.appName),
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
                                size: 20.0, color: UIColors.cartIconColor),
                            new Positioned(
                                top: 4.0,
                                right: 5.5,
                                child: new Center(
                                  child: new Text(
                                    list.length.toString(),
                                    style: new TextStyle(
                                        color: Colors.white,
                                        fontSize: 11.0,
                                        fontWeight: FontWeight.w500
                                    ),
                                  ),
                                )
                            ),
                          ],
                        )
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
      drawer: _buildDrawer(context),
      body: _getDrawerItemWidget(_selectedDrawerIndex),
    );
  }

  _buildDrawer(BuildContext context) {

    var drawerOptions = <Widget>[];
    for (var i = 0; i < widget.drawerItems.length; i++) {
      var d = widget.drawerItems[i];
      drawerOptions.add(
        /*new ListTile(
            leading: new Icon(d.icon),
            title: new Text(d.title),
            selected: i == _selectedDrawerIndex,
            onTap: () => _onSelectItem(i),
          ),*/
        new InkWell(
          onTap: () => _onSelectItem(i),
          child: ListTile(
            title: Text(d.title),
            selected: i == _selectedDrawerIndex,
            leading: new Icon(d.icon),
          ),
        ),
      );
      if (i == 2 || i == 5) {
        drawerOptions.add(Divider());
      }
    }

    return new Drawer(
      child: Column(
          children: <Widget>[
            Expanded(
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
                  new Column(children: drawerOptions),

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
            ),
            Divider(height: 0.0,),
            InkWell(
              onTap: (){
              },
              child: ListTile(
                title: new Center(
                    child: new Text("v1.0.0",
                      style: new TextStyle(
                        fontSize: 17.0,
                        fontWeight: FontWeight.w500,
                      ),
                    )
                ),
                subtitle: new Center(
                    child: new Text(
                      UIConstants.store_slogan,
                    )
                ),

              ),
            ),
          ]
      ),
    );
  }
}
