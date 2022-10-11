import 'package:validation_custom_column/AllLibraries.dart';
class CustomField extends StatelessWidget {
  TextEditingController? controller;
  FormFieldValidator<String>? validator;
  String labelText,hint;
  double length,breadth;
  bool focusAuto;
  FocusNode? nodeFocus;
  TextInputType? keyBoard;
  var focusMain;
  var focusShift;

  CustomField({Key? key,this.controller,required this.nodeFocus,required this.focusMain,required this.focusShift,this.validator,required this.labelText,required this.hint,required this.length,required this.breadth,required this.focusAuto,required this.keyBoard}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [Container(alignment: Alignment.centerLeft,margin: EdgeInsets.only(left: getFullWidth(context: context)*0.08),child: Text(labelText),),
        Container(
          height: length,
          width: breadth,
          child: TextFormField(
            autofocus: focusAuto,
            focusNode: nodeFocus,
            autovalidateMode: null,
            keyboardType: keyBoard,
            decoration: InputDecoration(hintText: hint,border: OutlineInputBorder(borderRadius: BorderRadius.circular(25))),
            controller: controller,
            validator:validator ,
    onFieldSubmitted: (term){
    focusMain.unfocus();
    FocusScope.of(context).requestFocus(focusShift);
    },
    ),


          ),
      ],
    );
  }
}
// onEditingComplete: () => myFocusNode.requestFocus(),),
