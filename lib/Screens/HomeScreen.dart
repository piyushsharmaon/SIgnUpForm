import 'package:validation_custom_column/AllLibraries.dart';
class CustomForm extends StatefulWidget {
  const CustomForm({Key? key}) : super(key: key);

  @override
  State<CustomForm> createState() => _CustomFormState();
}

class _CustomFormState extends State<CustomForm> {
  late FocusNode nameFocus;
  late FocusNode lastNameFocus;
  late FocusNode dobFocus;
  late FocusNode emailFocus;
  late FocusNode phoneFocus;
  late FocusNode passwordFocus;
  late FocusNode confirmPasswordFocus;
  String? gender;
  @override
  void initState() {


    super.initState();

    nameFocus = FocusNode();
    lastNameFocus= FocusNode();
    dobFocus= FocusNode();
    emailFocus= FocusNode();
    phoneFocus= FocusNode();
    passwordFocus= FocusNode();
    confirmPasswordFocus= FocusNode();
  }

  @override
  void dispose() {
    nameFocus.dispose();

    super.dispose();
  }

  @override
  final _formKey = GlobalKey<FormState>();
  TextEditingController controllerName = TextEditingController();
  TextEditingController controllerLastName = TextEditingController();
  TextEditingController controllerGender = TextEditingController();
  TextEditingController controllerDob = TextEditingController();
  TextEditingController controllerEmail = TextEditingController();
  TextEditingController controllerPhone = TextEditingController();
  TextEditingController controllerPassword = TextEditingController();
  TextEditingController controllerPasswordConfirmation = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(appBar: AppBar(title: Text("Create a new account"),
      ),
          body: SingleChildScrollView(child: Column(
            children: [
              firstNameTextField(),
              lastNameTextField(),
              genderRadioButton(),
              dobTextField(),
              emailTextField(),
              phoneTextField(),
              passwordTextField(),
              confirmPasswordTextField(),
              signUpButton()
            ],),
          ),
          // floatingActionButton: focusNode()
      ),
    );
  }
  firstNameTextField(){return CustomField(
      length: getFullHeight(context: context)*0.10,
      breadth: getFullWidth(context: context)*0.90,
      focusAuto: true,
      controller: controllerName,
      validator: (value) => validateName(value),
      labelText: 'Name', hint: 'Enter your name', nodeFocus: nameFocus, keyBoard: TextInputType.name, focusMain: nameFocus, focusShift: lastNameFocus, );}
  lastNameTextField(){return CustomField(
      length: getFullHeight(context: context)*0.10,
      
      breadth: getFullWidth(context: context)*0.90,
      controller:controllerLastName,
      validator: (value) => validateLastName(value),
      labelText: 'Last Name', hint: 'Enter your last name', focusAuto: true, nodeFocus: lastNameFocus, keyBoard: TextInputType.name, focusMain: lastNameFocus, focusShift: dobFocus, );}
  genderRadioButton(){return
    Column(mainAxisSize: MainAxisSize.min,
      children: [
        Container(margin: EdgeInsets.only(left: getFullWidth(context: context)*0.08),alignment: Alignment.centerLeft,child: Text("Gender?",)),
        RadioListTile(
          title: Text("Male"),
          value: "male",
          groupValue: gender,
          onChanged: (value){
            setState(() {
              gender = value.toString();
            });
          },
        ),

        RadioListTile(
          title: Text("Female"),
          value: "female",
          groupValue: gender,
          onChanged: (value){
            setState(() {
              gender = value.toString();
            });
          },
        ),

        RadioListTile(
          title: Text("Other"),
          value: "other",
          groupValue: gender,
          onChanged: (value){
            setState(() {
              gender = value.toString();
            });
          },
        )
      ],
    );}
  dobTextField(){return CustomField(
      length: getFullHeight(context: context)*0.10,
      breadth: getFullWidth(context: context)*0.90,
      nodeFocus: dobFocus,
      controller:controllerDob,
      validator: (value) => validateDob(value),
      labelText: 'DOB', hint: 'DD/MM/YY', focusAuto: false, keyBoard: TextInputType.datetime, focusMain: dobFocus,focusShift: emailFocus, );}
  emailTextField(){return CustomField(
      length: getFullHeight(context: context)*0.10,
      breadth: getFullWidth(context: context)*0.90,
      
      controller:controllerEmail,
      validator: (value) => validateEmail(value),
      labelText: 'Email or Phone Number', hint: 'xyz@gmail.com', focusAuto: false, nodeFocus: emailFocus, keyBoard: TextInputType.emailAddress, focusMain: emailFocus,focusShift: phoneFocus, );}
  phoneTextField(){return CustomField(
      length: getFullHeight(context: context)*0.10,
      breadth: getFullWidth(context: context)*0.90,
      
      controller:controllerPhone,
      validator: (value) => validatePhone(value),
      labelText: 'Phone Number', hint: '00000 00000', focusAuto: false, nodeFocus: phoneFocus, keyBoard: TextInputType.phone, focusMain: phoneFocus, focusShift: passwordFocus, );}
  passwordTextField(){return CustomField(
      length: getFullHeight(context: context)*0.10,
      breadth: getFullWidth(context: context)*0.90,
      
      controller:controllerPassword,
      validator: (value) => validatePassword(value),
      labelText: 'Password', hint: '******', focusAuto: false, nodeFocus: passwordFocus, keyBoard: TextInputType.visiblePassword, focusMain: passwordFocus,focusShift: confirmPasswordFocus, );}
  confirmPasswordTextField(){return CustomField(
      length: getFullHeight(context: context)*0.10,
      breadth: getFullWidth(context: context)*0.90,
      
      controller:controllerPasswordConfirmation,
      validator: (value) => validateConfirmation(value),
      labelText: 'Confirm Password', hint: '******', focusAuto: false, nodeFocus: confirmPasswordFocus, keyBoard: TextInputType.visiblePassword, focusMain: confirmPasswordFocus, focusShift: null, );}
  signUpButton(){
    return ElevatedButton(
      onPressed: () async{
        if (_formKey.currentState!.validate()) {
          final snackBar = SnackBar(
            content: const Text('Data Entered Successfully'),
            backgroundColor: Colors.green,
            action: SnackBarAction(
              label: 'Undo',
              textColor: Colors.black,
              onPressed: () {},
            ),
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        } else {
          final snackBar = SnackBar(
            content: const Text('Incorrect Data'),
            backgroundColor: Colors.red,
            action: SnackBarAction(
              label: 'Try Again',
              textColor: Colors.black,
              onPressed: () {},
            ),
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
      },
      child: Text("Sign Up"),
    );
  }
  focusNode(){
    return FloatingActionButton(
      child: Icon(Icons.edit),
      onPressed: () => nameFocus.requestFocus(),);
  }

}