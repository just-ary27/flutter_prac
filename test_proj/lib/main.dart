import 'package:flutter/material.dart';
import 'src/routes.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:test_proj/src/app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

// class MyApp extends StatelessWidget {
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'InstaClone',
//       theme: ThemeData(
//         // This is the theme of your application.
//         //
//         // Try running your application with "flutter run". You'll see the
//         // application has a blue toolbar. Then, without quitting the app, try
//         // changing the primarySwatch below to Colors.green and then invoke
//         // "hot reload" (press "r" in the console where you ran "flutter run",
//         // or simply save your changes to "hot reload" in a Flutter IDE).
//         // Notice that the counter didn't reset back to zero; the application
//         // is not restarted.
//         primarySwatch: Colors.blue,
//       ),
//       home: LaunchScreen(),
//       routes: {
//         '/dm': (_) => DMScreen(),
//         '/login': (_) => LoginScreen(),
//         '/signup': (_) => SignUpScreen(),
//         '/launch': (_) => LaunchScreen(),
//         '/home': (_) => HomeScreen(),
//         '/search':(_) => SearchScreen(),
//         '/activity':(_) => ActivityScreen(),
//         '/profile': (_) => ProfileScreen()
//       },
//       // initialRoute: "/",
//       // onGenerateRoute: RouteGenerator.generate,
//     );
//   }
// }
//
// class MyHomePage extends StatefulWidget {
//   MyHomePage({Key? key, required this.title}) : super(key: key);
//
//   // This widget is the home page of your application. It is stateful, meaning
//   // that it has a State object (defined below) that contains fields that affect
//   // how it looks.
//
//   // This class is the configuration for the state. It holds the values (in this
//   // case the title) provided by the parent (in this case the App widget) and
//   // used by the build method of the State. Fields in a Widget subclass are
//   // always marked "final".
//
//   final String title;
//
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   int _currentIndex = 0;
//
//   final _tabs = [
//     HomeScreen(),
//     Text("Search"),
//     Text("Posts"),
//     Text("ActionCenter"),
//     ProfileScreen(),
//   ];
//
//   void _incrementCounter() {
//     setState(() {
//       // This call to setState tells the Flutter framework that something has
//       // changed in this State, which causes it to rerun the build method below
//       // so that the display can reflect the updated values. If we changed
//       // _counter without calling setState(), then the build method would not be
//       // called again, and so nothing would appear to happen.
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     // This method is rerun every time setState is called, for instance as done
//     // by the _incrementCounter method above.
//     //
//     // The Flutter framework has been optimized to make rerunning build methods
//     // fast, so that you can just rebuild anything that needs updating rather
//     // than having to individually change instances of widgets.
//     return Scaffold(
//       appBar: AppBar(
//         // Here we take the value from the MyHomePage object that was created by
//         // the App.build method, and use it to set our appbar title.
//         title: Text(widget.title),
//       ),
//       body: Container(
//         // Center is a layout widget. It takes a single child and positions it
//         // in the middle of the parent.
//         child: Column(
//           // Column is also a layout widget. It takes a list of children and
//           // arranges them vertically. By default, it sizes itself to fit its
//           // children horizontally, and tries to be as tall as its parent.
//           //
//           // Invoke "debug painting" (press "p" in the console, choose the
//           // "Toggle Debug Paint" action from the Flutter Inspector in Android
//           // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
//           // to see the wireframe for each widget.
//           //
//           // Column has various properties to control how it sizes itself and
//           // how it positions its children. Here we use mainAxisAlignment to
//           // center the children vertically; the main axis here is the vertical
//           // axis because Columns are vertical (the cross axis would be
//           // horizontal).
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Text(
//               'You have pushed the button this many times:',
//             ),
//             Text(
//               '_counter',
//               style: Theme.of(context).textTheme.headline4,
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _incrementCounter,
//         tooltip: 'Increment',
//         child: Icon(Icons.add),
//       ), // This trailing comma makes auto-formatting nicer for build methods.
//     );
//   }
// }
//
// class LoginScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.white70,
//         elevation: 0,
//         leading: IconButton(
//           onPressed: () {
//             Navigator.of(context).pushNamed('/launch');
//           },
//           icon: Icon(
//             Icons.arrow_back_ios,
//             color: Colors.black,
//           ),
//         ),
//       ),
//       body: Center(
//           child: Container(
//         padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             Text(
//               "Instagram",
//               style: TextStyle(fontSize: 40, fontFamily: "Billabong"),
//             ),
//             Container(
//               height: 45,
//             ),
//             TextField(
//               obscureText: false,
//               decoration: InputDecoration(
//                 enabledBorder: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(5),
//                   borderSide: BorderSide(
//                     width: 2.0,
//                     color: Colors.grey.shade700,
//                   ),
//                 ),
//                 contentPadding: EdgeInsets.fromLTRB(20, 0, 0, 0),
//                 // border
//                 labelText: "Username",
//               ),
//             ),
//             Container(
//               height: 10,
//             ),
//             TextField(
//               obscureText: true,
//               decoration: InputDecoration(
//                 enabledBorder: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(5),
//                     borderSide: BorderSide(
//                       width: 2.0,
//                       color: Colors.grey.shade700,
//                     )),
//                 contentPadding: EdgeInsets.fromLTRB(20, 0, 0, 0),
//                 labelText: "Password",
//               ),
//             ),
//             // TextField()],
//             Row(
//               children: [
//                 Expanded(
//                   child: Container(
//                     alignment: Alignment.centerRight,
//                     child: TextButton(
//                       child: Text("Forgot Password?",
//                           style: TextStyle(
//                             color: Colors.blue.shade700,
//                           )),
//                       onPressed: () {},
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             TextButton(
//               style: TextButton.styleFrom(
//                 minimumSize: Size(double.infinity, 10),
//                 backgroundColor: Colors.blue.shade400,
//               ),
//               // style: ButtonStyle(
//               //   backgroundColor: MaterialStateProperty.all(Colors.blue.shade300),
//               // ),
//               onPressed: () {
//                 Navigator.of(context).pushNamed('/home');
//               },
//               child: Text("Log in",
//                   style: TextStyle(
//                     color: Colors.white70,
//                   )),
//             ),
//             Container(
//               height: 40,
//             ),
//             Row(mainAxisAlignment: MainAxisAlignment.center, children: [
//               Expanded(
//                 child: Container(
//                   margin: const EdgeInsets.only(left: 10.0, right: 15.0),
//                   child: Divider(
//                     height: 2,
//                     color: Colors.grey.shade400,
//                   ),
//                 ),
//               ),
//               Text("OR"),
//               Expanded(
//                 child: Container(
//                   margin: const EdgeInsets.only(left: 15.0, right: 10.0),
//                   child: Divider(
//                     height: 2,
//                     color: Colors.grey.shade400,
//                   ),
//                 ),
//               ),
//             ]),
//             Container(
//               height: 50,
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Text("Don't have an account?"),
//                 TextButton(
//                     onPressed: () {
//                       Navigator.of(context).pushNamed('/signup');
//                     },
//                     child: Text("Sign up")),
//               ],
//             ),
//           ],
//         ),
//       )),
//     );
//   }
// }
//
// class SignUpScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.white70,
//         elevation: 0,
//         leading: IconButton(
//           onPressed: () {
//             Navigator.of(context).pushNamed('/launch');
//           },
//           icon: Icon(
//             Icons.arrow_back_ios,
//             color: Colors.black,
//           ),
//         ),
//       ),
//       body: Center(
//           child: Container(
//         padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             Text(
//               "Instagram",
//               style: TextStyle(fontSize: 40, fontFamily: "Billabong"),
//             ),
//             Container(
//               height: 45,
//             ),
//             TextField(
//               obscureText: false,
//               decoration: InputDecoration(
//                 enabledBorder: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(5),
//                   borderSide: BorderSide(
//                     width: 2.0,
//                     color: Colors.grey.shade700,
//                   ),
//                 ),
//                 contentPadding: EdgeInsets.fromLTRB(20, 0, 0, 0),
//                 // border
//                 labelText: "Username",
//               ),
//             ),
//             Container(
//               height: 10,
//             ),
//             TextField(
//               obscureText: true,
//               decoration: InputDecoration(
//                 enabledBorder: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(5),
//                     borderSide: BorderSide(
//                       width: 2.0,
//                       color: Colors.grey.shade700,
//                     )),
//                 contentPadding: EdgeInsets.fromLTRB(20, 0, 0, 0),
//                 labelText: "Password",
//               ),
//             ),
//             Container(
//               height: 10,
//             ),
//             TextField(
//               obscureText: true,
//               decoration: InputDecoration(
//                 enabledBorder: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(5),
//                     borderSide: BorderSide(
//                       width: 2.0,
//                       color: Colors.grey.shade700,
//                     )),
//                 contentPadding: EdgeInsets.fromLTRB(20, 0, 0, 0),
//                 labelText: "Confirm Password",
//               ),
//             ),
//             Container(
//               height: 10,
//             ),
//             TextField(
//               obscureText: false,
//               decoration: InputDecoration(
//                 enabledBorder: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(5),
//                     borderSide: BorderSide(
//                       width: 2.0,
//                       color: Colors.grey.shade700,
//                     )),
//                 contentPadding: EdgeInsets.fromLTRB(20, 0, 0, 0),
//                 labelText: "Email ID",
//               ),
//             ),
//             // TextField()],
//             Container(
//               height: 10,
//             ),
//             TextButton(
//               style: TextButton.styleFrom(
//                   minimumSize: Size(double.infinity, 15),
//                   backgroundColor: Colors.blue.shade400,
//                   textStyle: TextStyle(color: Colors.white)),
//               onPressed: () {
//                 Navigator.of(context).pushNamed('/home');
//               },
//               child: Text(
//                 "Sign up",
//                 style: TextStyle(color: Colors.white70),
//               ),
//             ),
//             Container(
//               height: 50,
//             ),
//             Row(mainAxisAlignment: MainAxisAlignment.center, children: [
//               Expanded(
//                 child: Container(
//                   margin: const EdgeInsets.only(left: 10.0, right: 15.0),
//                   child: Divider(
//                     height: 2,
//                     color: Colors.grey.shade400,
//                   ),
//                 ),
//               ),
//               Text("OR"),
//               Expanded(
//                 child: Container(
//                   margin: const EdgeInsets.only(left: 15.0, right: 10.0),
//                   child: Divider(
//                     height: 2,
//                     color: Colors.grey.shade400,
//                   ),
//                 ),
//               ),
//             ]),
//             Container(
//               height: 20,
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Text("Have an account?"),
//                 TextButton(
//                     onPressed: () {
//                       Navigator.of(context).pushNamed('/login');
//                     },
//                     child: Text("Log in"))
//               ],
//             ),
//           ],
//         ),
//       )),
//     );
//   }
// }
//
// class LaunchScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//           child: Container(
//         padding: EdgeInsets.fromLTRB(40, 0, 40, 0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             Text(
//               "Instagram",
//               style: TextStyle(
//                 fontSize: 50,
//                 fontFamily: "Billabong",
//               ),
//             ),
//             Container(
//               height: 200,
//             ),
//             TextButton(
//               style: TextButton.styleFrom(
//                   minimumSize: Size(double.infinity, 20),
//                   backgroundColor: Colors.blueAccent,
//                   side: BorderSide(width: 2, color: Colors.blueAccent)),
//               child: Text("Log in",
//                   textAlign: TextAlign.right,
//                   style: TextStyle(
//                     fontSize: 20,
//                     color: Colors.white70,
//                   )),
//               onPressed: () {
//                 Navigator.of(context).pushNamed('/login');
//               },
//             ),
//             Container(
//               height: 25,
//             ),
//             TextButton(
//               style: TextButton.styleFrom(
//                 side: BorderSide(width: 2, color: Colors.blueAccent),
//                 minimumSize: Size(double.infinity, 20),
//               ),
//               onPressed: () {
//                 Navigator.of(context).pushNamed('/signup');
//               },
//               child: Text(
//                 "Sign up",
//                 style: TextStyle(
//                   fontSize: 20,
//                 ),
//               ),
//             ),
//           ],
//         ),
//       )),
//     );
//   }
// }
//
// final data = List<String>.generate(26, (index) => "Contact ${index + 1}");
//
// class DMScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         leading: IconButton(
//           onPressed: () {
//             Navigator.of(context).pushNamed('/home');
//           },
//           icon: Icon(Icons.arrow_back_ios_new_rounded),
//           color: Colors.black,
//         ),
//         title: Container(
//           alignment: Alignment.center,
//           child: TextButton.icon(
//             onPressed: () {},
//             icon: Icon(
//               Icons.keyboard_arrow_down_rounded,
//               color: Colors.black,
//             ),
//             label: Text(
//               "JustAry27",
//               style: TextStyle(color: Colors.black),
//             ),
//           ),
//         ),
//         actions: [
//           IconButton(
//             onPressed: () {},
//             icon: Icon(Icons.add_rounded),
//             color: Colors.black,
//           )
//         ],
//         backgroundColor: Colors.white,
//       ),
//       body: Container(
//           child: Column(children: [
//         Container(
//           height: 70,
//           padding: EdgeInsets.fromLTRB(10, 10, 10, 15),
//           child: TextField(
//             decoration: InputDecoration(
//                 // icon: Icon(Icons.search),
//                 labelText: "Search",
//                 enabledBorder: OutlineInputBorder(
//                   borderSide: BorderSide(
//                     color: Colors.grey.shade700,
//                   ),
//                   borderRadius: BorderRadius.circular(15),
//                 )),
//           ),
//         ),
//         ListTile(
//           leading: CircleAvatar(
//             backgroundColor: Colors.pinkAccent,
//             radius: 30,
//             child: CircleAvatar(
//               radius: 25,
//               backgroundColor: Colors.white,
//               child: CircleAvatar(
//                 radius: 23,
//                 backgroundImage: AssetImage("Assets/images/aloy-op.jpg"),
//               ),
//             ),
//           ),
//           title: Text("JustAry27"),
//           subtitle: Text("Hello! How are you?"),
//           trailing: Icon(
//             Icons.camera_alt_outlined,
//             size: 35,
//           ),
//         ),
//         Container(
//           constraints: BoxConstraints(maxHeight: 760),
//           child: ListView.builder(
//               shrinkWrap: true,
//               itemCount: data.length,
//               itemBuilder: (context, index) {
//                 return Container(
//                   padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
//                   child: ListTile(
//                     leading: CircleAvatar(
//                       backgroundColor: Colors.pinkAccent,
//                       radius: 30,
//                       child: CircleAvatar(
//                         backgroundColor: Colors.white,
//                         radius: 25,
//                         child: CircleAvatar(
//                           radius: 23,
//                           backgroundImage:
//                               AssetImage("Assets/images/aloy-op.jpg"),
//                         ),
//                       ),
//                     ),
//                     title: Text("${data[index]}"),
//                     subtitle: Row(
//                       children: [
//                         Expanded(child: Text("Hello! How are you?")),
//                         Text(
//                           ". 27m",
//                         )
//                       ],
//                     ),
//                     trailing: IconButton(
//                       onPressed: () {},
//                       icon: Icon(
//                         Icons.camera_alt_outlined,
//                         size: 35,
//                       ),
//                     ),
//                   ),
//                 );
//               }),
//         )
//       ])),
//       bottomNavigationBar: BottomAppBar(
//         child: TextButton.icon(
//             icon: Icon(Icons.camera_alt),
//             onPressed: () {},
//             label: Text("Camera")),
//       ),
//     );
//   }
// }
//
// final gridAssets = [
//   "Assets/images/aloy.gif",
//   "Assets/images/aloy-frozen.gif",
//   "Assets/images/i1.jpg",
//   "Assets/images/aloy-op.jpg",
//   "Assets/images/i2.jpg",
//   "Assets/images/i3.jpg",
//   "Assets/images/i4.jpg",
//   "Assets/images/i5.jpg",
//   "Assets/images/i6.jpg",
//   "Assets/images/i7.jpg",
//   "Assets/images/i8.jpg",
//   "Assets/images/i9.jpg"
// ];
//
// class ProfileScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         title: Container(
//           alignment: Alignment.center,
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               TextButton.icon(
//                   onPressed: () {},
//                   icon: Icon(
//                     Icons.lock,
//                     color: Colors.black,
//                   ),
//                   label: Text(
//                     "JustAry27",
//                     style: TextStyle(color: Colors.black),
//                   )),
//               IconButton(
//                 onPressed: () {},
//                 icon: Icon(Icons.keyboard_arrow_down_rounded),
//                 color: Colors.black,
//               )
//             ],
//           ),
//         ),
//       ),
//       body: Column(children: [
//         Container(
//           padding: EdgeInsets.fromLTRB(30, 30, 30, 10),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Row(
//                 children: [
//                   CircleAvatar(
//                     backgroundColor: Colors.pinkAccent,
//                     radius: 65,
//                     child: CircleAvatar(
//                       radius: 62.5,
//                       backgroundColor: Colors.white,
//                       child: CircleAvatar(
//                         radius: 60,
//                         backgroundImage:
//                             ExactAssetImage("Assets/images/aloy-op.jpg"),
//                       ),
//                     ),
//                   ),
//                   Container(
//                     width: 50,
//                   ),
//                   Column(
//                     children: [
//                       TextButton(
//                         onPressed: () {},
//                         child: Column(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               Text(
//                                 "27",
//                                 style: TextStyle(
//                                   color: Colors.black,
//                                   fontSize: 20,
//                                 ),
//                               ),
//                               Text(
//                                 "Posts",
//                                 style: TextStyle(
//                                   color: Colors.black,
//                                   fontSize: 20,
//                                 ),
//                               )
//                             ]),
//                       )
//                     ],
//                   ),
//                   Container(
//                     width: 25,
//                   ),
//                   Column(
//                     children: [
//                       TextButton(
//                         onPressed: () {},
//                         child: Column(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               Text(
//                                 "270",
//                                 style: TextStyle(
//                                   color: Colors.black,
//                                   fontSize: 20,
//                                 ),
//                               ),
//                               Text(
//                                 "Followers",
//                                 style: TextStyle(
//                                   color: Colors.black,
//                                   fontSize: 20,
//                                 ),
//                               )
//                             ]),
//                       )
//                     ],
//                   ),
//                   Container(
//                     width: 25,
//                   ),
//                   Column(
//                     children: [
//                       TextButton(
//                         onPressed: () {},
//                         child: Column(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               Text(
//                                 "300",
//                                 style: TextStyle(
//                                   color: Colors.black,
//                                   fontSize: 20,
//                                 ),
//                               ),
//                               Text(
//                                 "Following",
//                                 style: TextStyle(
//                                   color: Colors.black,
//                                   fontSize: 20,
//                                 ),
//                               )
//                             ]),
//                       )
//                     ],
//                   ),
//                 ],
//               ),
//               Container(
//                 height: 10,
//               ),
//               Container(
//                 padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text("Aryan Ranjan"),
//                     Text("Digital goodies designer @pixsellz"),
//                     Text("Learning Flutter"),
//                   ],
//                 ),
//               ),
//               Container(
//                 height: 20,
//               ),
//               TextButton(
//                 onPressed: () {},
//                 child: Text(
//                   "Edit Profile",
//                   style: TextStyle(
//                     color: Colors.black,
//                   ),
//                 ),
//                 style: TextButton.styleFrom(
//                   minimumSize: Size(double.infinity, 20),
//                   side: BorderSide(color: Colors.black),
//                 ),
//               )
//             ],
//           ),
//         ),
//         Container(
//           constraints: BoxConstraints(maxHeight: 592),
//           child: GridView.builder(
//             cacheExtent: 9,
//             shrinkWrap: true,
//             itemCount: gridAssets.length,
//             gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//               crossAxisCount: 3,
//             ),
//             itemBuilder: (context, index) {
//               return Container(
//                 width: 50,
//                 height: 50,
//                 child: Image(
//                   fit: BoxFit.cover,
//                   width: 50,
//                   height: 50,
//                   image: AssetImage(gridAssets[index]),
//                 ),
//               );
//             },
//           ),
//         ),
//       ]),
//       bottomNavigationBar: BottomNavigationBar(
//         showSelectedLabels: false,
//         showUnselectedLabels: false,
//         onTap: (int) {},
//         items: [
//           BottomNavigationBarItem(
//             icon: IconButton(
//               onPressed: (){
//                 Navigator.of(context).pushNamed('/home');
//               },
//               icon:Icon(Icons.home_filled),
//               color: Colors.black,
//             ),
//             label: "",
//           ),
//           BottomNavigationBarItem(
//             icon: IconButton(
//               onPressed: (){
//                 Navigator.of(context).pushNamed('/search');
//               },
//               icon: Icon(Icons.search_rounded),
//               color: Colors.black,
//             ),
//             label: "",
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(
//               Icons.add_box_outlined,
//               color: Colors.black,
//             ),
//             label: "",
//           ),
//           BottomNavigationBarItem(
//             icon: IconButton(
//               onPressed: (){
//                 Navigator.of(context).pushNamed('/activity');
//               },
//               icon: Icon(Icons.favorite_border_rounded),
//               color: Colors.black,
//             ),
//             label: "",
//           ),
//           BottomNavigationBarItem(
//               icon: CircleAvatar(
//                 backgroundColor: Colors.black,
//                 radius: 13,
//                 child: CircleAvatar(
//                   radius: 12.5,
//                   backgroundColor: Colors.white,
//                   child: IconButton(
//                     onPressed: (){
//                       Navigator.of(context).pushNamed('/profile');
//                     },
//                     icon: CircleAvatar(
//                       radius: 11,
//                       backgroundImage:
//                       ExactAssetImage("Assets/images/aloy-op.jpg"),
//                     ),
//                   ),
//                 ),
//               ),
//               label: "")
//         ],
//       ),
//     );
//   }
// }
//
// final story_data = List<String>.generate(20, (index) => "Contact ${index + 1}");
//
// class HomeScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.white70,
//         leading: IconButton(
//             onPressed: () {},
//             icon: Icon(
//               Icons.camera_alt_outlined,
//               color: Colors.black,
//             )),
//         title: Container(
//           alignment: Alignment.center,
//           child: Text(
//             "Instagram",
//             style: TextStyle(
//               fontFamily: "Billabong",
//               fontSize: 25,
//               color: Colors.black,
//             ),
//           ),
//         ),
//         actions: [
//           IconButton(
//             onPressed: () {
//               Navigator.of(context).pushNamed('/dm');
//             },
//             icon: Icon(
//               Icons.arrow_forward_outlined,
//               color: Colors.black,
//             ),
//           )
//         ],
//       ),
//       body: Column(children: [
//         Container(
//           height: 110,
//           child: ListView.builder(
//             itemCount: story_data.length,
//             padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
//             itemBuilder: (content, index) {
//               return Container(
//                 padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
//                 height: 110,
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     CircleAvatar(
//                       backgroundColor: Colors.pinkAccent,
//                       radius: 35,
//                       child: CircleAvatar(
//                         radius: 33.25,
//                         backgroundColor: Colors.white,
//                         child: CircleAvatar(
//                           radius: 31.5,
//                           backgroundImage:
//                               ExactAssetImage("Assets/images/aloy-op.jpg"),
//                         ),
//                       ),
//                     ),
//                     Text(
//                       story_data[index],
//                       style: TextStyle(
//                         fontSize: 12,
//                       ),
//                     ),
//                   ],
//                 ),
//               );
//             },
//             scrollDirection: Axis.horizontal,
//           ),
//         ),
//         Container(
//           constraints: BoxConstraints(maxHeight: 780),
//           child: ListView.builder(
//             cacheExtent: 1,
//             shrinkWrap: true,
//             itemCount: gridAssets.length,
//             itemBuilder: (context, index) {
//               return Column(
//                 children: [
//                   Container(
//                     child: ListTile(
//                       leading: CircleAvatar(
//                         backgroundColor: Colors.black,
//                         radius: 20,
//                         child: CircleAvatar(
//                           radius: 19,
//                           backgroundColor: Colors.white,
//                           child: CircleAvatar(
//                             radius: 18,
//                             backgroundImage:
//                                 ExactAssetImage("Assets/images/aloy-op.jpg"),
//                           ),
//                         ),
//                       ),
//                       title: Text(
//                         "JustAry27",
//                         style: TextStyle(fontSize: 12),
//                       ),
//                       subtitle: Text(
//                         "New Delhi, India",
//                         style: TextStyle(fontSize: 10),
//                       ),
//                       dense: true,
//                     ),
//                     decoration: BoxDecoration(
//                         border: Border.symmetric(
//                             horizontal:
//                                 BorderSide(width: 0.2, color: Colors.black))),
//                   ),
//                   Container(
//                     height: 650,
//                     width: double.infinity,
//                     child: Image(
//                       image: AssetImage(gridAssets[index]),
//                       fit: BoxFit.cover,
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.fromLTRB(10, 5, 0, 5),
//                     child: Row(
//                       children: [
//                         IconButton(
//                           icon: Icon(
//                             Icons.favorite_border_rounded,
//                             size: 40,
//                           ),
//                           onPressed: () {
//                             final likebar = SnackBar(
//                               content: Text("You just liked that post!"),
//                             );
//                             ScaffoldMessenger.of(context).showSnackBar(likebar);
//                           },
//                         ),
//                         Container(width: 5),
//                         IconButton(
//                             onPressed: () {},
//                             icon: Icon(
//                               Icons.mode_comment_outlined,
//                               size: 40,
//                             )),
//                         Container(
//                           width: 5,
//                         ),
//                         IconButton(
//                             onPressed: () {},
//                             icon: Icon(
//                               Icons.arrow_forward,
//                               size: 40,
//                             ))
//                       ],
//                     ),
//                   ),
//                   Row(
//                     children: [
//                       Container(
//                         child: Text(
//                           "JustAry27",
//                           style: TextStyle(fontWeight: FontWeight.bold),
//                         ),
//                         padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
//                       ),
//                       Expanded(
//                           child: Container(
//                         child: Text("Great pic! 🔥🔥"),
//                       ))
//                     ],
//                   )
//                 ],
//               );
//             },
//           ),
//         )
//       ]),
//       bottomNavigationBar: BottomNavigationBar(
//         showSelectedLabels: false,
//         showUnselectedLabels: false,
//         onTap: (int) {},
//         items: [
//           BottomNavigationBarItem(
//             icon: IconButton(
//               onPressed: (){
//                 Navigator.of(context).pushNamed('/home');
//               },
//               icon:Icon(Icons.home_filled),
//               color: Colors.black,
//             ),
//             label: "",
//           ),
//           BottomNavigationBarItem(
//             icon: IconButton(
//               onPressed: (){
//                 Navigator.of(context).pushNamed('/search');
//               },
//               icon: Icon(Icons.search_rounded),
//               color: Colors.black,
//             ),
//             label: "",
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(
//               Icons.add_box_outlined,
//               color: Colors.black,
//             ),
//             label: "",
//           ),
//           BottomNavigationBarItem(
//             icon: IconButton(
//               onPressed: (){
//                 Navigator.of(context).pushNamed('/activity');
//               },
//               icon: Icon(Icons.favorite_border_rounded),
//               color: Colors.black,
//             ),
//             label: "",
//           ),
//           BottomNavigationBarItem(
//               icon: CircleAvatar(
//                 backgroundColor: Colors.black,
//                 radius: 13,
//                 child: CircleAvatar(
//                   radius: 12.5,
//                   backgroundColor: Colors.white,
//                   child: IconButton(
//                     onPressed: (){
//                       Navigator.of(context).pushNamed('/profile');
//                     },
//                     icon: CircleAvatar(
//                       radius: 11,
//                       backgroundImage:
//                       ExactAssetImage("Assets/images/aloy-op.jpg"),
//                     ),
//                   ),
//                 ),
//               ),
//               label: "")
//         ],
//       ),
//     );
//   }
// }
//
// class ActivityScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         title: Row(
//           children: [TextButton(onPressed: () {}, child: Text("Following"))],
//         ),
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             ListTile(
//               leading: Text("Follow requests"),
//             ),
//             Container(
//               decoration: BoxDecoration(
//                   border: Border(
//                 top: BorderSide(color: Colors.grey, width: 1.0),
//                 bottom: BorderSide(color: Colors.grey, width: 1.0),
//               )),
//               child: Column(
//                 children: [
//                   ListTile(
//                     leading: Text("New"),
//                   ),
//                   ListTile(
//                     leading: CircleAvatar(
//                       backgroundColor: Colors.black,
//                       radius: 15,
//                       child: CircleAvatar(
//                         radius: 14,
//                         backgroundColor: Colors.white,
//                         child: CircleAvatar(
//                           radius: 13,
//                           backgroundImage:
//                               ExactAssetImage("Assets/images/aloy-op.jpg"),
//                         ),
//                       ),
//                     ),
//                     title: Text("JustAry27 liked your photo. 3h"),
//                     trailing: Container(
//                       height: 45,
//                       width: 40,
//                       child: Image(
//                         image: AssetImage("Assets/images/aloy.gif"),
//                         fit: BoxFit.cover,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             Container(
//               decoration: BoxDecoration(
//                   border: Border(
//                 bottom: BorderSide(color: Colors.grey, width: 1.0),
//               )),
//               child: Column(
//                 children: [
//                   ListTile(
//                     leading: Text("Today"),
//                   ),
//                   ListTile(
//                     leading: CircleAvatar(
//                       backgroundColor: Colors.black,
//                       radius: 15,
//                       child: CircleAvatar(
//                         radius: 14,
//                         backgroundColor: Colors.white,
//                         child: CircleAvatar(
//                           radius: 13,
//                           backgroundImage:
//                               ExactAssetImage("Assets/images/aloy-op.jpg"),
//                         ),
//                       ),
//                     ),
//                     title: Text(
//                         "JustAry27, Aryan and 25 others liked your photo. 10d"),
//                     trailing: Container(
//                       height: 45,
//                       width: 40,
//                       child: Image(
//                         image: AssetImage("Assets/images/aloy.gif"),
//                         fit: BoxFit.cover,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             Container(
//               decoration: BoxDecoration(
//                   border: Border(
//                 bottom: BorderSide(color: Colors.grey, width: 1.0),
//               )),
//               child: Column(
//                 children: [
//                   ListTile(
//                     leading: Text("This Week"),
//                   ),
//                   ListTile(
//                     leading: CircleAvatar(
//                       backgroundColor: Colors.black,
//                       radius: 15,
//                       child: CircleAvatar(
//                         radius: 14,
//                         backgroundColor: Colors.white,
//                         child: CircleAvatar(
//                           radius: 13,
//                           backgroundImage:
//                               ExactAssetImage("Assets/images/aloy-op.jpg"),
//                         ),
//                       ),
//                     ),
//                     title: Text("JustAry27 mentioned you in a comment:\n"
//                         "@justary27 Beautiful pic! . 3d"),
//                     subtitle: Row(
//                       children: [
//                         IconButton(
//                             onPressed: () {},
//                             icon: Icon(Icons.favorite_border_rounded)),
//                         TextButton(onPressed: () {}, child: Text("Reply")),
//                       ],
//                     ),
//                     trailing: Container(
//                       height: 45,
//                       width: 40,
//                       child: Image(
//                         image: AssetImage("Assets/images/aloy.gif"),
//                         fit: BoxFit.cover,
//                       ),
//                     ),
//                   ),
//                   ListTile(
//                     leading: CircleAvatar(
//                       backgroundColor: Colors.black,
//                       radius: 15,
//                       child: CircleAvatar(
//                         radius: 14,
//                         backgroundColor: Colors.white,
//                         child: CircleAvatar(
//                           radius: 13,
//                           backgroundImage:
//                               ExactAssetImage("Assets/images/aloy-op.jpg"),
//                         ),
//                       ),
//                     ),
//                     title: Text("JustAry27 started following you. 4d"),
//                     trailing: TextButton(
//                       onPressed: () {},
//                       style: TextButton.styleFrom(
//                           backgroundColor: Colors.white,
//                           side: BorderSide(color: Colors.grey, width: 1.0)),
//                       child: Text(
//                         "Message",
//                         style: TextStyle(
//                           color: Colors.black,
//                         ),
//                       ),
//                     ),
//                   ),
//                   ListTile(
//                     leading: CircleAvatar(
//                       backgroundColor: Colors.black,
//                       radius: 15,
//                       child: CircleAvatar(
//                         radius: 14,
//                         backgroundColor: Colors.white,
//                         child: CircleAvatar(
//                           radius: 13,
//                           backgroundImage:
//                               ExactAssetImage("Assets/images/aloy-op.jpg"),
//                         ),
//                       ),
//                     ),
//                     title: Text("JustAry27 started following you. 4d"),
//                     trailing: TextButton(
//                       onPressed: () {},
//                       style: TextButton.styleFrom(
//                           backgroundColor: Colors.white,
//                           side: BorderSide(color: Colors.grey, width: 1.0)),
//                       child: Text(
//                         "Message",
//                         style: TextStyle(
//                           color: Colors.black,
//                         ),
//                       ),
//                     ),
//                   ),
//                   ListTile(
//                     leading: CircleAvatar(
//                       backgroundColor: Colors.black,
//                       radius: 15,
//                       child: CircleAvatar(
//                         radius: 14,
//                         backgroundColor: Colors.white,
//                         child: CircleAvatar(
//                           radius: 13,
//                           backgroundImage:
//                               ExactAssetImage("Assets/images/aloy-frozen.gif"),
//                         ),
//                       ),
//                     ),
//                     title: Text("Aryan started following you. 6d"),
//                     trailing: Container(
//                       child: TextButton(
//                         style: TextButton.styleFrom(
//                             backgroundColor: Colors.blueAccent),
//                         onPressed: () {},
//                         child: Text(
//                           "Follow",
//                           style: TextStyle(
//                             color: Colors.white,
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             Column(
//               children: [
//                 ListTile(
//                   leading: Text("This Month"),
//                 ),
//                 ListTile(
//                   leading: CircleAvatar(
//                     backgroundColor: Colors.black,
//                     radius: 15,
//                     child: CircleAvatar(
//                       radius: 14,
//                       backgroundColor: Colors.white,
//                       child: CircleAvatar(
//                         radius: 13,
//                         backgroundImage:
//                             ExactAssetImage("Assets/images/aloy-op.jpg"),
//                       ),
//                     ),
//                   ),
//                   title: Text("JustAry27 liked your photo. 3h"),
//                   trailing: Container(
//                     height: 45,
//                     width: 40,
//                     child: Image(
//                       image: AssetImage("Assets/images/aloy.gif"),
//                       fit: BoxFit.cover,
//                     ),
//                   ),
//                 ),
//                 ListTile(
//                   leading: CircleAvatar(
//                     backgroundColor: Colors.black,
//                     radius: 15,
//                     child: CircleAvatar(
//                       radius: 14,
//                       backgroundColor: Colors.white,
//                       child: CircleAvatar(
//                         radius: 13,
//                         backgroundImage:
//                             ExactAssetImage("Assets/images/aloy-op.jpg"),
//                       ),
//                     ),
//                   ),
//                   title: Text("JustAry27 liked your photo. 15d"),
//                   trailing: Container(
//                     height: 45,
//                     width: 40,
//                     child: Image(
//                       image: AssetImage("Assets/images/aloy.gif"),
//                       fit: BoxFit.cover,
//                     ),
//                   ),
//                 ),
//                 ListTile(
//                   leading: CircleAvatar(
//                     backgroundColor: Colors.black,
//                     radius: 15,
//                     child: CircleAvatar(
//                       radius: 14,
//                       backgroundColor: Colors.white,
//                       child: CircleAvatar(
//                         radius: 13,
//                         backgroundImage:
//                             ExactAssetImage("Assets/images/aloy-op.jpg"),
//                       ),
//                     ),
//                   ),
//                   title: Text("JustAry27 liked your photo. 20d"),
//                   trailing: Container(
//                     height: 45,
//                     width: 40,
//                     child: Image(
//                       image: AssetImage("Assets/images/aloy.gif"),
//                       fit: BoxFit.cover,
//                     ),
//                   ),
//                 ),
//                 ListTile(
//                   leading: CircleAvatar(
//                     backgroundColor: Colors.black,
//                     radius: 15,
//                     child: CircleAvatar(
//                       radius: 14,
//                       backgroundColor: Colors.white,
//                       child: CircleAvatar(
//                         radius: 13,
//                         backgroundImage:
//                             ExactAssetImage("Assets/images/aloy-op.jpg"),
//                       ),
//                     ),
//                   ),
//                   title: Text("JustAry27 liked your photo. 25d"),
//                   trailing: Container(
//                     height: 45,
//                     width: 40,
//                     child: Image(
//                       image: AssetImage("Assets/images/aloy.gif"),
//                       fit: BoxFit.cover,
//                     ),
//                   ),
//                 ),
//                 ListTile(
//                   leading: CircleAvatar(
//                     backgroundColor: Colors.black,
//                     radius: 15,
//                     child: CircleAvatar(
//                       radius: 14,
//                       backgroundColor: Colors.white,
//                       child: CircleAvatar(
//                         radius: 13,
//                         backgroundImage:
//                             ExactAssetImage("Assets/images/aloy-op.jpg"),
//                       ),
//                     ),
//                   ),
//                   title: Text("JustAry27 liked your photo. 27d"),
//                   trailing: Container(
//                     height: 45,
//                     width: 40,
//                     child: Image(
//                       image: AssetImage("Assets/images/aloy.gif"),
//                       fit: BoxFit.cover,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//       bottomNavigationBar: BottomNavigationBar(
//         showSelectedLabels: false,
//         showUnselectedLabels: false,
//         onTap: (int) {},
//         items: [
//           BottomNavigationBarItem(
//             icon: IconButton(
//               onPressed: (){
//                 Navigator.of(context).pushNamed('/home');
//               },
//               icon:Icon(Icons.home_filled),
//               color: Colors.black,
//             ),
//             label: "",
//           ),
//           BottomNavigationBarItem(
//             icon: IconButton(
//               onPressed: (){
//                 Navigator.of(context).pushNamed('/search');
//               },
//               icon: Icon(Icons.search_rounded),
//               color: Colors.black,
//             ),
//             label: "",
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(
//               Icons.add_box_outlined,
//               color: Colors.black,
//             ),
//             label: "",
//           ),
//           BottomNavigationBarItem(
//             icon: IconButton(
//               onPressed: (){
//                 Navigator.of(context).pushNamed('/activity');
//               },
//               icon: Icon(Icons.favorite_border_rounded),
//               color: Colors.black,
//             ),
//             label: "",
//           ),
//           BottomNavigationBarItem(
//               icon: CircleAvatar(
//                 backgroundColor: Colors.black,
//                 radius: 13,
//                 child: CircleAvatar(
//                   radius: 12.5,
//                   backgroundColor: Colors.white,
//                   child: IconButton(
//                     onPressed: (){
//                       Navigator.of(context).pushNamed('/profile');
//                     },
//                     icon: CircleAvatar(
//                       radius: 11,
//                       backgroundImage:
//                       ExactAssetImage("Assets/images/aloy-op.jpg"),
//                     ),
//                   ),
//                 ),
//               ),
//               label: "")
//         ],
//       ),
//     );
//   }
// }
//
// final search_data = [
//   'IGTV',
//   'Shop',
//   'Space',
//   '&|_OY',
//   'Horizon Zero Dawn',
//   'Shepherd',
//   'Sports',
//   'Flutter',
//   'Table Tennis',
//   'Reels',
//   '3 Men in a boat'
// ];
//
// class SearchScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.white70,
//         title: TextField(
//           obscureText: false,
//           decoration: InputDecoration(
//             fillColor: Colors.grey,
//             enabledBorder: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(5),
//               borderSide: BorderSide(
//                 width: 2.0,
//                 color: Colors.grey.shade700,
//               ),
//             ),
//             contentPadding: EdgeInsets.fromLTRB(20, 0, 0, 0),
//             // border
//             labelText: "Search",
//           ),
//         ),
//         actions: [
//           IconButton(
//             icon: Icon(
//               Icons.backpack_outlined,
//               color: Colors.black,
//             ),
//             onPressed: () {},
//           )
//         ],
//       ),
//       body: Container(
//         child: Column(
//           children: [
//             Container(
//               padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
//               child: Container(
//                 height: 50,
//                 child: ListView.builder(
//                   shrinkWrap: true,
//                   itemCount: search_data.length,
//                   scrollDirection: Axis.horizontal,
//                   itemBuilder: (context, index) {
//                     return Container(
//                       padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
//                       child: TextButton(
//                         onPressed: () {},
//                         child: Text(
//                           search_data[index],
//                           style: TextStyle(color: Colors.black),
//                         ),
//                         style: TextButton.styleFrom(
//                             backgroundColor: Colors.white,
//                             side: BorderSide(width: 1.0, color: Colors.black)),
//                       ),
//                     );
//                   },
//                 ),
//               ),
//             ),
//             Container(
//               constraints: BoxConstraints(maxHeight: 820),
//               child: StaggeredGridView.countBuilder(
//                   shrinkWrap: true,
//                   crossAxisCount: 2,
//                   itemCount: gridAssets.length,
//                   itemBuilder: (content, index) {
//                     return Column(
//                       children: [
//                         Image(
//                           image: AssetImage(gridAssets[index]),
//                           fit: BoxFit.cover,
//                         ),
//                       ],
//                     );
//                   },
//                   staggeredTileBuilder: (index) => StaggeredTile.fit(1)),
//             ),
//           ],
//         ),
//       ),
//       bottomNavigationBar: BottomNavigationBar(
//         showSelectedLabels: false,
//         showUnselectedLabels: false,
//         onTap: (int) {},
//         items: [
//           BottomNavigationBarItem(
//             icon: IconButton(
//               onPressed: (){
//                 Navigator.of(context).pushNamed('/home');
//               },
//               icon:Icon(Icons.home_filled),
//               color: Colors.black,
//             ),
//             label: "",
//           ),
//           BottomNavigationBarItem(
//             icon: IconButton(
//               onPressed: (){
//                 Navigator.of(context).pushNamed('/search');
//               },
//               icon: Icon(Icons.search_rounded),
//               color: Colors.black,
//             ),
//             label: "",
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(
//               Icons.add_box_outlined,
//               color: Colors.black,
//             ),
//             label: "",
//           ),
//           BottomNavigationBarItem(
//             icon: IconButton(
//               onPressed: (){
//                 Navigator.of(context).pushNamed('/activity');
//               },
//               icon: Icon(Icons.favorite_border_rounded),
//               color: Colors.black,
//             ),
//             label: "",
//           ),
//           BottomNavigationBarItem(
//               icon: CircleAvatar(
//                 backgroundColor: Colors.black,
//                 radius: 13,
//                 child: CircleAvatar(
//                   radius: 12.5,
//                   backgroundColor: Colors.white,
//                   child: IconButton(
//                     onPressed: (){
//                       Navigator.of(context).pushNamed('/profile');
//                     },
//                     icon: CircleAvatar(
//                       radius: 11,
//                       backgroundImage:
//                           ExactAssetImage("Assets/images/aloy-op.jpg"),
//                     ),
//                   ),
//                 ),
//               ),
//               label: "")
//         ],
//       ),
//     );
//   }
// }
