import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:vividgold_app/utils/uicolors.dart';
import 'package:vividgold_app/utils/uiconstants.dart';

class AccountPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => AccountPageState();
}

class AccountPageState extends State<AccountPage> {

  var headerImageHeight = 260.0;

  String avatarURL = 'https://avatarfiles.alphacoders.com/149/149117.jpg';
  String firstName = 'Kevin';
  String lastName = 'Omyonga';
  String emailAddress = 'komyonga@gmail.com';
  String phoneNumber = '410-422-9171';

  final formKey = GlobalKey<FormState>();

  bool _autoValidate = false;

  @override
  Widget build(BuildContext context) {

    return new Scaffold(
        body: _buildAccountPage(context)
    );
  }

  Icon ofericon = new Icon(
    Icons.edit,
  );
  Icon keyLock = new Icon(
    Icons.vpn_key,
  );
  Icon clear = new Icon(
    Icons.history,
  );
  Icon logout = new Icon(
    Icons.do_not_disturb_on,
  );
  Icon deactivateAccount = new Icon(
    Icons.close,
  );
  Icon menu = new Icon(
    Icons.more_vert,
  );

  bool checkboxValueA = true;
  bool checkboxValueB = false;
  bool checkboxValueC = false;

  _buildAccountPage(BuildContext context) {

    return new Container(
        child: SingleChildScrollView(
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              textDirection: TextDirection.ltr,
              children: <Widget>[
                _profileHeader(),
                _profileInfo(),
                _profileAddresses(),
                _profileActions()
              ],
            )
        )
    );
  }

  _profileHeader() => Container(
      margin: EdgeInsets.all(7.0),
      alignment: Alignment.topCenter,
      height: headerImageHeight,
      child: new Card(
          elevation: 3.0,
          child: new Stack(
              children: <Widget>[

                new Container(
                  width: MediaQuery.of(context).size.width,
                  height: headerImageHeight,
                  child: FadeInImage(
                    fit: BoxFit.cover,
                    placeholder: AssetImage(UIConstants.placeholder),
                    image: NetworkImage(avatarURL),
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
                          // padding: const EdgeInsets.all(3.0),
                          /*child: CircleAvatar(
                            radius: 40.0,
                            backgroundImage: NetworkImage(avatarURL),
                          ),*/
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(60),
                            child: FadeInImage(
                              fit: BoxFit.fill,
                              placeholder: AssetImage(UIConstants.placeholder),
                              image: NetworkImage(avatarURL),
                            ),
                          ),
                        )
                    ),

                    new OutlineButton(
                        borderSide: BorderSide(color: UIColors.primaryColor),
                        child: const Text('Change'),
                        textColor: UIColors.primaryColor,
                        onPressed: () {
                          //Navigator.pushNamed(context, UIConstants.ROUTE_CATEGORIES);
                        },
                        shape: new OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        )
                    ),
                    // VerticalDivider(),
                  ],
                ),
              ]
          ),
      )
  );

  _profileInfo() => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        new Container(
          margin: EdgeInsets.only(left: 12.0, top: 5.0, right: 0.0, bottom: 5.0),
          child: new Text(
            'Info',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18.0),
          ),
        ),
        new Container(
          margin: EdgeInsets.all(7.0),
          alignment: Alignment.topCenter,
          child: new Card(
              elevation: 3.0,
              child: Form(
                  key: formKey,
                  autovalidate: _autoValidate,
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[

                          TextFormField(
                            controller: TextEditingController(text: firstName),
                            decoration: const InputDecoration(
                              border: UnderlineInputBorder(
                                borderSide: BorderSide(style: BorderStyle.solid),
                              ),
                              focusedBorder:  UnderlineInputBorder(
                                borderSide: BorderSide(style: BorderStyle.solid),
                              ),
                              icon: Icon(
                                Icons.person,
                              ),
                              hintText: 'Enter First Name',
                              labelText: 'First Name',
                              //labelStyle: TextStyle(color: Colors.black54)
                            ),
                            keyboardType: TextInputType.text,
                            validator: (val) =>
                            val.length < 1 ? 'Enter First name' : null,
                            //onSaved: (val) => _firstname = val,
                          ),
                          const SizedBox(height: 24.0),
                          TextFormField(
                            controller: TextEditingController(text: lastName),
                            decoration: const InputDecoration(
                              border: UnderlineInputBorder(
                                borderSide: BorderSide(style: BorderStyle.solid),
                              ),
                              focusedBorder:  UnderlineInputBorder(
                                borderSide: BorderSide(style: BorderStyle.solid),
                              ),
                              icon: Icon(
                                Icons.perm_identity,
                              ),
                              hintText: 'Enter Last Name',
                              labelText: 'Last Name',
                              //labelStyle: TextStyle(color: Colors.black54)
                            ),
                            keyboardType: TextInputType.text,
                            validator: (val) =>
                            val.length < 1 ? 'Enter Last Name' : null,
                            //onSaved: (val) => _lastname = val,
                          ),
                          const SizedBox(height: 24.0),
                          TextFormField(
                            controller: TextEditingController(text: emailAddress),
                            decoration: const InputDecoration(
                              border: UnderlineInputBorder(
                                borderSide: BorderSide(style: BorderStyle.solid),
                              ),
                              focusedBorder:  UnderlineInputBorder(
                                borderSide: BorderSide(style: BorderStyle.solid),
                              ),
                              icon: Icon(
                                Icons.email,
                              ),
                              hintText: 'Your Email Address',
                              labelText: 'E-mail',
                              //labelStyle: TextStyle(color: Colors.black54)
                            ),
                            keyboardType: TextInputType.emailAddress,
                            //validator: validateEmail,
                            onSaved: (String val) {
                              //_email = val;
                            },
                          ),

                          const SizedBox(height: 24.0),
                          TextFormField(
                            controller: TextEditingController(text: phoneNumber),
                            decoration: const InputDecoration(
                              border: UnderlineInputBorder(
                                borderSide: BorderSide(style: BorderStyle.solid),
                              ),
                              focusedBorder:  UnderlineInputBorder(
                                borderSide: BorderSide(style: BorderStyle.solid),
                              ),
                              icon: Icon(
                                Icons.phone_android,
                              ),
                              hintText: 'Your Phone Number',
                              labelText: 'Phone',
                              //labelStyle: TextStyle(color: Colors.black54)
                            ),
                            keyboardType: TextInputType.phone,
                            //validator: validateMobile,
                            onSaved: (String val) {
                              //_phone = val;
                            },
                          ),
                          const SizedBox(height: 24.0),
                          /*SizedBox(height: 35.0,),
                          new Container(
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: <Widget>[

                                new Container(
                                  alignment: Alignment.bottomRight,
                                  child: new GestureDetector(
                                    onTap: (){
                                      _submit();
                                    },
                                    child: Text('SIGNUP',style: TextStyle(
                                        color: Colors.orange,fontSize: 20.0,fontWeight: FontWeight.bold
                                    ),),
                                  ),
                                ),
                              ],
                            ),
                          ),*/
                        ]
                    ),
                  )
              )
          ),
        )
      ]
  );

  _profileAddresses() => Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        new Container(
          margin:
          EdgeInsets.only(left: 12.0, top: 5.0, right: 0.0, bottom: 5.0),
          child: new Text(
            'Addresses',
            style: TextStyle(
              //color: Colors.black87,
                fontWeight: FontWeight.bold,
                fontSize: 18.0),
          ),
        ),
        new Container(
            height: 165.0,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                Container(
                  height: 165.0,
                  width: 165.0,
                  child: InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, UIConstants.ROUTE_ADDRESSES);
                    },
                    child: Card(
                      elevation: 3.0,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          new Container(
                              alignment: Alignment.center,
                              child: IconButton(
                                  icon: Icon(Icons.add), onPressed: null)),
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 165.0,
                  width: 230.0,
                  margin: EdgeInsets.all(7.0),
                  child: Card(
                    elevation: 3.0,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,

                      children: <Widget>[
                        new Column(

                          children: <Widget>[
                            new Container(
                              margin:
                              EdgeInsets.only(left: 12.0, top: 5.0, right: 0.0, bottom: 5.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,

                                children: <Widget>[
                                  new Text(
                                    'Naomi A. Schultz',
                                    style: TextStyle(
                                      //color: Colors.black87,
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 0.5,
                                    ),
                                  ),
                                  _verticalDivider(),
                                  new Text(
                                    '2585 Columbia Boulevard',
                                    style: TextStyle(
                                      //color: Colors.black45,
                                        fontSize: 13.0,
                                        letterSpacing: 0.5),
                                  ),
                                  _verticalDivider(),
                                  new Text(
                                    'Salisbury',
                                    style: TextStyle(
                                      //color: Colors.black45,
                                        fontSize: 13.0,
                                        letterSpacing: 0.5),
                                  ),
                                  _verticalDivider(),
                                  new Text(
                                    ' MD 21801',
                                    style: TextStyle(
                                      //color: Colors.black45,
                                        fontSize: 13.0,
                                        letterSpacing: 0.5),
                                  ),

                                  new Container(
                                    margin: EdgeInsets.only(left: 00.0,top: 05.0,right: 0.0,bottom: 5.0),
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: <Widget>[
                                        new Text(
                                          'Delivery Address',
                                          style: TextStyle(
                                            fontSize: 15.0,
                                            //color: Colors.black26,
                                          ),

                                        ),
                                        _verticalD(),

                                        new Checkbox(
                                          value: checkboxValueA,
                                          onChanged: (bool value) {
                                            setState(() {
                                              checkboxValueA = value;
                                            });
                                          },
                                        ),
                                      ],
                                    ),

                                  )

                                ],
                              ),
                            ),

                          ],
                        ),
                        new Container(
                          alignment: Alignment.topLeft,
                          child: IconButton(
                              icon: menu,
                              //color: Colors.black38,
                              onPressed: null),
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  height: 130.0,
                  width: 230.0,
                  margin: EdgeInsets.all(7.0),
                  child: Card(
                    elevation: 3.0,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,

                      children: <Widget>[
                        new Column(


                          children: <Widget>[
                            new Container(
                              margin:
                              EdgeInsets.only(left: 12.0, top: 5.0, right: 0.0, bottom: 5.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,

                                children: <Widget>[
                                  new Text(
                                    'Bradford R. Butler',
                                    style: TextStyle(
                                      //color: Colors.black87,
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 0.5,
                                    ),
                                  ),
                                  _verticalDivider(),
                                  new Text(
                                    '4528 Filbert Street',
                                    style: TextStyle(
                                      //color: Colors.black45,
                                        fontSize: 13.0,
                                        letterSpacing: 0.5),
                                  ),
                                  _verticalDivider(),
                                  new Text(
                                    'Philadelphia',
                                    style: TextStyle(
                                      //color: Colors.black45,
                                        fontSize: 13.0,
                                        letterSpacing: 0.5),
                                  ),
                                  _verticalDivider(),
                                  new Text(
                                    ' PA 19103',
                                    style: TextStyle(
                                      //color: Colors.black45,
                                        fontSize: 13.0,
                                        letterSpacing: 0.5),
                                  ),
                                  new Container(
                                    margin: EdgeInsets.only(left: 00.0,top: 05.0,right: 0.0,bottom: 5.0),
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: <Widget>[
                                        new Text(
                                          'Delivery Address',
                                          style: TextStyle(
                                            fontSize: 15.0,
                                            //color: Colors.black12,
                                          ),

                                        ),
                                        _verticalD(),

                                        new Checkbox(
                                          value: checkboxValueB,
                                          onChanged: (bool value) {
                                            setState(() {
                                              checkboxValueB = value;
                                            });
                                          },
                                        ),
                                      ],
                                    ),

                                  )
                                ],
                              ),
                            ),

                          ],
                        ),
                        new Container(
                          alignment: Alignment.topLeft,
                          child: IconButton(
                              icon: menu,
                              //color: Colors.black38,
                              onPressed: null),
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  height: 130.0,
                  width: 230.0,
                  margin: EdgeInsets.all(7.0),
                  child: Card(
                    elevation: 3.0,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,

                      children: <Widget>[
                        new Column(


                          children: <Widget>[
                            new Container(
                              margin:
                              EdgeInsets.only(left: 12.0, top: 5.0, right: 0.0, bottom: 5.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,

                                children: <Widget>[
                                  new Text(
                                    'Elizabeth J. Schmidt',
                                    style: TextStyle(
                                      //color: Colors.black87,
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 0.5,
                                    ),
                                  ),
                                  _verticalDivider(),
                                  new Text(
                                    '3674 Oakway Lane',
                                    style: TextStyle(
                                      //color: Colors.black45,
                                        fontSize: 13.0,
                                        letterSpacing: 0.5),
                                  ),
                                  _verticalDivider(),
                                  new Text(
                                    'Long Beach',
                                    style: TextStyle(
                                      //color: Colors.black45,
                                        fontSize: 13.0,
                                        letterSpacing: 0.5),
                                  ),
                                  _verticalDivider(),
                                  new Text(
                                    'CA 90802',
                                    style: TextStyle(
                                      //color: Colors.black45,
                                        fontSize: 13.0,
                                        letterSpacing: 0.5),
                                  ),
                                  new Container(
                                    margin: EdgeInsets.only(left: 00.0,top: 05.0,right: 0.0,bottom: 5.0),
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: <Widget>[
                                        new Text(
                                          'Delivery Address',
                                          style: TextStyle(
                                            fontSize: 15.0,
                                            //color: Colors.black12,
                                          ),

                                        ),
                                        _verticalD(),

                                        new Checkbox(
                                          value: checkboxValueC,
                                          onChanged: (bool value) {
                                            setState(() {
                                              checkboxValueC = value;
                                            });
                                          },
                                        ),
                                      ],
                                    ),

                                  )
                                ],
                              ),
                            ),
                            _profileActions(),
                          ],
                        ),
                        new Container(
                          alignment: Alignment.topLeft,
                          child: IconButton(
                              icon: menu,
                              //color: Colors.black38,
                              onPressed: null),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            )
        )
      ]
  );

  _profileActions() => Column(
      children: <Widget>[
        new Container(
          margin: EdgeInsets.all(7.0),
          child: Card(
            elevation: 1.0,
            child: Row(
              children: <Widget>[
                new IconButton(icon: keyLock, onPressed: _changePass),
                _verticalD(),
                new Text(
                  UIConstants.change_password,
                  style: TextStyle(
                    fontSize: 15.0,
                    //color: Colors.black87
                  ),
                )
              ],
            ),
          ),
        ),
        new Container(
          margin: EdgeInsets.all(7.0),
          child: Card(
            elevation: 1.0,
            child: Row(
              children: <Widget>[
                new IconButton(icon: clear, onPressed: _clearHistory),
                _verticalD(),
                new Text(
                  UIConstants.clear_history,
                  style: TextStyle(
                    fontSize: 15.0,
                    //color: Colors.black87,
                  ),
                )
              ],
            ),
          ),
        ),
        new Container(
          margin: EdgeInsets.all(7.0),
          child: Card(
            elevation: 1.0,
            child: Row(
              children: <Widget>[
                new IconButton(
                    icon: logout,
                    onPressed: _logout
                ),
                _verticalD(),
                new Text(
                  UIConstants.logout,
                  style: TextStyle(
                    fontSize: 15.0,
                    color: Colors.redAccent,
                  ),
                )
              ],
            ),
          ),
        ),
        new Container(
          margin: EdgeInsets.all(7.0),
          child: Card(
            elevation: 1.0,
            child: Row(
              children: <Widget>[
                new IconButton(icon: deactivateAccount, onPressed: _deactivate),
                _verticalD(),
                new Text(
                  UIConstants.deactivate_account,
                  style: TextStyle(
                    fontSize: 15.0,
                    color: Colors.redAccent,
                  ),
                )
              ],
            ),
          ),
        )
      ]
  );

  _verticalDivider() => Container(
    padding: EdgeInsets.all(2.0),
  );

  _verticalD() => Container(
    margin: EdgeInsets.only(left: 3.0, right: 0.0, top: 0.0, bottom: 0.0),
  );

  void _changePass() {}

  void _clearHistory() {}

  void _logout() {
    Navigator.pushNamed(context, UIConstants.ROUTE_AUTH);
  }

  void _deactivate() {}

}
