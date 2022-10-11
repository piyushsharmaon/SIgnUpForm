import 'package:validation_custom_column/AllLibraries.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  return runApp(FormCustom());
}

class FormCustom extends StatefulWidget {
  const FormCustom({Key? key}) : super(key: key);

  @override
  State<FormCustom> createState() => _FormCustomState();
}

class _FormCustomState extends State<FormCustom> {
  late FocusNode myFocusNode;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: true,
      home: CustomForm(),
    );
  }
}
