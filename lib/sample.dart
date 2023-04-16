import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    );
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: Color(0xFFFFE600),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            //margin: EdgeInsets.only(left: MediaQuery.of(context).size.width/4, top: MediaQuery.of(context).size.height/4),
            child: Center(
              child: Text(
                'Camp Yellow',
                style: TextStyle(
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.w700,
                  fontSize: 32,
                  height: 39/32,
                  color: Color(0xFF000000),
                ),
              ),
            ),
          ),
          AnimatedBuilder(
            animation: _animation,
            builder: (context, child) {
              return Transform.translate(
                //_animation.value * 1000
                offset: Offset( 0,-(1 - _animation.value) * MediaQuery.of(context).size.height),
                child: Column(
                  children: [
                    // Add your splash screen here
                    Stack(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height,
                          color: Colors.white,
                          child: Column(
                            children: [
                              SizedBox(height: 70,),
                              Center(
                                child: Text(
                                  'Camp Yellow',
                                  style: TextStyle(
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 32,
                                    height: 39/32,
                                    color: Color(0xFF000000),
                                  ),
                                ),
                              ),

                              Center(
                                child: Text(
                                  'practice. learn. compete.',
                                  style: TextStyle(
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14,
                                    height: 39/32,
                                    color: Color(0xFF000000),
                                  ),
                                ),
                              ),

                              Center(
                                child: Container(
                                    child: Image.asset('login_banner.png')
                                ),
                              ),

                              Container(
                                  width: MediaQuery.of(context).size.width/1.1,
                                  height: MediaQuery.of(context).size.height/15,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      width: 1,
                                      color: Color(0xFFE0DDDD), // 0xFF prefix is for transparency
                                      style: BorderStyle.solid,
                                    ),
                                  ),
                                  child:
                                  ListTile(
                                    title: Padding(
                                      padding: const EdgeInsets.only(bottom: 10.0),
                                      child: Opacity(opacity: 0.25,child: Text('search events by area')),
                                    ),
                                    trailing: Padding(
                                      padding: const EdgeInsets.only(bottom: 10.0),
                                      child: Opacity(opacity: 0.25,child: Icon(Icons.search,
                                        size: 30,)),
                                    ),
                                  )
                              ),
                              SizedBox(height: 10,),


                              Container(
                                width: MediaQuery.of(context).size.width/1.8,
                                height: MediaQuery.of(context).size.height/15,
                                decoration: BoxDecoration(
                                  color: Color(0xFF000000),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: TextButton(
                                  onPressed: () {
                                  },
                                  child: Text(
                                    'LOGIN',
                                    style: TextStyle(
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 24,
                                      height: 1.28,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),

                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
