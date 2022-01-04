import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:request_app_http/providers/symptom_provider.dart';
import 'package:request_app_http/screens/symptom_screen.dart';

class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({Key? key}) : super(key: key);

  @override
  _DashBoardScreenState createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  // void didChangeDependencies() async {
  //   await Provider.of<SymptomProvider>(context, listen: false)
  //       .startSymptomAssessment(context);
  //   // TODO: implement didChangeDependencies
  //   super.didChangeDependencies();
  // }
  @override
  void initState() {
    Provider.of<SymptomProvider>(context, listen: false)
        .startSymptomAssessment();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DashBoards'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          InkWell(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) {
                  return SymptomScreen();
                },
              ));
            },
            child: Container(
              height: 350,
              width: 300,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20), color: Colors.black),
              child: Text(
                "Symptom Assessment",
                style: TextStyle(color: Colors.white),
              ),
            ),
          )
        ],
      ),
    );
  }
}
