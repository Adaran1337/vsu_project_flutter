import 'package:flutter/material.dart';
import 'package:vsu_project/layout/base_layout.dart';
import 'package:vsu_project/screen/favorite_energy_drink_screen.dart';
import 'package:vsu_project/screen/list_energy_drink_screen.dart';

class NavigationLayout extends StatefulWidget {
  final Widget targetWidget;

  const NavigationLayout({super.key, required this.targetWidget});

  // NavigationLayout({super.key});

  @override
  // State<StatefulWidget> createState() => NavigationLayoutState(content);
  State<StatefulWidget> createState() => NavigationLayoutState();
}

class NavigationLayoutState extends State<NavigationLayout> {
// class NavigationLayout extends StatelessWidget {
//   final Widget content;

  // NavigationLayout(this.content, {super.key});
  // NavigationLayoutState(this.content);

  int _selectedIndex = 0;

  // static final List<String> _widgetRoutesOptions = [
  //   NavigationUtils.list,
  //   NavigationUtils.favorite,
  // ];
  static final List<Widget> _widgetOptions = [
    const ListEnergyDrinkScreen(),
    const FavoriteEnergyDrinkScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return BaseLayout(
      content: _widgetOptions.elementAt(_selectedIndex),
      navigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.list_rounded),
            label: 'Список',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_rounded),
            label: 'Избранное',
          )
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

// void _onItemTapped(BuildContext context, int index) {
//     _selectedIndex = index;
//     Navigator.pushReplacementNamed(context, _widgetRoutesOptions[index]);
// }
}

// class NavigationLayoutState extends State<NavigationLayout> {
// // class NavigationLayout extends StatelessWidget {
// //   final Widget content;
//
//   // NavigationLayout(this.content, {super.key});
//   // NavigationLayoutState(this.content);
//
//   int _selectedIndex = 0;
//
//   static final List<String> _widgetRoutesOptions = [
//     NavigationUtils.list,
//     NavigationUtils.favorite,
//   ];
//   // static final List<Widget> _widgetOptions = [
//   //   ListScreen(),
//   //   FavoriteScreen(),
//   // ];
//
//   @override
//   Widget build(BuildContext context) {
//     // _selectedIndex = _widgetOptions.indexOf(widget.targetWidget);
//     // if (_selectedIndex == -1) {
//     //   _selectedIndex = 0;
//     // }
//     return BaseLayout(
//       content: widget.content,
//       navigationBar: BottomNavigationBar(
//         items: const [
//           BottomNavigationBarItem(
//             icon: Icon(Icons.list_rounded),
//             label: 'Список',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.favorite_rounded),
//             label: 'Избранное',
//           )
//         ],
//         currentIndex: _selectedIndex,
//         onTap: _onItemTapped,
//       ),
//     );
//   }
//
//   void _onItemTapped(int index) {
//     setState(() {
//       _selectedIndex = index;
//       Navigator.pushReplacementNamed(context, _widgetRoutesOptions[index]);
//     });
//   }
//
// // void _onItemTapped(BuildContext context, int index) {
// //     _selectedIndex = index;
// //     Navigator.pushReplacementNamed(context, _widgetRoutesOptions[index]);
// // }
// }
