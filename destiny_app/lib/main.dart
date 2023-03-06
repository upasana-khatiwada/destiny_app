import 'package:destiny_app/story_brain.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const Destini());
}

class Destini extends StatelessWidget {
  const Destini({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: const StoryPage(),
    );
  }
}
StoryBrain storyBrain = StoryBrain();

class StoryPage extends StatefulWidget {
  const StoryPage({super.key});

  @override
  State<StoryPage> createState() => _StoryPageState();
}

class _StoryPageState extends State<StoryPage> {

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
       
        // Adding background.png to this Container as a background image.
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('images/background.png'), fit: BoxFit.cover)),
        padding: const EdgeInsets.symmetric(vertical: 50.0, horizontal: 15.0),
        constraints: const BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                flex: 12,
                child: Center(
                  child: Text(
                    //'Story text will go here.',
                   storyBrain.getStory(),
                    // using the storyBrain to get the first story title and display it in this Text Widget.
                    style: const TextStyle(
                      fontSize: 25.0,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: TextButton(
                  onPressed: () {
                    //storyBrain.nextStory(1);
                    setState(() {
                      //Choice 1 made by user.
                   // Calling the nextStory() method from storyBrain and passing the number 1 as the choice made by the user.
                    storyBrain.nextStory(1);
                    });
                  },
                  style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(Colors.teal),
                  ),
                  child:  Text(
                    // Using the storyBrain to get the text for choice 1.
                    storyBrain.getChoice1(),
                    //'Choice 1',
                    style: const TextStyle(
                      fontSize: 20.0,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Expanded(
                flex: 2,
                // ignore: todo
                //TODO: Step 26 - Use a Flutter Visibility Widget to wrap this FlatButton.
                // ignore: todo
                //TODO: Step 28 - Set the "visible" property of the Visibility Widget to equal the output from the buttonShouldBeVisible() method in the storyBrain.
                child: Visibility(
                  visible: storyBrain.buttonShouldBeVisible(),
                  child: TextButton(
                   
                    onPressed: () {
                     // storyBrain.nextStory(2);
                      setState(() {
                        //Choice 2 made by user.
                     // Call the nextStory() method from storyBrain and pass the number 2 as the choice made by the user.
                      storyBrain.nextStory(2);
                      });
                    },
                    style: const ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(Colors.blue),
                    ),
                    child:  Text(
                      // Using the storyBrain to get the text for choice 2.
                      storyBrain.getChoice2(),
                      //'Choice 2',
                      style: const TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
