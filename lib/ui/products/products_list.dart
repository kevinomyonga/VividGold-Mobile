import 'package:flutter/material.dart';
import 'package:vividgold_app/components/products.dart';
import 'package:vividgold_app/utils/uiconstants.dart';

class TabItem {
  String title;
  TabItem(this.title);
}

class ProductsListPage extends StatelessWidget {

  List list = ['12', '11'];

  final tabItems = [
    new TabItem('All'),
    new TabItem('PS4 Games'),
    new TabItem('PS4 Consoles & VR'),
    new TabItem('PS4 Accessories'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: tabItems.length,
        child: Scaffold(
          appBar: AppBar(
            elevation: 1.0,
            title: Text("Product List"),
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
                              //Navigator.push(context, MaterialPageRoute(builder: (context)=> CartPage()));
                              Navigator.pushNamed(context, UIConstants.ROUTE_CART);
                            }
                        ),
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
            bottom: TabBar(
                isScrollable: true,
                tabs: List<Widget>.generate(tabItems.length, (int index){
                  return new Tab(text: tabItems[index].title);
                }),
            ),
          ),
          body: TabBarView(
            children: List<Widget>.generate(tabItems.length, (int index){
              return Products();
            })
          ),
          floatingActionButtonLocation:
          FloatingActionButtonLocation.centerDocked,
          floatingActionButton: FloatingActionButton(
            child: const Icon(Icons.filter_list), onPressed: () {},),
          bottomNavigationBar: _buildBottomNavigationBar(context),
        ),
      ),
    );
  }

  _buildBottomNavigationBar(context) {
    return BottomAppBar(
      shape: CircularNotchedRectangle(),
      notchMargin: 4.0,
      child: new Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          IconButton(icon: Icon(Icons.menu), onPressed: () {},),
          IconButton(icon: Icon(Icons.search), onPressed: () {
            _goToSearch(context);
          },),
        ],
      ),
    );
  }

  void _goToSearch(context) {
    Navigator.pushNamed(context, UIConstants.ROUTE_SEARCH);
  }
}
