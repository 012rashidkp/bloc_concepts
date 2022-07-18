import 'package:bloc_concepts/Counter/counter_bloc.dart';
import 'package:bloc_concepts/second.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {

  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          CounterBloc(

          ),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.blue,
        ),
        home: const MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final String title;

  const MyHomePage({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(padding: EdgeInsets.only(left: 0),
                  child: InkWell(
                    onTap: () {
                      context.read<CounterBloc>().add(Decrement());
                    },
                    child: const SizedBox(

                      width: 120,
                      height: 55,
                      child: DecoratedBox(
                        child: Icon(Icons.remove, color: Colors.white,),
                        decoration: BoxDecoration(
                            color: Colors.deepPurple
                        ),
                      ),

                    ),
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: BlocBuilder<CounterBloc, CounterState>(
                      builder: (context, state) {


                        return Text('${state.count}', style: const TextStyle(fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),);
                      },
                    )),
                Padding(padding: EdgeInsets.only(left: 15),
                  child: InkWell(
                    onTap: () {
                      context.read<CounterBloc>().add(Increment());
                    },
                    child: const SizedBox(

                      width: 120,
                      height: 55,
                      child: DecoratedBox(
                        child: Icon(Icons.add, color: Colors.white,),
                        decoration: BoxDecoration(
                            color: Colors.red
                        ),
                      ),

                    ),
                  ),
                ),


              ],
            ),
            Padding(
              padding:  EdgeInsets.only(top: 15),
              child: Align(
                alignment: Alignment.center,
                child: GestureDetector(
                  onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => CovidPage()),
                    );



                  },
                  child: SizedBox(

                    width: 150,
                    height: 55,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        color: Colors.amber,

                      ),
                      child: Center(child: Text( textAlign: TextAlign.center,"Next Page",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18,color: Colors.white),)),
                    ),
                  ),
                ),
              ),
            ),


          ],
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
