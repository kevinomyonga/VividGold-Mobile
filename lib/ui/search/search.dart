import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:vividgold_app/components/products.dart';
import 'package:vividgold_app/utils/uicolors.dart';
import 'package:vividgold_app/utils/uiconstants.dart';

class SearchPage extends StatefulWidget {

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {

  final TextEditingController _controller = new TextEditingController();
  List<dynamic> _list;
  bool _isSearching;
  String _searchText = "";
  List searchresult = new List();

  _SearchPageState() {
    _controller.addListener(() {
      if (_controller.text.isEmpty) {
        setState(() {
          _isSearching = false;
          _searchText = "";
        });
      } else {
        setState(() {
          _isSearching = true;
          _searchText = _controller.text;
        });
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _isSearching = false;
    values();
  }

  void values() {
    _list = List();
    _list.add("Spiderman PS4");
    _list.add("Last Of Us");
    _list.add("Resident Evil");
    _list.add("Detroit Become Human");
    _list.add("Playstation 4 Pro");
    _list.add("XBox One X");
    _list.add("Nintendo Switch");
    _list.add("Batman Arkham Knight");
    _list.add("Sonic The Hedgehog");
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: new AppBar(
          elevation: 1.0,
          title: Text(UIConstants.search),
        ),

        body: _buildSearchPage(context)
    );
  }

  _buildSearchPage(BuildContext context) {
    return Column(
      children: <Widget>[

        _buildSearchField(context),

        _buildSearchResults(),
      ],
    );
  }

  _buildSearchField(BuildContext context) {
    return new Container(
      color: UIColors.primaryColor,
      child: new Padding(
        padding: new EdgeInsets.all(8.0),
        child: Card(
          margin: new EdgeInsets.all(0.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(32.0),
          ),
          child: new TextField(
            controller: _controller,
            decoration: InputDecoration(
              filled: true,
              //fillColor: UIColors.searchFieldColor,
              prefixIcon: Icon(
                FontAwesomeIcons.search,
                size: 22.0,
                color: UIColors.searchPrefixIconColor,
              ),
              hintText: UIConstants.search_hint2,
              hintStyle: TextStyle(
                color: UIColors.searchFieldHintTextColor,
                fontSize: 17.0,
                fontWeight: FontWeight.w600,
              ),
              contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(32.0)),
            ),
            onChanged: searchOperation,
          ),
        ),
      ),
    );
  }

  _buildSearchResults() {

    final resultsList = new ListView.builder(
      shrinkWrap: true,
      itemCount: searchresult.length,
      itemBuilder: (BuildContext context, int index) {
        String listData = searchresult[index];
        return new ListTile(
          title: new Text(listData.toString()),
        );
      },
    );

    return SingleChildScrollView(
      child: Container(
        child: Column(
          children: <Widget>[

            // Check if a search query has been specified
            _searchText.length != 0 || _searchText.isNotEmpty ?
            (
                // Check if search results have been found
                searchresult.length != 0 || searchresult.isNotEmpty //|| _controller.text.isNotEmpty
                ? resultsList : _buildNoResultsView()
            )
                : _buildEmptyView(),
          ],
        ),
      ),
    );
  }

  _buildNoResultsView() {

    return new Container(
      constraints: const BoxConstraints(maxHeight: 500.0),
      child: new SingleChildScrollView(
        padding: const EdgeInsets.all(8.0),
        child: new Center(
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Container(
                    margin: new EdgeInsets.only(top: 00.0, bottom: 0.0),
                    height: 150.0,
                    width: 150.0,
                    child: new Icon(FontAwesomeIcons.bookOpen)
                ),
                new Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: new Text(
                    "No Results",
                    style: new TextStyle(fontSize: 24.0,),
                  ),
                ),
                new Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: new Text(
                    "We did not find anything for \"$_searchText\". Try something else.",
                    style: new TextStyle(fontSize: 14.0,),
                  ),
                ),
              ],
            )
        ),
      ),
    );
  }

  _buildEmptyView() {
    return new Container(
      constraints: const BoxConstraints(maxHeight: 500.0),
      child: new SingleChildScrollView(
        padding: const EdgeInsets.all(8.0),
        child: new Center(
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Container(
                    margin: new EdgeInsets.only(top: 00.0, bottom: 0.0),
                    height: 150.0,
                    width: 150.0,
                    child: new Icon(FontAwesomeIcons.bookOpen)
                ),
                new Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: new Text(
                    "Give me where to stand and I will move the earth....",
                    style: new TextStyle(fontSize: 14.0,),
                  ),
                ),
              ],
            )
        ),
      ),
    );
  }

  void _handleSearchStart() {
    setState(() {
      _isSearching = true;
    });
  }

  void _handleSearchEnd() {
    setState(() {
      _isSearching = false;
      _controller.clear();
    });
  }

  void searchOperation(String searchText) {
    searchresult.clear();
    if (_isSearching != null) {
      for (int i = 0; i < _list.length; i++) {
        String data = _list[i];
        if (data.toLowerCase().contains(searchText.toLowerCase())) {
          searchresult.add(data);
        }
      }
    }
  }
}
