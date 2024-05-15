import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:water_tracker_app/Models/water_consume_data.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}



class _HomeScreenState extends State<HomeScreen> {

  final TextEditingController _glassTEController = TextEditingController();
  List<WaterConsume> waterConsumeList = [];

  // total water count function
  int totalWaterCount(){
    int totalCount = 0;
    for(WaterConsume data in waterConsumeList){
      totalCount += data.glassCount;
    }
    return totalCount;
  }

  //  water consume function
  void addWaterConsume(){
    int GlassCount = int.tryParse(_glassTEController.text.toString()) ?? 0;
    WaterConsume waterConsume = WaterConsume(
        time:DateTime.now(), glassCount: GlassCount
    );
    waterConsumeList.add(waterConsume);
    setState(() {});
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Water Tracker App"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
           crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Column(
                children: [
                  InkWell(
                    borderRadius: BorderRadius.circular(100),
                    splashColor: Colors.lightBlue,
                    onTap: addWaterConsume,
                    child: Stack(
                        alignment: Alignment.centerRight,
                        children: [
                          SizedBox(
                              child: Lottie.asset(
                                  "assets/animations/water2.json",
                                  width: 100,height: 100,repeat: true)
                          ),
                          const Positioned(
                              top: 50,
                              left: 30,
                              child: Text("Tap Here",
                                  style:TextStyle(
                                      fontSize: 10,color: Colors.white)
                              )
                          )
                        ]
                    ),
                  ),

                  const SizedBox(height: 20),
                  SizedBox(
                    height: 40,
                    width: 80,
                    child: TextField(
                      keyboardType: TextInputType.number,
                      controller: _glassTEController,
                      textAlign: TextAlign.center,
                      decoration: const InputDecoration(
                        labelText: "No. of Glass",
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("History",style: TextStyle(color: Colors.teal)),
                RichText(
                  text:  TextSpan(
                      text: "Total: ",
                      style: const TextStyle(color: Colors.teal),
                      children: [
                      TextSpan(text: "${totalWaterCount()} ",
                      style: const TextStyle(color: Colors.black)),
                      ]
                  ),
                ),
              ],
            ),

            const Divider(color: Colors.cyan,height: 8,thickness: 2),
            const SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: waterConsumeList.length,
                  itemBuilder:(context,index){
                    return ListTile(
                      leading: CircleAvatar(child: Text('${index+1}')),
                      title: Wrap(
                          children: [
                            Text(
                             DateFormat.yMEd().add_jms().format(waterConsumeList[index].time)
                             ,style: const TextStyle(fontSize: 12))
                          ]
                      ),
                      trailing: Text(waterConsumeList[index].glassCount.toString(),
                          style:const TextStyle(fontSize: 15,fontWeight: FontWeight.bold)),
                    );
                  }
              ),
            )
          ],
        ),
      ),
    );
  }
}
