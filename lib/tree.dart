import 'package:flutter/material.dart';

void main() {
  runApp(const HorseInfoApp());
}

class HorseInfoApp extends StatelessWidget {
  const HorseInfoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TreeDiagramScreen(),
    );
  }
}

class TreeDiagramScreen extends StatefulWidget {
  const TreeDiagramScreen({super.key});

  @override
  _TreeDiagramScreenState createState() => _TreeDiagramScreenState();
}

class _TreeDiagramScreenState extends State<TreeDiagramScreen> {
  final Map<int, List<TextEditingController>> controllers = {};
  final int maxLevels = 6;
  final Set<int> addedLevels = {};

  @override
  void initState() {
    super.initState();
    controllers[0] = [TextEditingController()];
  }

  void addBranch(int level) {
    if (level >= maxLevels - 1 || addedLevels.contains(level)) return;

    setState(() {
      int newBranches = controllers[level]!.length * 2;
      controllers[level + 1] ??= [];

      for (int i = 0; i < newBranches; i++) {
        controllers[level + 1]!.add(TextEditingController());
      }
      addedLevels.add(level);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEADBC8),
      appBar: AppBar(
        backgroundColor: const Color(0xFF8D6E63),
        title: const Text('Family'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              for (int level = 0; level < controllers.keys.length; level++)
                Padding(
                  padding: const EdgeInsets.only(left: 80.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      for (int i = 0; i < controllers[level]!.length; i++)
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 8.0,
                            horizontal: 4.0,
                          ),
                          child: Column(
                            children: [
                              SizedBox(
                                width: 80,
                                height: 40,
                                child: TextField(
                                  controller: controllers[level]![i],
                                  maxLength: 8,
                                  decoration: InputDecoration(
                                    counterText: '',
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    filled: true,
                                    fillColor: Colors.white,
                                  ),
                                ),
                              ),
                              if (level < maxLevels - 1 &&
                                  i == 0 &&
                                  !addedLevels.contains(level))
                                IconButton(
                                  icon: const Icon(
                                    Icons.add,
                                    color: Colors.brown,
                                  ),
                                  onPressed: () => addBranch(level),
                                ),
                            ],
                          ),
                        ),
                    ],
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
