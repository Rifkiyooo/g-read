import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';
import 'package:gread/app/data/constans/validation.dart';

import '../controllers/register_controller.dart';
import 'package:form_validator/form_validator.dart';

extension CustomValidationBuilder on ValidationBuilder {
  custom() => add((value) {
        if (!EmailValidator.isValidEmail(value)) {
          return 'Enter a valid email address with @smk.belajar.id';
        }
        return null;
      });
  password() => add((value) {
        if (!PasswordValidator.isValidPasswordUpper(password: value)) {
          return 'Password must contain at least 1 uppercase letter';
        }
        if (!PasswordValidator.isValidPasswordSymbol(password: value)) {
          return 'Password must contain at least 1 Sysmbol';
        }
        return null;
      });
  ValidationBuilder confirmPassword(TextEditingController controller) {
    return this
      ..add((value) {
        if (value != controller.text.toString()) {
          return 'Passwords do not match';
        }
        return null;
      });
  }
}

final validatorPassword = ValidationBuilder()
    .minLength(8, 'Password must be at least 8 characters')
    .password()
    .build();
final validator = ValidationBuilder().email().custom().build();

class RegisterView extends GetView<RegisterController> {
  const RegisterView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final myAppBar = AppBar(
      title: const Text('Register'),
      centerTitle: true,
    );
    final heightBody =
        MediaQuery.of(context).size.height - myAppBar.preferredSize.height;
    final widthBody = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: myAppBar,
      body: Form(
        key: controller.formKey,
        child: Container(
          height: heightBody,
          color: Color.fromRGBO(85, 85, 85, 1),
          padding: EdgeInsets.symmetric(vertical: heightBody * 0.02),
          child: SingleChildScrollView(
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image(image: AssetImage('logo.png'), width: widthBody * 0.3),
                  Container(
                    padding: EdgeInsets.only(
                        top: 10, bottom: 10, left: 30, right: 30),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                            padding: EdgeInsets.only(bottom: 10),
                            child: Text('Login',
                                style: TextStyle(
                                    fontSize: 30, fontWeight: FontWeight.bold)),
                            alignment: Alignment.center),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 10),
                          child: Text('Username',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18)),
                        ),
                        TextFormField(
                            validator: ValidationBuilder().minLength(5).build(),
                            controller: controller.username,
                            autocorrect: false,
                            autofocus: true,
                            enableInteractiveSelection: false,
                            textAlign: TextAlign.start,
                            decoration: InputDecoration(
                              hintText: '@rifkydimas',
                              filled: true,
                              fillColor: Colors.white,
                              errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: const Color.fromARGB(
                                          255, 255, 17, 0))),
                              focusedErrorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: const Color.fromARGB(
                                          255, 255, 17, 0))),
                              // border: OutlineInputBorder(),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                      color: Colors.green, width: 3)),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(color: Colors.white)),
                            )),
                        SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 10),
                          child: Text('Email',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18)),
                        ),
                        TextFormField(
                            validator: validator,
                            controller: controller.email,
                            autocorrect: false,
                            autofocus: false,
                            enableInteractiveSelection: false,
                            textAlign: TextAlign.start,
                            decoration: InputDecoration(
                              hintText: 'rifkydimas@smk.belajar.id',
                              filled: true,
                              fillColor: Colors.white,
                              errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: const Color.fromARGB(
                                          255, 255, 17, 0))),
                              focusedErrorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: const Color.fromARGB(
                                          255, 255, 17, 0))),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                      color: Colors.green, width: 3)),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(color: Colors.white)),
                            )),
                        SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 10),
                          child: Text('Password',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18)),
                        ),
                        Obx(() => TextFormField(
                            validator: validatorPassword,
                            controller: controller.password,
                            obscureText: controller.isObsure.value,
                            obscuringCharacter: '*',
                            autocorrect: false,
                            autofocus: false,
                            enableInteractiveSelection: false,
                            textAlign: TextAlign.start,
                            decoration: InputDecoration(
                              hintText: '*****',
                              filled: true,
                              fillColor: Colors.white,
                              // border: OutlineInputBorder(),
                              errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: const Color.fromARGB(
                                          255, 255, 17, 0))),
                              focusedErrorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: const Color.fromARGB(
                                          255, 255, 17, 0))),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                      color: Colors.green, width: 3)),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(color: Colors.white)),
                              suffixIcon: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      controller.isObsure.value =
                                          !controller.isObsure.value;
                                    },
                                    child: FaIcon(
                                      (controller.isObsure.value) == true
                                          ? FontAwesomeIcons.eye
                                          : FontAwesomeIcons.eyeSlash,
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                            ))),
                        SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 10),
                          child: Text('Confirm Password',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18)),
                        ),
                        Obx(() => TextFormField(
                            validator: ValidationBuilder()
                                .confirmPassword(controller.password)
                                .build(),
                            obscureText: controller.isObsure2.value,
                            obscuringCharacter: '*',
                            autocorrect: false,
                            autofocus: false,
                            enableInteractiveSelection: false,
                            textAlign: TextAlign.start,
                            decoration: InputDecoration(
                              hintText: '*****',
                              filled: true,
                              fillColor: Colors.white,
                              // border: OutlineInputBorder(),
                              errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: const Color.fromARGB(
                                          255, 255, 17, 0))),
                              focusedErrorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: const Color.fromARGB(
                                          255, 255, 17, 0))),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: const BorderSide(
                                      color: Colors.green, width: 3)),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(color: Colors.white)),
                              suffixIcon: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      controller.isObsure2.value =
                                          !controller.isObsure2.value;
                                    },
                                    child: FaIcon(
                                      (controller.isObsure2.value) == true
                                          ? FontAwesomeIcons.eye
                                          : FontAwesomeIcons.eyeSlash,
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                            ))),
                        SizedBox(
                          height: 30,
                        ),
                        Center(child: Obx(
                          () {
                            return TextButton(
                              onPressed: () {
                                controller.postRegister();
                              },
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 60, vertical: 5),
                                child: controller.loading.value
                                    ? CircularProgressIndicator()
                                    : Text('Register',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w900,
                                            fontSize: 16)),
                              ),
                              style: TextButton.styleFrom(
                                  backgroundColor: Colors.grey,
                                  shape: StadiumBorder()),
                            );
                          },
                        )),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Sudah memiliki akun?',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      TextButton(
                          child: Text('Login',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blue.shade300)),
                          onPressed: () {
                            Get.back();
                          },
                          style: ButtonStyle(
                              minimumSize: MaterialStatePropertyAll(Size(0, 0)),
                              padding:
                                  MaterialStatePropertyAll(EdgeInsets.all(2)))),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
