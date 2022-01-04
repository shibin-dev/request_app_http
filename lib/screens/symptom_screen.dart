import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:request_app_http/providers/symptom_provider.dart';
import 'package:request_app_http/widgets/symptom_question_widget.dart';

// class SymptomScreen extends StatefulWidget {
//   @override
//   _SymptomScreenState createState() => _SymptomScreenState();
// }

// class _SymptomScreenState extends State<SymptomScreen> {
//   // @override
//   // void initState() {
//   //   Provider.of<SymptomProvider>(context, listen: false)
//   //       .startSymptomAssessment();
//   //   super.initState();
//   // }

//   @override
//   Widget build(BuildContext context) {

//   }
// }
class SymptomScreen extends StatelessWidget {
  const SymptomScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dataModel = Provider.of<SymptomProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text("Symptom Assessment"),
      ),
      body: dataModel.state == NotifierState.loading
          ? CircularProgressIndicator()
          : Container(
              padding: EdgeInsets.all(10),
              child: SymptomQuestion(),
            ),
    );
  }
}
