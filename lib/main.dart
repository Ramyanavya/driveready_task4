import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
void main(){
  runApp(DevicePreview(builder: (context)=>MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false,
      home: Spanishscreen(),
    );
  }
}

class Spanishscreen extends StatefulWidget {
  const Spanishscreen({super.key});

  @override
  State<Spanishscreen> createState() => _SpanishscreenState();
}

class _SpanishscreenState extends State<Spanishscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ClipPath(
            clipper: PathCurve(),
            child: Container(
              height: MediaQuery.of(context).size.height / 2,
              width: MediaQuery.of(context).size.width,
              color: Color(0xffFFAD2D),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
              child: Stack(
                children: [
                  Positioned(
                    top: 10,
                    left: 10,
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.arrow_back_ios, color: Colors.white),
                    ),
                  ),
                  Positioned(
                    top: 15,
                    left: MediaQuery.of(context).size.width / 2.5,
                    child: Text(
                      "Curse",
                      style: TextStyle(
                        color: Colors.white60,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 10,
                    right: 10,
                    child: Icon(
                      Icons.more_vert_sharp,
                      color: Colors.white,
                    ),
                  ),
                  Positioned(
                    top: 60,
                    left: MediaQuery.of(context).size.width / 4,
                    child: Column(
                      children: [
                        Text(
                          "Spanish",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 5),
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 12, vertical: 6),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Row(
                            children: [
                              Text(
                                "Beginner",
                                style: TextStyle(color: Colors.orangeAccent),
                              ),
                              Icon(
                                Icons.arrow_drop_down_outlined,
                                color: Colors.orangeAccent,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: 50,
                    right: 30,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        SizedBox(
                          width: 90,
                          height: 90,
                          child: CircularProgressIndicator(
                            value: 0.43,
                            strokeWidth: 4,
                            color: Colors.white,
                            backgroundColor: Colors.white24,
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "43%",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text("completed", style: TextStyle(color: Colors.white)),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: 140,
                    left: 40,
                    child: Row(
                      children: [
                        Icon(Icons.diamond, color: Colors.red),
                        Icon(Icons.diamond, color: Colors.red),
                        Text(
                          "2 Milestones",
                          style: TextStyle(color: Colors.white70),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: 180,
                    child: Container(
                      width: MediaQuery.of(context).size.width - 40,
                      height: MediaQuery.of(context).size.height - 220,
                      child: GridView.count(
                        crossAxisCount: 2,
                        crossAxisSpacing: 15,
                        mainAxisSpacing: 15,
                        children: [
                          CourseCard("Basics", "2/5", Icons.book, Colors.orange, 2),
                          CourseCard("Occupations", "3/5", Icons.work, Colors.red, 3),
                          CourseCard("Conversation", "4/5", Icons.chat, Colors.blue, 4),
                          CourseCard("Places", "5/5", Icons.place, Colors.green, 5),
                          CourseCard("Family members", "2/5", Icons.people, Colors.purple, 2),
                          CourseCard("Foods", "3/5", Icons.food_bank, Colors.indigo, 3),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}




Widget CourseCard(String title, String progress, IconData icon, Color color,int percentage) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding:EdgeInsets.all(12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundColor: color.withOpacity(0.2),
              child: Icon(icon, color: color),
            ),
            SizedBox(height: 10),
            Text(
              title,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 5),
            Text(progress, style:TextStyle(color: Colors.grey)),
            SizedBox(height: 10,),
            LinearProgressIndicator(
              value:percentage/5 ,
              minHeight: 5,
              backgroundColor: Colors.grey.shade300,
              color: color,
            ),
          ],
        ),
      ),
    );
  }




class PathCurve extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    Path path = Path();
    path.moveTo(0, 0);
    path.lineTo(0, size.height * .5);
    path.quadraticBezierTo(
        size.width / 2, size.height, size.width, size.height * .5);
    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper oldClipper) {
    return false;
  }
}



