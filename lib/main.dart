import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Super Hero Picker',
      home: NavigationExample()
    );
  }
}

class NavigationExample extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _NavigationExampleState();
}

class _NavigationExampleState extends State<NavigationExample> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        indicatorColor: Colors.amber[800],
        selectedIndex: currentPageIndex,
        destinations: const <Widget>[
          NavigationDestination(
            selectedIcon: Icon(Icons.home),
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.analytics),
            icon: Icon(Icons.analytics_outlined),
            label: 'Analytics',
          ),
          NavigationDestination(
              selectedIcon: Icon(Icons.info),
              icon: Icon(Icons.info_outlined),
              label: 'Info',
          ),
        ],
      ),
      body: <Widget>[
        Container(
          color: Colors.red,
          alignment: Alignment.center,
          child: SpacedItemsList(),
        ),
        Container(
          color: Colors.green,
          alignment: Alignment.center,
          child: const Text('Page 2'),
        ),
        Container(
          color: Colors.blue,
          alignment: Alignment.center,
          child: const Text('Page 3'),
        ),
      ][currentPageIndex],
    );
  }
}

class SpacedItemsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    const items = 4;

    return Scaffold(
      body: LayoutBuilder(builder: (context, constraints) {
        return SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: constraints.maxHeight),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: List.generate(
                  items, (index) => ItemWidget(text: 'Item $index')),
            ),
          ),
        );
      }),
    );
  }
}

class ItemWidget extends StatelessWidget {
  const ItemWidget({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: SizedBox(
        height: 100,
        child: Center(child: Text(text)),
      ),
    );
  }
}
/*
class SuperHeroNameGenerator extends StatefulWidget {
  const SuperHeroNameGenerator({super.key});

  @override
  State<StatefulWidget> createState() => _SuperHeroName();
}

class _SuperHeroName extends State<SuperHeroNameGenerator> {
  @override
  Widget build(BuildContext context) {
    const superHeroName = 'Test-name';
    return const Text(superHeroName);
  }
}
 */