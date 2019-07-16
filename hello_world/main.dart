

/*
Copyright (c) 2019, Vidám Szabolcs
All rights reserved.

Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions are met:

1. Redistributions of source code must retain the above copyright notice, this
list of conditions and the following disclaimer.
2. Redistributions in binary form must reproduce the above copyright notice,
this list of conditions and the following disclaimer in the documentation
and/or other materials provided with the distribution.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR
ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
(INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
(INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

The views and conclusions contained in the software and documentation are those
of the authors and should not be interpreted as representing official policies,
    either expressed or implied, in this tutorial project.
*/



import 'package:flutter/material.dart';

void main() => runApp(new AppState());


class AppState extends StatefulWidget{
    App createState() => new App();

}


class App extends State<AppState> {
  @override
  String text = 'Hello world';
  Widget build(BuildContext context) {
    return new MaterialApp(
      home:
        new Scaffold(
          floatingActionButton: new FloatingActionButton.extended(

            onPressed: () => setState((){
                if(this.text == 'Hello world')
                  text = 'Hey világ' ;
                else
                  text = 'Hello world';
              }),

              icon: Icon(Icons.refresh),
              elevation: 10.0,
              label: Text('Change text'),

          ),
            body:
                new Stack(
                  children: <Widget>[

                    new Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(
                                  'https://images.unsplash.com/photo-1517030330234-94c4fb948ebc?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1275&q=80'),
                              fit: BoxFit.cover,
                              )

                          ),
                        child:
                        new Text(
                              //fontos, hogy elöszőr jön a szöveg, és csak utánna a stílus
                            text,
                            style: TextStyle(color: Colors.white),
                          // a szöveg stílusának meghatározása
                        ),

                    ),

                    new Positioned(
                        top: 0.0,
                        left: 0.0,
                        right: 0.0,
                        child: AppBar(
                          title:
                          new Text(
                              'Hello'
                          ),
                          centerTitle: true,
                          backgroundColor: Colors.transparent,
                          elevation: 0.0,
                        )
                    ),
                   
            ]
                )
        ),
    );
  }

}