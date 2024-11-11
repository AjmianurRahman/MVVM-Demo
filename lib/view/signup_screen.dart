import 'package:flutter/material.dart';
import 'package:mvvm_architecture/res/components/rountd_button.dart';
import 'package:mvvm_architecture/view_model/auth_view_model.dart';
import 'package:provider/provider.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  var eCon = TextEditingController();
  var pCon = TextEditingController();

  FocusNode eNode = FocusNode();
  FocusNode pNode = FocusNode();

  ValueNotifier<bool> _obsProvider = ValueNotifier<bool>(true);

  @override
  Widget build(BuildContext context) {
    var authViewModel = Provider.of<AuthViewModel>(context);
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * .6,
                child: TextFormField(
                  focusNode: eNode,
                  onFieldSubmitted: (value) {
                    FocusScope.of(context).requestFocus(pNode);
                  },
                  controller: eCon,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                      prefixIcon: Icon(
                        Icons.alternate_email,
                        color: Colors.blue,
                      ),
                      hintText: 'Email'),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * .04,
              ),
              ValueListenableBuilder(
                  valueListenable: _obsProvider,
                  builder: (context, value, child) {
                    return SizedBox(
                      width: MediaQuery.of(context).size.width * .6,
                      child: TextFormField(
                        focusNode: pNode,
                        controller: pCon,
                        obscureText: value,
                        obscuringCharacter: '*',
                        decoration: InputDecoration(
                            suffixIcon: InkWell(
                                onTap: () {
                                  _obsProvider.value = !value;
                                },
                                child: value
                                    ? const Icon(Icons.visibility)
                                    : const Icon(Icons.visibility_off)),
                            prefixIcon: const Icon(
                              Icons.lock_open_rounded,
                              color: Colors.blue,
                            ),
                            hintText: 'Password'),
                      ),
                    );
                  }),
              SizedBox(
                height: MediaQuery.of(context).size.height * .3,
              ),
              RoundButton(
                  title: 'Sign Up',
                  loading: authViewModel.sloading,
                  onPress: () {
                    Map data = {
                      'email': eCon.text.toString(),
                      'password': pCon.text.toString()
                    };
                    authViewModel.signUpApi(data, context);
                  }),
            ],
          ),
        ),
      ),
    );
  }


}
