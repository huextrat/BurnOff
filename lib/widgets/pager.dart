import 'package:burn_off/widgets/page.dart';
import 'package:burn_off/widgets/rectangle_indicator.dart';
import 'package:flutter/material.dart';

class MenuPager extends StatefulWidget {
  final List<Page> children;

  MenuPager({@required this.children});

  @override
  _MenuPagerState createState() => _MenuPagerState();
}

const double _kViewportFraction = 0.75;

class _MenuPagerState extends State<MenuPager> {
  int selectedPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: <Widget>[
          _renderBackground(this.widget.children[selectedPageIndex].background),
          _renderTitle(this.widget.children[selectedPageIndex].title),
          _renderBottomNav(
              this.widget.children.map((page) => page.icon).toList()),
          _renderContents(
              this.widget.children, selectedPageIndex, this.handlePageChanged),
        ],
      ),
    );
  }

  void handlePageChanged(int pageIndex) {
    setState(() {
      selectedPageIndex = pageIndex;
    });
  }

  Widget _renderContents(List<Page> pages, int selectedPageIndex,
      void onPageChanged(int pageIndex)) {
    return PageView(
      controller: PageController(
          initialPage: selectedPageIndex, viewportFraction: _kViewportFraction),
      children: List<Widget>.generate(pages.length, (index) {
        return _renderPage(pages[index], index, selectedPageIndex);
      }, growable: false),
      onPageChanged: onPageChanged,
    );
  }

  Widget _renderPage(Page page, int index, int selectedPageIndex) {
    var resizeFactor = 1 - ((selectedPageIndex - index).abs() * 0.2).clamp(0.0, 1.0);
    return Center(
      child: Container(
        alignment: Alignment.center +
            Alignment((selectedPageIndex - index) * _kViewportFraction, 0.0),
        width: 350.0 * resizeFactor,
        height: 600.0 * resizeFactor,
        child: Center(
          child: Padding(
            padding: EdgeInsets.only(top: 20.0),
            child: page,
          ),
        ),
      ),
    );
  }

  Widget _renderBottomNav(List<String> iconImages) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: EdgeInsets.only(bottom: 40.0),
        child: FittedBox(
          alignment: FractionalOffset.bottomCenter,
          child: RectangleIndicator(
            icons: iconImages,
            selectedIndex: selectedPageIndex,
          ),
        ),
      ),
    );
  }

  Widget _renderTitle(String titleText) {
    return Align(
      alignment: Alignment.topCenter,
      child: Padding(
        padding: EdgeInsets.only(top: 50.0),
        child: Text(
          titleText,
          style: TextStyle(
            color: Colors.white,
            fontSize: 40.0,
            fontWeight: FontWeight.w600,
            fontFamily: 'Dosis',
          ),
        ),
      ),
    );
  }

  Widget _renderBackground(LinearGradient gradient2) {
    return Positioned.fill(
      child: Container(
        decoration: BoxDecoration(
          gradient: gradient2,
        ),
      ),
    );
  }
}
