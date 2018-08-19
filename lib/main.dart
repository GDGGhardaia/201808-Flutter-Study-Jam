import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

///  Mobile application to calculate the Body Mass Index BMI
///  Created using Flutter as a part of the Flutter Workshop
///  held in Google Developers Group chapter of Ghardaia - Algeria
///  Made by : Elbez Hammouda


// Main function to start the application
void main(){
  // prevent the application from rotating in landscape mode
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp,DeviceOrientation.portraitDown]);
  // run the app by creating a new instance of the App class
  runApp(new App());
}

  // App class that represent the Application
  class App extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // setting some global parameters for the application such as theme, the home screen and the title
    return new MaterialApp(
      title: "BMI",
      theme: new ThemeData(
        primarySwatch: Colors.brown
      ),
      home: new First(),
    );
  }
  }

  // "First" represent home screen of the application
  class First extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // Statefull widget need another class which is state which contains all the UI & Actions implementation
    return new First_state();
  }}

  // the State of "First" screen
  class First_state extends State<First>{

  // Controllers for the TextField in order to get their value easily
  TextEditingController controller_height = new TextEditingController();
  TextEditingController controller_weight = new TextEditingController();

  // variable that holds the calculation result
  double result ;
  // variable that holds the value of the heart icon
  Color color = Colors.brown;

  // function where the calculation of the BMI value happens
  void calculate(){
    // test if the two fields are not empty
    if(controller_weight.text.isNotEmpty && controller_height.text.isNotEmpty){
    // do the calculation
      result = double.parse(controller_weight.text) / (double.parse(controller_height.text) * double.parse(controller_height.text));
    // Always update GUI using this function in Flutter
      setState(() {
    // Doing tests based on the result of the calculation
   if(result < 18.5){
    // changing the value of the Heart icon
     color = Colors.red;
     }else if (result < 25){
     // changing the value of the Heart icon
     color = Colors.green;
   }else{
     // changing the value of the Heart icon
     color = Colors.deepPurple;
   }
      });
    }
  }
  // Creating the User interface of the application
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      // prevent the keyboard from pushing up the elements when shown
      resizeToAvoidBottomPadding: false,
      // add appBar
      appBar: new AppBar(
        centerTitle: true,
        title: new Text("BMI"),),
      // add the body of the screen
      body: new Material(
        color: Colors.brown[100],
        child:
            new Container(
              // Use Container to add margin to elements on the screen
              margin: EdgeInsets.only(left: 20.0, right: 20.0),
              child: Builder(builder: (context) => (
                  Center(
                      child: new Column(
                        // wrap everything inside a Column to make it easy to organise the elements
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            new Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  // adding text element
                                  new Text(
                                    "Body Mass Index",
                                    style: new TextStyle(fontSize:18.0,
                                      color: const Color(0xFF8c530c),
                                      fontWeight: FontWeight.bold,),
                                  )
                                ]),
                            // adding padding between the two elements
                            new Padding(padding: EdgeInsets.all(15.0))
                            ,
                            // adding anoother Column with Rows in order to show the meaning of the colors to the user
                            new Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  // Adding a row
                                  new Row(
                                    children: <Widget>[
                                      new CircleAvatar(
                                        backgroundColor: Colors.red,
                                        radius: 5.0,
                                      ),
                                      new Padding(padding: EdgeInsets.all(5.0))
                                      ,
                                      new Text(
                                        "Skinny",
                                        style: new TextStyle(fontSize:12.0,
                                          color: const Color(0xFF8c530c),
                                          fontWeight: FontWeight.bold,),
                                      )
                                    ],
                                  ),
                                  new Padding(padding: EdgeInsets.all(2.0))
                                  ,
                                  // Adding a row
                                  new Row(
                                      children: <Widget>[
                                        new CircleAvatar(
                                          backgroundColor: Colors.green,
                                          radius: 5.0,
                                        ),
                                        new Padding(padding: EdgeInsets.all(5.0))
                                        ,
                                  new Text(
                                    "Normal",
                                    style: new TextStyle(fontSize:12.0,
                                      color: const Color(0xFF8c530c),
                                      fontWeight: FontWeight.bold,),
                                  )]),
                                  new Padding(padding: EdgeInsets.all(2.0))
                                  ,
                                  // Adding a row
                                  new Row(
                                  children: <Widget>[
                                  new CircleAvatar(
                                    backgroundColor: Colors.deepPurple,
                                    radius: 5.0,
                                  ),
                                  new Padding(padding: EdgeInsets.all(5.0))
                                        , new Text(
                                    "Overweight",
                                    style: new TextStyle(fontSize:12.0,
                                      color: const Color(0xFF8c530c),
                                      fontWeight: FontWeight.bold,),
                                  )
                                ])])
                            ,
                            new Padding(padding: EdgeInsets.all(15.0))
                            ,
                            // Adding TextField to get input from the user
                            new TextField(
                              decoration: new InputDecoration(
                                  hintText: "",
                                  icon: new Icon(Icons.accessibility),
                                  labelText: "Height"
                              ),
                              keyboardType: TextInputType.number
                              ,
                              controller: controller_height,

                            ),
                            new Padding(padding: EdgeInsets.all(25.0)),
                            // Adding TextField to get input from the user
                            new TextField(
                              decoration: new InputDecoration(
                                  hintText: "",
                                  icon: new Icon(Icons.line_weight),
                                  labelText: "Weight"
                              ),
                              keyboardType: TextInputType.number
                              ,
                              controller: controller_weight,

                            ),
                            new Padding(padding: EdgeInsets.all(10.0))
                            ,
                            // Adding the heart icon to show result of the calculation to the user
                            new Icon(Icons.favorite, size: 80.0,color: color,),
                            new Padding(padding: EdgeInsets.all(10.0)),
                            // Adding a button
                            new FlatButton(key:null, onPressed: () => calculate(),
                                color: Colors.brown,
                                padding: EdgeInsets.all(15.0),
                                child: new Text(
                                  "Calculate",
                                  style: new TextStyle(fontSize:15.0,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600,
                                      fontFamily: "Merriweather"),
                                )
                            )
                          ]

                      )
                  )
              )),
            )
        ,)

    );
  }

  }