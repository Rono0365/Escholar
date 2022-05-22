import 'package:collection/collection.dart';
import 'package:escholar/communications.dart';
import 'package:escholar/Transit.dart';
import 'package:escholar/drawer.dart';
//import 'package:escholar/.dart';
import 'package:escholar/events.dart';
import 'package:escholar/noticeboard.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'SplashScreen.dart';
import 'package:shimmer/shimmer.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Floopedu',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // is not restarted.
        primarySwatch: Colors.deepPurple,
      ),
      home: screen(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, 
      required this.title,
      required this.token,
      required this.userid
  
  }) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;
  final String token;
  final String userid;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  var value;
  var subjects;
  var value2;
  var leo;
  var now;
  var week_area;
  
  Future getWeather() async {
    String token = widget.token.toString();
    print(token);
    print(widget.token);// wasn't easy but never stopped
    var headers = {
      'Authorization': 'Token $token',
    };
    final responsex = await http.get(
      Uri.parse('http://192.168.100.20:8000/homework/'),headers: headers
    ); //headers: headers
    final responsev = await http.get(
      Uri.parse('http://192.168.100.20:8000/students/'),headers: headers
      // Send authorization headers to the backend.
    ); //headers: headers
    //http.Response responsex = await http
    //  .get(Uri.parse('http://192.168.100.20:8000/id/1/')); //get via token
    http.Response response1 = await http.get(
      Uri.parse('http://192.168.100.20:8000/units/'),
   headers: headers ); //get via token headers: headers

    //var result5 = jsonDecode(responsev.body);
    //var result1 = jsonDecode(response1.body); //returns json body from api
    var results = jsonDecode(responsev.body); //returns json body from api
    var resultx = jsonDecode(responsex.body);
    setState(() {
      //DateFormat('EEEE').format(date);
      this.week_area = DateFormat(' d MMM').format(DateTime.now());
      this.leo = DateFormat('EEEE').format(DateTime.now());
      this.now = DateFormat('EEEE d MMM')
          .format(DateTime.now()); //returns json body from api

      //this.courseblock = result1;
    }); //subjects
    setState(() {
      this.value = results;
      this.value2 = resultx;
    });
    setState(() {
    //  this.subjects = results['Subjects'];
    });

    print(value2.toString());
  }

  List<IconData> listicon = [
    Icons.receipt_long,
    Icons.account_balance,

    Icons.call,
    Icons.group,
    Icons.question_answer,
    Icons.calendar_today,
    //Icons.exit_to_app,
  ];
  List<IconData> lbottom = [
    Icons.school_outlined,
    Icons.calendar_today_outlined,
    Icons.notifications_outlined,
    Icons.directions_bus,
  ];
  List lbottomtext = ["Dashboard", "TimeTable", "Info", "Transit"];
  List courseblock = [
    [
      "EnvironMental Sustainability",
      "2hr45min",
      "Week9",
      "Topic",
      "G13-physical",
      "8:00AM"
    ],
    [
      "EnvironMental Sustainability",
      "2hr45min",
      "Week9",
      "Title",
      "G13-physical",
      "8:00AM"
    ],
    [
      "EnvironMental Sustainability",
      "2hr45min",
      "Week9",
      "Title",
      "G13-physical",
      "8:00AM"
    ],
  ];
  List drawer = [
    'Grades/Reportbook',
    'fees',
    'contact us',
    'Teachers',
    'Get help',
    'School calendar',
  ];
  List drawerpath = [
    Gradebook(),
    fees(),
    contacts(),
    teachers(),
    help(),
    cal(),
  ];
  List timetable = [
    [
      "Friday",
      "Environmental Sustainability",
      ["2hr45min", "Week9", "Topic", "G13-physical"]
    ],
    [
      "Friday",
      "Environmental Sustainability",
      ["2hr45min", "Week9", "Topic", "G13-physical"]
    ],
    [
      "Friday",
      "Environmental Sustainability",
      ["2hr45min", "Week9", "Topic", "G13-physical"]
    ],
    [
      "Friday",
      "Environmental Sustainability",
      ["2hr45min", "Week9", "Topic", "G13-physical"]
    ]
  ];
  //TabController _tabController;
  @override
  void initState() {
    super.initState();
    this.getWeather();
  }

  @override
  Widget build(BuildContext context) {
    return value == null && value2 == null
                ? Scaffold(
        backgroundColor: Colors.white,body:Center(
                    child: CircularProgressIndicator(),
                  ))
                : Scaffold(
        backgroundColor: Colors.white,
        drawer: Drawer(
            child: Scaffold(
          backgroundColor: Colors.white,
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(70.0),
            child: AppBar(
              backgroundColor: Colors.white,
              elevation: 0.0,
              iconTheme: IconThemeData(color: Colors.black),
              actions: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: CircleAvatar(
                    radius: 30,
                    child: Icon(Icons.person),
                  ),
                )
              ],
            ),
          ), // here the desired height(child: AppBar()),
          body:Column(
    children: <Widget>[
       SingleChildScrollView(
            child: Column(
              children: [
                ListTile(
                  title: Container(
                    //height: MediaQuery.of(context).size.height*0.3,
                    child: Text( '${value[0]["firstname"]} ${value[0]["lastname"].toString()}',
                        style: GoogleFonts.lato(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey.shade900)),
                  ),
                  subtitle: Text(value[0]["School"]),
                  trailing: Text("Class:\n"+value[0]["Class"]),
                ),

                Container(
                  height: MediaQuery.of(context).size.height * 0.55,
                  child:  ListView.builder(
                      itemCount: listicon.length,
                      itemBuilder: (context, index) {
                        var iconz = drawer[index];
                        var path = drawerpath[index];
                        var datex = listicon[index];
                        return ListTile(
                          leading: Icon(
                            datex,
                            color: Colors.deepPurple,
                          ),
                          title: Text(iconz),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => path //screen(),
                                  ), //MaterialPageRoute
                            );
                            //gotcha
                          },
                        );
                      },
                    ),
                  
                ),
                ListTile(
                  leading: Icon(
                    Icons.exit_to_app,
                    color: Colors.red,
                  ),
                  title: Text("log out"),
                  onTap: () {
                    //get out of my app
                  },
                ),
                Text("© 2022"), //permanent
                Text("Floopedu.",
                    style: GoogleFonts.lato(
                        fontWeight: FontWeight.bold, color: Colors.deepPurple)),

                //Text("#rono was here"),
              ],
            ),
          ),])
        )),
        //where tab goes
        appBar: AppBar(
          actions: [
            FloatingActionButton(
              onPressed: () {
                
                                                          showModalBottomSheet(
                                                            isScrollControlled:true,
                  
                  context: context,
                  builder: (context) {
                   //  sum = 0;
    //var given_list = [1, 2, 3, 4, 5];
    
    
                    return Scaffold(
          backgroundColor: Colors.white,
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(70.0),
            child: AppBar(
              backgroundColor: Colors.white,
              elevation: 0.0,
              iconTheme: IconThemeData(color: Colors.black),
              
            ),
          ), // here the desired height(child: AppBar()),
          body: SingleChildScrollView(
            child: Column(
              children: [
                ListTile(title:Text('')),
                ListTile(
                  title: Container(
                    //height: MediaQuery.of(context).size.height*0.3,
                    child: Text( '${value[0]["firstname"]} ${value[0]["lastname"].toString()}',
                        style: GoogleFonts.lato(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey.shade900)),
                  ),
                  subtitle: Text("Adm: "+value[0]["adm_no"]),
                  //trailing: Text("Class:"+value[0]["Class"]),
                ),
                ListTile(subtitle:Text(value[0]["School"]+'\n'+"Class: "+value[0]["Class"]+'\n'+"Subjects: "+(value[0]["Subjects"].length).toString())),
                //ListTile(subtitle:Text()),
                ListTile(),

                Container(
                  height: MediaQuery.of(context).size.height * 0.55,
                  child: ListView.builder(
                      itemCount: listicon.length,
                      itemBuilder: (context, index) {
                        var iconz = drawer[index];
                        var path = drawerpath[index];
                        var datex = listicon[index];
                        return ListTile(
                          leading: Icon(
                            datex,
                            color: Colors.deepPurple,
                          ),
                          title: Text(iconz),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => path //screen(),
                                  ), //MaterialPageRoute
                            );
                            //gotcha
                          },
                        );
                      },
                    ),
                  
                ),
                ListTile(
                  leading: Icon(
                    Icons.exit_to_app,
                    color: Colors.red,
                  ),
                  title: Text("log out"),
                  onTap: () {
                    //get out of my app
                  },
                ),
                
                //Text("#rono was here"),
              ],
            ),
          ),
        );
                  });
              },
              backgroundColor: Colors.white,
              elevation: 0.0,
              mini: true,
              child: Center(
                  child: Stack(children: [
                Icon(Icons.person_outlined, color: Colors.deepPurple),
                Positioned(
                    top: 0,
                    right: 2,
                    child: CircleAvatar(
                      radius: 4,
                      backgroundColor: Colors.white,
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 6,
                      ),
                    ))
              ])),
            )
          ],
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 0.0,
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.assets/eScholar001-removebg-preview.png'
          title: Shimmer.fromColors(
            baseColor: Colors.deepPurple,
            highlightColor: Colors.deepPurple.shade300,
            child: InkWell(
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Text(value[0]["School"].toString(),
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 17,
                          fontWeight: FontWeight.bold))
                ]),
                onTap: () {
                  getWeather();
                }),
          ),
          iconTheme: IconThemeData(color: Colors.black),
        ),
        body: DefaultTabController(
          length: lbottom.length,
          child: Scaffold(
            backgroundColor: Colors.white,
            bottomNavigationBar: SizedBox(height:MediaQuery.of(context).size.height*0.07,width:MediaQuery.of(context).size.height*0.1,child:TabBar(
              labelColor: Colors.purple,
              //controller: lbottomtext,
              indicatorSize: TabBarIndicatorSize.tab,
              unselectedLabelColor:Colors.deepPurple,
              indicator: UnderlineTabIndicator(
                  borderSide: BorderSide(
                    //height:1.0,
                    width: 1.0,
                    color:Colors.deepPurple,
                  ),
                  insets: EdgeInsets.symmetric(horizontal: 36.0)),
              tabs: [
                //final
                //labelColor: Colors.purple,
                ...IterableZip([lbottom, lbottomtext]).map(
                  (i) => Tab(
                    //labelColor: Colors.purple,
                    //indicatorColor: Colors.
                    icon: CircleAvatar(
                      radius: 17,
                      backgroundColor: i != null?Colors.deepPurple:Colors.white,
                      child: Icon(
                        i[0],
                        color: Colors.white,
                      ),
                    ),
                    child: Text(i[1],
                        style: TextStyle(
                            fontSize: 12,
                            overflow: TextOverflow.ellipsis,
                            fontWeight: FontWeight.bold,
                            color: Colors.black)),
                    //text: ,
                    //  backgroundColor: Colors.grey[50],
                  ),
                ),
              ],
            )),
            body: value == null && value2 == null
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : TabBarView(children: [
                    SingleChildScrollView(
                        // Center is a layout widget. It takes a single child and positions it
                        // in the middle of the parent.
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                          ListTile(
                            leading: Text("Subjects",
                                style: TextStyle(
                                  color: Colors.grey[900],
                                  fontWeight: FontWeight.bold,
                                  fontSize: 19,
                                )),
                            trailing: CircleAvatar(
                                radius: 10,
                                //backgroundColor: Colors.deepPurple,
                                child: Center(
                                    child: Text(
                                        value[0]["Subjects"].length.toString(),
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                        )))),
                          ),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Wrap(
                              spacing: 10.0,
                              children: [
                                ...value[0]["Subjects"].map((i) => InkWell(
                                      child: Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.5,
                                        child: Material(
                                            color: Colors.deepPurple.shade50
                                                .withOpacity(0.5),
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(20.0),
                                                topRight: Radius.circular(20.0),
                                                bottomLeft:
                                                    Radius.circular(20.0),
                                                bottomRight:
                                                    Radius.circular(20.0),
                                              ),
                                            ),
                                            child: Card(
                                              elevation: 0.0,
                                              color: Colors.grey.shade50
                                                  .withOpacity(0.2),
                                              child: Column(
                                                children: [
                                                  ListTile(
                                                    title: Text(
                                                        i['headline']
                                                            .toString(),
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold)),
                                                    trailing: InkWell(
                                                        onTap: () {
                                                          showModalBottomSheet(
                  context: context,
                  builder: (context) {
                   //  sum = 0;
    //var given_list = [1, 2, 3, 4, 5];
    
    
                    return Scaffold(
      backgroundColor:Colors.white,
      appBar:AppBar(centerTitle:true,title:Text(i['headline'],style:TextStyle(color:Colors.black)),elevation:0.0,backgroundColor:Colors.white)
      ,body:SingleChildScrollView(child:Column(children: [
        /*
        "headline":"Technology","day_taught":"Thursday","time_duration":"2 hours","time_taught":"8:00 am","code":"001","teacher":"Teacher mindo","place_taught":"auditorium"
        */
      ListTile(leading:Icon(Icons.calendar_today),title:Text("Day Taught"),subtitle:Text(i['day_taught'])),
      ListTile(leading:Icon(Icons.av_timer),title:Text("Time Duration"),subtitle:Text(i['time_duration'])),
      ListTile(leading:Icon(Icons.now_widgets),title:Text("Code"),subtitle:Text(i['code'])),
      ListTile(leading:Icon(Icons.person_outlined),title:Text("Teacher"),subtitle:Text(i['teacher'])),
      ListTile(leading:Icon(Icons.place),title:Text("Place Taught"),subtitle:Text(i['place_taught'])),
    ],)),
    //bottoma navigation bar
    
        
    );
                  });
                                                        },
                                                        child: Icon(
                                                            Icons.info_outline,
                                                            color: Colors
                                                                .deepPurple)),
                                                    subtitle: Text(i['teacher']
                                                        .toString()),
                                                  ),
                                                  SizedBox(
                                                    height: 10,
                                                  ),
                                                  ListTile(
                                                    //title:Text("Students"),
                                                    subtitle: Row(children: [
                                                      Stack(
                                                        clipBehavior: Clip.none, 
                                                        children: [
                                                          CircleAvatar(
                                                              radius: 13,
                                                              backgroundColor: Colors.white,
                                                              ),
                                                          Positioned(
                                                              top: 2,
                                                              right: 3,
                                                              child:
                                                                  CircleAvatar(
                                                                radius: 10,
                                                                backgroundColor:
                                                                    Colors
                                                                        .deepPurple,
                                                                child: CircleAvatar(
                                                                    backgroundColor: Colors.white,
                                                                    radius: 9,
                                                                    child: Center(
                                                                        child: Icon(
                                                                      Icons
                                                                          .location_pin,
                                                                      size: 15,
                                                                      color: Colors
                                                                        .deepPurple,
                                                                    ))),
                                                              ))
                                                        ],
                                                      ),
                                                      SizedBox(
                                                        width: MediaQuery.of(context).size.width*0.01,
                                                      ),
                                                      Text(i['place_taught'],
                                                          style: TextStyle(
                                                              fontSize: 12,
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              color:
                                                                  Colors.black))
                                                    ]),
                                                    title: Row(
                                                      children: [
                                                        Text("code: ${i['code']}",
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                            style: TextStyle(
                                                              fontSize: 13,
                                                            ))
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            )),
                                      ),
                                      onTap: () {
                                        /* Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => Chatscreen(
                                                    titlex: i['unit_name'],
                                                    title: i,
                                                  ) //screen(),
                                              ), //MaterialPageRoute
                                        );*/
                                      },
                                    ))
                              ],
                            ),
                          ),
                          ListTile(
                            onTap: () {
                              showModalBottomSheet(
                  context: context,
                  builder: (context) {
                   //  sum = 0;
    //var given_list = [1, 2, 3, 4, 5];
    
    
                    return Scaffold(
      backgroundColor:Colors.white,
      appBar:AppBar(centerTitle:true,title:Text("Noticeboard",style:TextStyle(color:Colors.black)),elevation:0.0,backgroundColor:Colors.white)
      ,body:SingleChildScrollView(child:Column(children: [
        Card(
            elevation:0.0,
            //backgroundColor: colors.grey,
            child:Column(children:[
            ListTile(
              title:Text("Homework"),


            ),
            
          ...this.value2.map(
            (i) => ListTile(
             
              trailing: CircleAvatar(
                radius: 10,
                backgroundColor: Colors.white,
                child: Center(
                    child: Icon(Icons.notifications,color: Colors.red,size: 12))           ),
              title: Text(
                i['name'].toString(),
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(i['deadline']),
              onTap: () {
                /*Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Chatscreen(
                      titlex: i['unit_name'],
                      title: i,
                    ),
                  ), //MaterialPageRoute
                );*/
                //navigate
              },
            ),
          ),])),
        /*
        "headline":"Technology","day_taught":"Thursday","time_duration":"2 hours","time_taught":"8:00 am","code":"001","teacher":"Teacher mindo","place_taught":"auditorium"
        */
      ],)),
    //bottoma navigation bar
    
        
    );
                  });
                              
                            },
                            leading: Icon(Icons.pin_drop_outlined,
                                color: Colors.deepPurple),
                            title: Text("Noticeboard",
                                style: TextStyle(
                                  color: Colors.grey[900],
                                  fontWeight: FontWeight.bold,
                                )),
                            trailing: InkWell(
                              child: Stack(
                               clipBehavior: Clip.none,
                                children: [
                                  CircleAvatar(
                                      radius: 13,
                                      //backgroundColor: Colors.deepPurple,
                                      child: Center(
                                          child: RotatedBox(
                                              quarterTurns: 90,
                                              child: Icon(
                                                Icons.arrow_back_ios_new,
                                                size: 12,
                                                color: Colors.white,
                                              )))),
                                  Positioned(
                                      top: -5,
                                      right: 0,
                                      child: CircleAvatar(
                                        radius: 7,
                                        backgroundColor: Colors.white,
                                        child: CircleAvatar(
                                          backgroundColor: Colors.red,
                                          radius: 6,
                                        ),
                                      ))
                                ],
                              ),
                              onTap: () {
                                communications(title1: value2);
                              },
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            //height: MediaQuery.of(context).size.width * 0.58,
                            child: Card(
                              elevation: 0.0,
                              color: Colors.grey.shade200.withOpacity(0.1),
                              child: Column(
                                children: [
                                  ListTile(
                                    leading: Icon(
                                      Icons.library_books,
                                      color: Colors.deepPurple,
                                    ),
                                    title: Text(value2.toList().length <= 1?"No Homework!":"Today's Homework"),
                                    trailing: Chip(
                                      label: now != null
                                          ? Text(now,
                                              style: TextStyle(
                                                  color: Colors.grey[900]))
                                          : Text("Today"),
                                    ),
                                  ),
                                  SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Wrap(
                                      spacing: 10.0,
                                      children: [
                                        ...value2.toList().map((i) =>
                                            InkWell(
                                              child: Container(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.45,
                                                child: Material(
                                                    color: Colors.grey.shade200
                                                        .withOpacity(0.4),
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.only(
                                                        topLeft:
                                                            Radius.circular(
                                                                20.0),
                                                        topRight:
                                                            Radius.circular(
                                                                20.0),
                                                        bottomLeft:
                                                            Radius.circular(
                                                                20.0),
                                                        bottomRight:
                                                            Radius.circular(
                                                                20.0),
                                                      ),
                                                    ),
                                                    child: Card(
                                                      elevation: 0.0,
                                                      color: Colors.grey.shade50
                                                          .withOpacity(0.2),
                                                      child: Column(
                                                        children: [
                                                          ListTile(
                                                            title: Text(i['name'].toString(),
                                                                style: TextStyle(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold)),
                                                            trailing: Column(
                                                                children: [
                                                                  SizedBox(
                                                                    height: 5,
                                                                  ),
                                                                ]),
                                                            subtitle: Text(
                                                                "Topics:"),
                                                          ),
                                                          ListTile(
                                                            title: Text("this week's topic")),
                                                          
                                                        ],
                                                      ),
                                                    )),
                                              ),
                                              onTap: () {
                                                /* Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => Chatscreen(
                                                      titlex: i['unit_name'],
                                                      title: i,
                                                    ) //screen(),
                                                ), //MaterialPageRoute
                                          );*/
                                              },
                                            ))
                                      ],
                                    ),
                                  ),
                                  //Timeline here

                                  SizedBox(
                                    height: 15,
                                  )
                                ],
                              ),
                            ),
                          ),
                          ListTile(
                            title: Text("Today's Class",
                                style: TextStyle(
                                  color: Colors.grey[900],
                                  fontWeight: FontWeight.bold,
                                )),
                            subtitle: now != null
                                ? Text(now,
                                    style: TextStyle(color: Colors.grey[900]))
                                : Text("Today"),
                          ),
                          Container(
                            padding: EdgeInsets.all(10.0),
                            child: 

                                  //Row with the assignments hii ya down
                                  //SizedBox(height: 25),

                                  Wrap(
                                //holla
                                spacing: 10.0,
                                //crossAxisAlignment: WrapCrossAlignment.center,
                                runSpacing: 5.0,
                                // scrollDirection: Axis.horizontal, //MediaQuery.of(context).size.width;
                                children: [
                                  ...value[0]["Subjects"].toList().map(
                                        (i) => i['day_taught'].toString() ==
                                                leo.toString()
                                            ? Material(
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(10.0),
                                                    topRight:
                                                        Radius.circular(10.0),
                                                    bottomLeft:
                                                        Radius.circular(10.0),
                                                    bottomRight:
                                                        Radius.circular(10.0),
                                                  ),
                                                ),
                                                child: ListTile(
                                                  title: Text(
                                                      i['headline'].toString(),
                                                      ),
                                                  subtitle: Row(children: [
                                                    Chip(
                                                      //padding: EdgeInsets.all(5.0),
                                                      
                                                      label: Text(
                                                        i['time_taught'].toString(),
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color: Colors
                                                                .purple[900]),
                                                      ),
                                                      backgroundColor:
                                                          Colors.grey[50],
                                                  )]),
                                                    trailing: InkWell(
                                                        onTap: () {
                                                          showModalBottomSheet(
                  context: context,
                  builder: (context) {
                   //  sum = 0;
    //var given_list = [1, 2, 3, 4, 5];
    
    
                    return Scaffold(
      backgroundColor:Colors.white,
      appBar:AppBar(centerTitle:true,title:Text(i['headline'],style:TextStyle(color:Colors.black)),elevation:0.0,backgroundColor:Colors.white)
      ,body:SingleChildScrollView(child:Column(children: [
        /*
        "headline":"Technology","day_taught":"Thursday","time_duration":"2 hours","time_taught":"8:00 am","code":"001","teacher":"Teacher mindo","place_taught":"auditorium"
        */
      ListTile(leading:Icon(Icons.calendar_today),title:Text("Day Taught"),subtitle:Text(i['day_taught'])),
      ListTile(leading:Icon(Icons.av_timer),title:Text("Time Duration"),subtitle:Text(i['time_duration'])),
      ListTile(leading:Icon(Icons.av_timer),title:Text("Time:"),subtitle:Text(i['time_taught'])),
      
      ListTile(leading:Icon(Icons.now_widgets),title:Text("Code"),subtitle:Text(i['code'])),
      ListTile(leading:Icon(Icons.person_outlined),title:Text("Teacher"),subtitle:Text(i['teacher'])),
      ListTile(leading:Icon(Icons.place),title:Text("Place Taught"),subtitle:Text(i['place_taught'])),
    ],)),
    //bottoma navigation bar
    
        
    );
                  });
                                                        },
                                                        child: Icon(
                                                            Icons.info_outline,
                                                            color: Colors
                                                                .deepPurple)),
                                                  
                                                ))
                                            : Text(''),
                                      ),
                                ],
                              
                            ),

                            //Expanded(child: Text("NoticeBoard"),)
                          )
                        ])),

//rest of the tabs go here
                    events(title1: value[0]["Subjects"] ),//Timetable
                    communications(title1: value2,),
                    Transit(),
                  ]),
          ),
        ));
    // This trailing comma makes auto-formatting nicer for build methods.
  }
}
//After thought in school esp Riara Uni,places having qr's so that people scan and know the exact location