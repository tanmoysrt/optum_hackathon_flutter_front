import 'package:flutter/material.dart';

import '../components/dynamic_icons.dart';

class PersonalMonitoringPage extends StatelessWidget {
  const PersonalMonitoringPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: SingleChildScrollView(
              child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  color: Colors.black,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 10),
                        const Text(
                          'Hii Snehanjan',
                          style: TextStyle(color: Colors.white),
                          textScaleFactor: 2.5,
                        ),
                        const SizedBox(height: 5),
                        Text(
                          'This is your personalized monitoring',
                          style: TextStyle(color: Colors.grey[600], fontSize: 18),
                        ),
                        const SizedBox(height: 50),
                        _personalizedMonitoringCard(context),
                        _personalizedMonitoringCard(context)
                      ]
                  )
              ),
            )
        )
    );
  }
}


Widget _personalizedMonitoringCard(BuildContext context){
  List<String> vitalsMonitoring = ["Heart Rate", "Steps", "SpO2", "BP"];
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      ListTile(
        contentPadding: EdgeInsets.zero,
        title: Text('Heart Failure Monitoring',
          style: TextStyle(color: Colors.white.withOpacity(0.8), fontSize: 22),
        ),
        subtitle: Text('By Dr Alpha',
          style: TextStyle(color: Colors.white.withOpacity(0.6), fontSize: 16),
        )
      ),

      const SizedBox(height: 5,),
      Wrap(
        spacing: 5,
        children: vitalsMonitoring.map((e) => Chip(label: Text(e), visualDensity: VisualDensity.compact,)).toList(),
      ),
      const SizedBox(height: 10,),
      _calorieTargetCard(context, 200, 50),
      const SizedBox(height: 10,),
      _footstepsTargetCard(context, 2000, 750),
      const Divider(height: 40,),
    ],
  );
}


Widget _calorieTargetCard(BuildContext context, int target, int done){
  return Container(
    decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(12)),
        color: Color(0xff0D0D0D)
    ),
    padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 22),
    // Layout
    // ----- Row ------
    // Column  |  Column
    // ------  | -------
    // Current |
    // Required| Icon
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.end,
      textBaseline: TextBaseline.alphabetic,
      children: [
        // data
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            // Current stat
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Value with unit
                Row(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children:  [
                    // value
                    Text(done.toString(),style: const TextStyle(fontSize: 45,color: Colors.white)),
                    const SizedBox(width: 5,),
                    // unit
                    const Text("kcal",style: TextStyle(fontSize: 16,color: Color(0xFFFFB800))),
                  ],
                ),
                // label
                Text("Calories Burnt",style: TextStyle(color: Colors.grey.shade600), textScaleFactor: 1.1,),
              ],
            ),
            // space
            const SizedBox(height: 25,),
            // more required
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Value with unit
                Row(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children:  [
                    // value
                    Text((target-done).toString(),style: const TextStyle(fontSize: 21,color: Colors.white)),
                    const SizedBox(width: 5,),
                    // unit
                    Text("kcal",style: TextStyle(fontSize: 16,color: Colors.grey.shade600)),
                  ],
                ),
                // label
                Text("Calories to Be Burnt",style: TextStyle(color: Colors.grey.shade600), textScaleFactor: 1.1,),
              ],
            ),
          ],
        ),
        // Icon
        DynamicIcon(assetImage: "assets/images/walking.png", fillPercentage: done/target, fillColor: const Color(0xFFFFB800), backgroundColor: Colors.transparent, height: 60, width: 50)
      ],
    ),
  );
}


Widget _footstepsTargetCard(BuildContext context, int target, int done){
  return Container(
    decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(12)),
        color: Color(0xff0D0D0D)
    ),
    padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 22),
    // Layout
    // ----- Row ------
    // Column  |  Column
    // ------  | -------
    // Current |
    // Required| Icon
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.end,
      textBaseline: TextBaseline.alphabetic,
      children: [
        // data
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            // Current stat
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Value with unit
                Row(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children:  [
                    // value
                    Text(done.toString(),style: const TextStyle(fontSize: 45,color: Colors.white)),
                    const SizedBox(width: 5,),
                    // unit
                    const Text("steps",style: TextStyle(fontSize: 16,color: Color(0xFF58C5CC))),
                  ],
                ),
                // label
                Text("Steps Walked",style: TextStyle(color: Colors.grey.shade600), textScaleFactor: 1.1,),
              ],
            ),
            // space
            const SizedBox(height: 25,),
            // more required
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Value with unit
                Row(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children:  [
                    // value
                    Text((target-done).toString(),style: const TextStyle(fontSize: 21,color: Colors.white)),
                    const SizedBox(width: 5,),
                    // unit
                    Text("steps",style: TextStyle(fontSize: 16,color: Colors.grey.shade600)),
                  ],
                ),
                // label
                Text("Need to be completed",style: TextStyle(color: Colors.grey.shade600), textScaleFactor: 1.1,),
              ],
            ),
          ],
        ),
        // Icon
        DynamicIcon(assetImage: "assets/images/footsteps.png", fillPercentage: done/target, fillColor: const Color(0xFF58C5CC), backgroundColor: Colors.transparent, height: 60, width: 50)
      ],
    ),
  );
}