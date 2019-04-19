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
            image_location: 'https://upload.wikimedia.org/wikipedia/commons/thumb/4/4e/Playstation_logo_colour.svg/1280px-Playstation_logo_colour.svg.png',
            image_caption: 'Playstation',
          ),

          Category(
            image_location: 'https://upload.wikimedia.org/wikipedia/commons/thumb/f/f9/Xbox_one_logo.svg/1024px-Xbox_one_logo.svg.png',
            image_caption: 'XBOX',
          ),

          Category(
            image_location: 'https://upload.wikimedia.org/wikipedia/commons/9/95/Nintendo_Logo_2017.png',
            image_caption: 'Nintendo',
          ),

          Category(
            image_location: 'http://www.sclance.com/pngs/pc-logo-png/pc_logo_png_996767.png',
            image_caption: 'PC',
          ),

          Category(
            image_location: 'http://www.dutyfree.ca/application/files/3114/8597/6357/preorder.png',
            image_caption: 'Pre Order',
          ),

          Category(
            image_location: 'http://www.pngmart.com/files/7/Trade-PNG-Transparent.png',
            image_caption: 'Trade In',
          ),
        ],
      ),
    );
  }
}

class Category extends StatelessWidget {
  final String image_location;
  final String image_caption;

  Category({this.image_location, this.image_caption});

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
                        image: NetworkImage(image_location),
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
                  image_caption,
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
