import 'package:flutter/material.dart';


class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white70,
      appBar: AppBar(
        title: Text('Adding'),
        centerTitle: true,
        backgroundColor: Colors.indigoAccent,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {
                    {Navigator.pushNamed(context, 'addKm');}
                  },
                  child: Text('training'),
                ),
                ElevatedButton(
                  onPressed: () {
                    {Navigator.pushNamed(context, 'addReward');}
                  },
                  child: Text('competitions'),
                ),
              ],
          ),],
        ),
      )
    );
  }
}