import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
    color: Colors.red,
  );
  Icon deactivateAccount = new Icon(
    Icons.close,
    color: Colors.red,
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
                Divider(),
                _profileActions(),
                _profileDeactivation(),
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
                        ]
                    ),
                  )
              )
          ),
        )
      ]
  );

  _profileAddresses() => Container(
    margin: EdgeInsets.all(7.0),
    child: Card(
        child: Container(
          //  padding: EdgeInsets.only(left: 10.0,top: 15.0,bottom: 5.0,right: 5.0),

          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, UIConstants.ROUTE_ADDRESSES);
                },
                child: Container(
                  padding: EdgeInsets.only(
                      left: 10.0, top: 15.0, bottom: 15.0),
                  child: Row(
                    children: <Widget>[
                      Icon(
                        FontAwesomeIcons.addressBook,
                        //color: Colors.black54
                      ),
                      _verticalD(),
                      Container(
                        margin: EdgeInsets.only(left: 5.0),
                      ),
                      Text(
                        UIConstants.my_addresses,
                        style: TextStyle(
                          fontSize: 15.0,
                          //color: Colors.black87,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        )),
  );

  _profileActions() => new Container(
    margin: EdgeInsets.all(7.0),
    child: Card(
        child: Container(
          //  padding: EdgeInsets.only(left: 10.0,top: 15.0,bottom: 5.0,right: 5.0),

          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              InkWell(
                onTap: () {
                  _changePass();
                },
                child: Container(
                  padding: EdgeInsets.only(
                      left: 10.0, top: 15.0, bottom: 15.0),
                  child: Row(
                    children: <Widget>[
                      keyLock,
                      _verticalD(),
                      Container(
                        margin: EdgeInsets.only(left: 5.0),
                      ),
                      Text(
                        UIConstants.change_password,
                        style: TextStyle(
                          fontSize: 17.0,
                          //color: Colors.black87,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Divider(
                height: 5.0,
              ),
              InkWell(
                onTap: () {
                  _clearHistory();
                },
                child: Container(
                  padding: EdgeInsets.only(
                      left: 10.0, top: 15.0, bottom: 15.0),
                  child: Row(
                    children: <Widget>[
                      clear,
                      _verticalD(),
                      Container(
                        margin: EdgeInsets.only(left: 5.0),
                      ),
                      Text(
                        UIConstants.clear_history,
                        style: TextStyle(
                          fontSize: 17.0,
                          //color: Colors.black87,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Divider(
                height: 5.0,
              ),
              InkWell(
                onTap: () {
                  _logout();
                },
                child: Container(
                  padding: EdgeInsets.only(
                      left: 10.0, top: 15.0, bottom: 15.0),
                  child: Row(
                    children: <Widget>[
                      logout,
                      _verticalD(),
                      Container(
                        margin: EdgeInsets.only(left: 5.0),
                      ),
                      Text(
                        UIConstants.logout,
                        style: TextStyle(
                          fontSize: 15.0,
                          color: Colors.redAccent,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        )
    ),
  );

  _profileDeactivation() => Container(
    margin: EdgeInsets.all(7.0),
    child: Card(
        child: Container(
          //  padding: EdgeInsets.only(left: 10.0,top: 15.0,bottom: 5.0,right: 5.0),

          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              InkWell(
                onTap: () {
                },
                child: Container(
                  padding: EdgeInsets.only(
                      left: 10.0, top: 15.0, bottom: 15.0),
                  child: Row(
                    children: <Widget>[
                      deactivateAccount,
                      _verticalD(),
                      Container(
                        margin: EdgeInsets.only(left: 5.0),
                      ),
                      Text(
                        UIConstants.deactivate_account,
                        style: TextStyle(
                          fontSize: 15.0,
                          color: Colors.red,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        )),
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
