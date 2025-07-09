import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Space App",
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colors.black,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.black,
          elevation: 10,
          shadowColor: Colors.yellow,
          centerTitle: true,
        ),
      ),
      home: const SpaceHomePage(),
    );
  }
}

class SpaceHomePage extends StatefulWidget {
  const SpaceHomePage({super.key});

  @override
  State<SpaceHomePage> createState() => _SpaceHomePageState();
}

class _SpaceHomePageState extends State<SpaceHomePage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late Animation<double> _fadeAnimation;
  late Animation<Color?> _colorAnimation;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat(reverse: true);

    _scaleAnimation = Tween<double>(
      begin: 0.95,
      end: 1.05,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    _fadeAnimation = Tween<double>(
      begin: 0.6,
      end: 1,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    _colorAnimation = ColorTween(
      begin: Colors.redAccent.withOpacity(0.8),
      end: Colors.orangeAccent,
    ).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: const Text(
          "BLACK HOLE",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 30,
            letterSpacing: 2.0,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              _scaffoldKey.currentState?.openEndDrawer();
            },
            icon: const Icon(Icons.menu, color: Colors.white),
          ),
        ],
      ),
      endDrawer: Drawer(
        backgroundColor: Colors.black.withOpacity(0.9),
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.black.withOpacity(0.8)),
              child: const Text(
                'Space Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.star, color: Colors.yellow),
              title: const Text('Home', style: TextStyle(color: Colors.white)),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.explore, color: Colors.blue),
              title: const Text(
                'Explore',
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.photo_library, color: Colors.green),
              title: const Text(
                'Gallery',
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.info, color: Colors.red),
              title: const Text('About', style: TextStyle(color: Colors.white)),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            const Divider(color: Colors.white30),
            ListTile(
              leading: const Icon(Icons.settings, color: Colors.white),
              title: const Text(
                'Settings',
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FadeTransition(
                opacity: _fadeAnimation,
                child: const Text(
                  "SPACE DETAILS",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.5,
                  ),
                ),
              ),
              const SizedBox(height: 40),
              ScaleTransition(
                scale: _scaleAnimation,
                child: Center(
                  child: Image.asset(
                    "assets/space1.png",
                    height: 300,
                    scale: 2,
                  ),
                ),
              ),
              const SizedBox(height: 40),
              const Text(
                "Forem ipsum dolor sit amet, consectetur adipiscing elit. Etiam eu turpis molestie, dictum est a, mattis tellus. Sed dignissim, metus nec fringilla accumsan, risus sem sollicitudin lacus, ut interdum tellus elit sed risus. Maecenas eget condimentum velit, sit amet feugiat lectus. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Praesent auctor purus luctus enim egestas, ac scelerisque ante pulvinar. Donec ut rhoncus ex. Suspendisse ac rhoncus nisl, eu tempor urna. Curabitur vel bibendum.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white70,
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 40),
              GestureDetector(
                onTap: () {},
                child: Center(
                  child: AnimatedBuilder(
                    animation: _controller,
                    builder: (context, child) {
                      return ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: _colorAnimation.value,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 30,
                            vertical: 15,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          elevation: 10,
                          shadowColor: Colors.yellow.withOpacity(0.5),
                        ),
                        child: const Text(
                          "SPACE DETAILS",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            letterSpacing: 1.2,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              const SizedBox(height: 20),

              //second screen
              Center(
                child: Image.asset("assets/space2.png", height: 300, scale: 2),
              ),
              const SizedBox(height: 40),
              const Text(
                "Forem ipsum dolor sit amet, consectetur adipiscing elit. Etiam eu turpis molestie, dictum est a, mattis tellus. Sed dignissim, metus nec fringilla accumsan, risus sem sollicitudin lacus, ut interdum tellus elit sed risus. Maecenas eget condimentum velit, sit amet feugiat lectus. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Praesent auctor purus luctus enim egestas, ac scelerisque ante pulvinar. Donec ut rhoncus ex. Suspendisse ac rhoncus nisl, eu tempor urna. Curabitur vel bibendum.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white70,
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                  height: 1.5,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(50.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: Colors.deepOrangeAccent,
                      ),
                    ),
                    Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: const Color.fromARGB(255, 4, 127, 161),
                      ),
                    ),
                    Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: const Color.fromARGB(255, 6, 173, 25),
                      ),
                    ),
                    Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: const Color.fromARGB(255, 221, 5, 5),
                      ),
                    ),
                  ],
                ),
              ),
              //Third Screen
              const SizedBox(height: 20),
              Center(
                child: Image.asset("assets/space3.png", height: 300, scale: 2),
              ),
              const SizedBox(height: 40),
              const Text(
                "Forem ipsum dolor sit amet, consectetur adipiscing elit. Etiam eu turpis molestie, dictum est a, mattis tellus. Sed dignissim, metus nec fringilla accumsan, risus sem sollicitudin lacus, ut interdum tellus elit sed risus. Maecenas eget condimentum velit, sit amet feugiat lectus. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Praesent auctor purus luctus enim egestas, ac scelerisque ante pulvinar. Donec ut rhoncus ex. Suspendisse ac rhoncus nisl, eu tempor urna. Curabitur vel bibendum.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white70,
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 40),
              GestureDetector(
                onTap: () {},
                child: Center(
                  child: AnimatedBuilder(
                    animation: _controller,
                    builder: (context, child) {
                      return ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: _colorAnimation.value,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 30,
                            vertical: 15,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          elevation: 10,
                          shadowColor: const Color.fromARGB(
                            255,
                            5,
                            183,
                            157,
                          ).withOpacity(0.5),
                        ),
                        child: const Text(
                          "SPACE DETAILS",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            letterSpacing: 1.2,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              const SizedBox(height: 40),
              Container(
                height: 2,
                width: 500,
                decoration: BoxDecoration(color: Colors.white30),
              ),
              const SizedBox(height: 10),
              Text(
                "BLACK HOLE",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.5,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                "Forem ipsum dolor sit amet, consectetur adipiscing elit. Etiam eu turpis molestie, dictum est a, mattis tellus. Sed dignissim, metus nec fringilla accumsan, risus sem sollicitudin lacus, ut interdum tellus elit sed  .",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 10,
                  fontWeight: FontWeight.w300,
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
