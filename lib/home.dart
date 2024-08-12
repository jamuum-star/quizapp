import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home(this.switchScreen,{super.key});

  final void Function() switchScreen;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset('assets/images/quiz.png', width: 800),
          Text(
            'Learn Somali',
            style: TextStyle(
              fontSize: 24,
              color: Colors.white.withOpacity(0.65),
            ),
          ),
          const SizedBox(height: 50,),
          OutlinedButton.icon(
            style: OutlinedButton.styleFrom(
              foregroundColor: const Color.fromARGB(255, 225, 217, 215),
              overlayColor: Colors.orange,
            ),
            onPressed: switchScreen, label:const Text('Start Quiz',style: TextStyle(fontSize: 18,),),icon: Icon(Icons.arrow_left),),
        ],
      ),
    );
  }
}
