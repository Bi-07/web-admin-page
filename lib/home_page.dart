import 'package:flutter/material.dart';
import 'package:web_login_page/responsive.dart';
import 'package:web_login_page/top_app_bar.dart';
import 'auth.dart';
import 'drawers.dart';

/// UI of Home Page
class HomePage extends StatefulWidget {
  static const String route = '/';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double _scrollPosition = 0;
  double _opacity = 0;

  /// Define variables of grid list items
  final List<Map> myProducts =
      List.generate(100, (index) => {"id": index, "name": "user $index"})
          .toList();

  @override
  Widget build(BuildContext context) {
    /// Define variables to control with size of parent widget
    var screenSize = MediaQuery.of(context).size;
    _opacity = _scrollPosition < screenSize.height * 0.40
        ? _scrollPosition / (screenSize.height * 0.40)
        : 1;

    /// We have to make changes in two places for integrating the AuthDialog widget: in the top bar (for large screens) and the drawer (for small screens).
    return Scaffold(
        backgroundColor: Colors.lightBlue,
        extendBodyBehindAppBar: true,

        /// Call of Responsive Widget
        appBar: ResponsiveWidget.isSmallScreen(context)
            ? AppBar(
                backgroundColor:
                    Theme.of(context).cardColor.withOpacity(_opacity),
                elevation: 0,
                centerTitle: true,
                title: Text(
                  'ADMIN PAGE',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 3,
                  ),
                ),
              )
            : PreferredSize(
                preferredSize: Size(screenSize.width, 1000),

                /// Call of TopAppBar Widget
                child: TopAppBar(_opacity),
              ),

        /// Call Drawers Widget
        drawer: Drawers(),
        body: Center(
          /// to show home page if user log in or not
          child: userEmail == null
              ? Container(
                  child: Text(
                    'Welcome Every One',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 36,
                        fontWeight: FontWeight.bold),
                  ),
                )

              /// UI og grid view list
              : GridView.builder(
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 200,
                      childAspectRatio: 3 / 2,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20),
                  itemCount: myProducts.length,
                  itemBuilder: (BuildContext ctx, index) {
                    return Container(
                        padding: EdgeInsets.all(16),
                        alignment: Alignment.center,
                        child: Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.3),
                              borderRadius: BorderRadius.circular(15)),
                          child: Text(myProducts[index]["name"]),
                        ));
                  }),
        )
        // ),
        );
  }
}
