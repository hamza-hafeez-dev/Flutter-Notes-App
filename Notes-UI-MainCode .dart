import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Notes',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF6C63FF)),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Nodes> node = [
    Nodes(title: 'Market', subtitles: 'Milk, Eggs, Bread'),
    Nodes(title: 'Flutter', subtitles: 'ListView Revision'),
    Nodes(title: 'Call Brother', subtitles: 'Ask about weekend plan'),
    Nodes(title: 'Project Meeting', subtitles: 'Discuss client requirements'),
    Nodes(title: 'Gym', subtitles: 'Leg day — don\'t skip'),
    Nodes(title: 'Read', subtitles: 'Finish chapter 4'),
  ];

  static const Color primary = Color(0xFF6C63FF);

  void addNewNotes() {
    final titleController = TextEditingController();
    final subtitleContoller = TextEditingController();

    final titleFocus = FocusNode();
    final subtitleFocus = FocusNode();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Add New Notes'),
          content: Column(
            children: [
              TextField(
                controller: titleController,
                decoration: InputDecoration(labelText: 'Add Title'),
                focusNode: titleFocus,
                onSubmitted: (value) {
                  FocusScope.of(context).requestFocus(subtitleFocus);
                },
              ),

              TextField(
                controller: subtitleContoller,
                decoration: InputDecoration(labelText: 'Add Subtitle'),
                focusNode: subtitleFocus,

              ),
            ],
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                setState(() {
                  
                  node.insert(
                    0,
                    Nodes(
                      title: titleController.text,
                      subtitles: subtitleContoller.text,
                    ),
                  );
                });
              },
              child: Text('Add'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F9),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF5F5F9),
        elevation: 0,
        title: const Text(
          'My Notes',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black87),
        ),
      ),
      body: node.isEmpty
          ? Center(
              child: Text(
                'No notes yet',
                style: TextStyle(color: Colors.grey.shade500, fontSize: 16),
              ),
            )
          : ListView.separated(
              padding: const EdgeInsets.all(16),
              separatorBuilder: (context, index) => const SizedBox(height: 10),
              itemCount: node.length,
              itemBuilder: (context, index) => Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withAlpha(20),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: ListTile(
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 14,
                    vertical: 6,
                  ),
                  leading: CircleAvatar(
                    backgroundColor: primary.withAlpha(50),
                    child: Text(
                      node[index].title[0].toUpperCase(),
                      style: const TextStyle(
                        color: primary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  title: Text(
                    node[index].title,
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                  ),
                  subtitle: Padding(
                    padding: const EdgeInsets.only(top: 4),
                    child: Text(
                      node[index].subtitles,
                      style: TextStyle(color: Colors.grey.shade600),
                    ),
                  ),
                  trailing: IconButton(
                    onPressed: () {
                      setState(() {
                        node.removeAt(index);
                      });
                    },
                    icon: Icon(
                      Icons.delete_outline,
                      color: Colors.red.shade300,
                    ),
                  ),
                ),
              ),
            ),

      floatingActionButton: FloatingActionButton(
        backgroundColor: primary,
        onPressed: () {
          addNewNotes();
        },
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}

class Nodes {
  String title;
  String subtitles;

  Nodes({required this.title, required this.subtitles});
}
