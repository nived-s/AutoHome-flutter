import 'package:autohome/constants.dart';
import 'package:autohome/widgets/scrollListItem.dart';
import 'package:flutter/material.dart';
import 'package:list_wheel_scroll_view_nls/list_wheel_scroll_view_nls.dart';

class ModesPage extends StatefulWidget {
  const ModesPage({super.key});

  @override
  State<ModesPage> createState() => _ModesPageState();
}

class _ModesPageState extends State<ModesPage> {
  int selectedIndexOfMode = 0;
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    List<String> modes = [
      'Turns off all the appliances,\nlocks all windows, doors and gates',
      'Turns on ambient lights, a mood setter',
      'Monitor and track guest movements to provide them hospitality',
      'Monitor and track movements to provide them supervision',
      'Enable emergency and evacuation protocols',
      'Prepare for a restful night and sound sleep',
      'Save application from overusage and reduce electricity bill',
      'Turns off all the appliances,\nlocks all windows, doors and gates,\nensuring safety for a long leave from home',
    ];

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(screenWidth * 0.045),
          child: Column(
            children: [
              SizedBox(
                height: screenHeight * 0.3,
                child: ListWheelScrollViewX(
                  scrollDirection: Axis.horizontal,
                  onSelectedItemChanged: (int index) {
                    setState(() {
                      selectedIndexOfMode = index;
                    });
                  },
                  itemExtent: 150,
                  useMagnifier: true,
                  magnification: 1.4,
                  diameterRatio: 1.8,
                  children: scrollListItems(context),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Container(
                  height: screenHeight * 0.4,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: const Color(0xFFD9D9D9),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 20),
                    child: SingleChildScrollView(
                      child: Row(
                        children: [
                          SizedBox(
                            width: screenWidth*0.73,
                            height: screenHeight * 0.35,
                            child: Center(
                              child: Text(
                                // 'In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before the final copy is available.. Lorem ipsum may be used as a placeholder before the final copy is available.',
                                modes[selectedIndexOfMode],
                                style: kBodySmall(
                                  color: const Color.fromARGB(255, 14, 111, 22),
                                  fontSize: 20,
                                  letterSpacing: 2,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 113, 198, 121),
                  foregroundColor: Colors.black,
                  textStyle: kBodyLarge(fontSize: 20),
                ),
                onPressed: () {
                  print('Selected index: $selectedIndexOfMode');
                },
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('Set Mode'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
