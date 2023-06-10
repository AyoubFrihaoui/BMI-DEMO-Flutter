import 'package:flutter/material.dart';

class SliverBar extends StatelessWidget {
  SliverBar({super.key});

  List<Text> content = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.abc_outlined),
          onPressed: () {},
        ),
        title: Text('Sliver'),
        centerTitle: true,
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
            Color.fromARGB(204, 78, 22, 168),
            Color.fromARGB(190, 226, 79, 20)
          ])),
        ),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.access_alarm_rounded))
        ],
      ),
      body: Center(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              stretch: true,
              expandedHeight: 200,
              leading: IconButton(
                icon: Icon(Icons.abc_outlined),
                onPressed: () {},
              ),
              title: Text('Sliver'),
              centerTitle: true,
              flexibleSpace: FlexibleSpaceBar(
                background: Expanded(
                  child: Container(
                      decoration: BoxDecoration(
                          gradient: LinearGradient(colors: [
                    Color.fromARGB(204, 78, 22, 168),
                    Color.fromARGB(190, 226, 79, 20)
                  ]))),
                ),
              ),
              actions: [
                IconButton(
                    onPressed: () {}, icon: Icon(Icons.access_alarm_rounded))
              ],
            ),
            SliverList(
                delegate: SliverChildListDelegate([
              ...List.filled(
                  40,
                  Text(
                    'yooo',
                  ))
            ]))
          ],
        ),
      ),
    );
  }
}
