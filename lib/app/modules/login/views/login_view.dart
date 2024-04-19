import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';
import 'package:gread/app/data/constans/validation.dart';
import 'package:gread/app/modules/register/views/register_view.dart';
import 'package:gread/app/routes/app_pages.dart';

import '../controllers/login_controller.dart';
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
}

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final myAppBar = AppBar(
      title: const Text('LoginView'),
      centerTitle: true,
    );
    final heightBody =
        MediaQuery.of(context).size.height - myAppBar.preferredSize.height;

    final widthBody = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: myAppBar,
        body: Container(
          padding: EdgeInsets.only(
              top: heightBody * 0.03, bottom: heightBody * 0.03),
          color: Color.fromRGBO(85, 85, 85, 1),
          height: heightBody,
          child: Form(
            key: controller.formKey,
            child: SingleChildScrollView(
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image(
                      image: AssetImage('logo.png'),
                      width: widthBody * 0.4,
                    ),
                    Container(
                      padding: EdgeInsets.only(
                          top: heightBody * 0.01,
                          bottom: heightBody * 0.07,
                          left: 30,
                          right: 30),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                              padding:
                                  EdgeInsets.only(bottom: heightBody * 0.05),
                              child: Text('Login',
                                  style: TextStyle(
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold)),
                              alignment: Alignment.center),
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
                              autofocus: true,
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
                                // border: OutlineInputBorder(),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                        color: Colors.green, width: 3)),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide:
                                        BorderSide(color: Colors.white)),
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
                          Obx(() {
                            return TextFormField(
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
                                  suffixIcon: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                      borderSide:
                                          BorderSide(color: Colors.white)),
                                ));
                          }),
                          SizedBox(
                            height: 30,
                          ),
                          Center(child: Obx(
                            () {
                              return TextButton(
                                onPressed: () {
                                  controller.login();
                                },
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 60, vertical: 5),
                                  child: controller.loading.value
                                      ? CircularProgressIndicator()
                                      : Text('Login',
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
                        Text('Belum memiliki akun?',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        TextButton(
                            child: Text('Daftar',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blue.shade300)),
                            onPressed: () {
                              Get.toNamed(Routes.REGISTER);
                            },
                            style: ButtonStyle(
                                minimumSize:
                                    MaterialStatePropertyAll(Size(0, 0)),
                                padding: MaterialStatePropertyAll(
                                    EdgeInsets.all(2)))),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
