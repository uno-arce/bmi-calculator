import 'package:bmi/result_screen.dart';
import 'package:bmi/user_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';

class BMICalculatorScreen extends StatefulWidget {
  const BMICalculatorScreen({super.key});

  @override
  State<BMICalculatorScreen> createState() => _BMICalculatorScreenState();
}

class _BMICalculatorScreenState extends State<BMICalculatorScreen> {
  TextStyle appTitle =
      GoogleFonts.dmSans(color: Colors.black, fontWeight: FontWeight.bold);
  TextStyle appFont = GoogleFonts.dmSans(
      color: Colors.black54, fontSize: 16, fontWeight: FontWeight.bold);
  TextStyle appFontSelected = GoogleFonts.dmSans(
      color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold);
  TextStyle appFontHighlight = GoogleFonts.dmSans(
      color: Colors.black, fontSize: 38, fontWeight: FontWeight.w900);

  var _userInformation =
      UserInformation(sex: 'MALE', height: 183, weight: 74, age: 19);
  bool isMaleSelected = true;
  bool isFemaleSelected = false;

  void _updateSex(String newSex) {
    setState(() {
      _userInformation = UserInformation(
        sex: newSex,
        height: _userInformation.height,
        weight: _userInformation.weight,
        age: _userInformation.age,
      );
      if (_userInformation.sex == 'MALE') {
        isMaleSelected = true;
        isFemaleSelected = false;
      } else {
        isMaleSelected = false;
        isFemaleSelected = true;
      }
    });
  }

  void _updateHeight(int newHeight) {
    setState(() {
      _userInformation = UserInformation(
        sex: _userInformation.sex,
        height: newHeight,
        weight: _userInformation.weight,
        age: _userInformation.age,
      );
    });
  }

  void _updateWeight(int newWeight) {
    setState(() {
      _userInformation = UserInformation(
        sex: _userInformation.sex,
        height: _userInformation.height,
        weight: newWeight,
        age: _userInformation.age,
      );
    });
  }

  void _updateAge(int newAge) {
    setState(() {
      _userInformation = UserInformation(
        sex: _userInformation.sex,
        height: _userInformation.height,
        weight: _userInformation.weight,
        age: newAge,
      );
    });
  }

  void _calculateBMI() {
    double heightInMeters = _userInformation.height / 100;
    double heightSquared = heightInMeters * heightInMeters;
    double bmi = _userInformation.weight / heightSquared;

    String status;
    if (bmi < 18.5) {
      status = "underweight";
    } else if (bmi >= 18.5 && bmi < 24.9) {
      status = "normal";
    } else if (bmi >= 25.0 && bmi < 29.9) {
      status = "overweight";
    } else {
      status = "obese body";
    }

    UserBMI passedUserBMI = UserBMI(status: status, bmi: bmi);
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => ResultScreen(userBMI: passedUserBMI),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFCEC2),
      appBar: AppBar(
        title: Text('BMI CALCULATOR', style: appTitle),
        backgroundColor: const Color(0xFFFFCEC2),
      ),
      bottomNavigationBar: SizedBox(
        height: 50,
        child: OutlinedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.white),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(0),
              ),
            ),
            side: MaterialStateProperty.all(
              BorderSide.none,
            ),
          ),
          onPressed: () {
            _calculateBMI();
          },
          child: Text('CALCULATE YOUR BMI', style: appFont),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 125,
                    width: 160,
                    child: OutlinedButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.white54),
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                        side: MaterialStateProperty.all(
                          BorderSide.none,
                        ),
                      ),
                      onPressed: () {
                        _updateSex('MALE');
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Icon(
                            PhosphorIcons.gender_male,
                            size: 64,
                            color:
                                isMaleSelected ? Colors.black : Colors.black54,
                          ),
                          Text('MALE',
                              style: GoogleFonts.dmSans(
                                  color: isMaleSelected
                                      ? Colors.black
                                      : Colors.black54,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold))
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 4),
                  SizedBox(
                    height: 125,
                    width: 160,
                    child: OutlinedButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.white54),
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                        side: MaterialStateProperty.all(
                          BorderSide.none,
                        ),
                      ),
                      onPressed: () {
                        _updateSex('FEMALE');
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Icon(
                            PhosphorIcons.gender_female,
                            size: 64,
                            color: isFemaleSelected
                                ? Colors.black
                                : Colors.black54,
                          ),
                          Text('FEMALE',
                              style: GoogleFonts.dmSans(
                                  color: isFemaleSelected
                                      ? Colors.black
                                      : Colors.black54,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold))
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Container(
                height: 180,
                width: 160 * 2 + 4,
                decoration: BoxDecoration(
                    color: const Color(0xFFFFDED6),
                    borderRadius: BorderRadius.circular(4)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text('HEIGHT', style: appFont),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(_userInformation.height.toString(),
                            style: appFontHighlight),
                        Padding(
                          padding: const EdgeInsets.only(top: 15),
                          child: Text('cm', style: appFont),
                        ),
                      ],
                    ),
                    Slider(
                      value: _userInformation.height.toDouble(),
                      max: 250,
                      onChanged: (double value) {
                        setState(() {
                          _updateHeight(value.toInt());
                        });
                      },
                    )
                  ],
                ),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 160,
                    width: 160,
                    decoration: BoxDecoration(
                        color: const Color(0xFFFFDED6),
                        borderRadius: BorderRadius.circular(4)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text('WEIGHT', style: appFont),
                        Text(_userInformation.weight.toString(),
                            style: appFontHighlight),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            OutlinedButton(
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all(Colors.white54),
                                shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                ),
                                side: MaterialStateProperty.all(
                                  BorderSide.none,
                                ),
                              ),
                              onPressed: () {
                                setState(() {
                                  _updateWeight(_userInformation.weight - 1);
                                });
                              },
                              child: const Icon(PhosphorIcons.minus,
                                  size: 32, color: Colors.black),
                            ),
                            OutlinedButton(
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all(Colors.white54),
                                shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                ),
                                side: MaterialStateProperty.all(
                                  BorderSide.none,
                                ),
                              ),
                              onPressed: () {
                                setState(() {
                                  _updateWeight(_userInformation.weight + 1);
                                });
                              },
                              child: const Icon(PhosphorIcons.plus,
                                  size: 32, color: Colors.black),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  const SizedBox(width: 4),
                  Container(
                    height: 160,
                    width: 160,
                    decoration: BoxDecoration(
                        color: const Color(0xFFFFDED6),
                        borderRadius: BorderRadius.circular(4)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text('AGE', style: appFont),
                        Text(_userInformation.age.toString(),
                            style: appFontHighlight),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            OutlinedButton(
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all(Colors.white54),
                                shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                ),
                                side: MaterialStateProperty.all(
                                  BorderSide.none,
                                ),
                              ),
                              onPressed: () {
                                setState(() {
                                  _updateAge(_userInformation.age - 1);
                                });
                              },
                              child: const Icon(PhosphorIcons.minus,
                                  size: 32, color: Colors.black),
                            ),
                            OutlinedButton(
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all(Colors.white54),
                                shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                ),
                                side: MaterialStateProperty.all(
                                  BorderSide.none,
                                ),
                              ),
                              onPressed: () {
                                setState(() {
                                  _updateAge(_userInformation.age + 1);
                                });
                              },
                              child: const Icon(PhosphorIcons.plus,
                                  size: 32, color: Colors.black),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
