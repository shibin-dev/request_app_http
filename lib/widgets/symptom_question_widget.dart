import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:request_app_http/models/symptom_model.dart';
import 'package:flutter/src/widgets/text.dart' as text;
import 'package:request_app_http/providers/symptom_provider.dart';

// class SymptomQuestion extends StatefulWidget {
//   @override
//   _SymptomQuestionState createState() => _SymptomQuestionState();
// }

// class _SymptomQuestionState extends State<SymptomQuestion> {
//   @override
//   Widget build(BuildContext context) {

//   }
// }
class SymptomQuestion extends StatelessWidget {
  const SymptomQuestion({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    QuestionModel model =
        Provider.of<SymptomProvider>(context, listen: false).symptomModel;
    return ListView.separated(
        itemBuilder: (context, index) {
          print(model.options!.length);
          return InkWell(
            onTap: () {
              print('object');
            },
            child: Container(
              padding: EdgeInsets.all(20),
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(20)),
              child: text.Text("${model.options![index].translation!.en}"),
            ),
          );
        },
        separatorBuilder: (_, __) => SizedBox(
              height: 5,
            ),
        itemCount: model.options!.length);
  }
}
