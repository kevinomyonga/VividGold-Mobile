import 'package:flutter/material.dart';
import 'package:vividgold_app/utils/uiconstants.dart';

class HorizontalList extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 110.0,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          Category(
            imageLocation: 'https://upload.wikimedia.org/wikipedia/commons/thumb/4/4e/Playstation_logo_colour.svg/1280px-Playstation_logo_colour.svg.png',
            imageCaption: 'Playstation',
          ),

          Category(
            imageLocation: 'https://upload.wikimedia.org/wikipedia/commons/thumb/f/f9/Xbox_one_logo.svg/1024px-Xbox_one_logo.svg.png',
            imageCaption: 'XBOX',
          ),

          Category(
            imageLocation: 'https://upload.wikimedia.org/wikipedia/commons/9/95/Nintendo_Logo_2017.png',
            imageCaption: 'Nintendo',
          ),

          Category(
            imageLocation: 'http://www.sclance.com/pngs/pc-logo-png/pc_logo_png_996767.png',
            imageCaption: 'PC',
          ),

          Category(
            imageLocation: 'http://www.dutyfree.ca/application/files/3114/8597/6357/preorder.png',
            imageCaption: 'Pre Order',
          ),

          Category(
            imageLocation: 'http://www.pngmart.com/files/7/Trade-PNG-Transparent.png',
            imageCaption: 'Trade In',
          ),
        ],
      ),
    );
  }
}

class Category extends StatelessWidget {
  final String imageLocation;
  final String imageCaption;

  Category({this.imageLocation, this.imageCaption});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, UIConstants.ROUTE_PRODUCTS);
        },
        child: Container(
          width: 110.0,
          child: ListTile(
              title: new Container(
                //alignment: Alignment.topCenter,
                  child: Container(
                    width: 100.0,
                    height: 80.0,
                    //margin: const EdgeInsets.all(10.0),
                    // padding: const EdgeInsets.all(3.0),
                    /*child: FadeInImage(
                      fit: BoxFit.fill,
                      placeholder: AssetImage(UIConstants.placeholder),
                      image: NetworkImage(image_location),
                    ),*/
                    /*child: new CircleAvatar(
                      backgroundColor: Colors.grey,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(60),
                        child: FadeInImage(
                          fit: BoxFit.fill,
                          placeholder: AssetImage(UIConstants.placeholder),
                          image: NetworkImage(image_location),
                        ),
                      ),
                    ),*/
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey, //                   <--- border color
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.all(
                          Radius.circular(60.0) //         <--- border radius here
                      ),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(60),
                      child: FadeInImage(
                        fit: BoxFit.fill,
                        placeholder: AssetImage(UIConstants.placeholder),
                        image: NetworkImage(imageLocation),
                      ),
                    ),
                  )
              ),
              /*title: Image.asset(
                image_location,
                width: 100.0,
                height: 80.0,
              ),*/
              subtitle: Container(
                alignment: Alignment.topCenter,
                child: Text(
                  imageCaption,
                  style: new TextStyle(
                    fontSize: 12.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              )
          ),
        ),
      ),
    );
  }
}
