import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  final String usernameController;
  const ProfilePage({super.key, required String title, required this.usernameController});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff09141A),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        title: Center(
            child: Text(
          '@johndoe123',
          style: TextStyle(color: Colors.white),
        )),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.more_horiz,
              color: Colors.white,
            ),
          )
        ],
      ),
      body: ListView(
        children: [
          Column(
            children: [
              Container(
                height: 350,
                width: 550,
                padding: EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Color(0xff162329),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Text(
                  '@johndoe123',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 50.0),
                child: Container(
                  height: 125,
                  width: 550,
                  padding: EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    color: Color(0xff10232D),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'About',
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          Icon(Icons.edit,color: Colors.white,)
                        ],
                      ),
                      Container(
                        padding: EdgeInsets.all(8.0),
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Add in your to help others know you better',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.grey[700],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
               Padding(
                padding: const EdgeInsets.only(top: 50.0),
                child: Container(
                  height: 125,
                  width: 550,
                  padding: EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    color: Color(0xff10232D),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'interest',
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          Icon(Icons.edit,color: Colors.white,)
                        ],
                      ),
                      Container(
                        padding: EdgeInsets.all(8.0),
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Add in your interest to find a better match',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.grey[700],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
