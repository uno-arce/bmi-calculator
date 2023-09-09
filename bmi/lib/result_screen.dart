import 'package:bmi/bmi_screen.dart';
import 'package:bmi/user_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ResultScreen extends StatelessWidget {
  final UserBMI userBMI;
  const ResultScreen({super.key, required this.userBMI});

  @override
  Widget build(BuildContext context) {
    TextStyle appTitle =
        GoogleFonts.dmSans(color: Colors.black, fontWeight: FontWeight.bold);
    TextStyle appFont = GoogleFonts.dmSans(
        color: Colors.black54, fontSize: 16, fontWeight: FontWeight.bold);
    TextStyle appFontHighlightSmall = GoogleFonts.dmSans(
        color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold);
    TextStyle appFontHighlight = GoogleFonts.dmSans(
        color: Colors.black, fontSize: 32, fontWeight: FontWeight.w900);

    Color _getStatusColor(String status) {
      switch (status) {
        case 'normal':
          return Colors.green;
        case 'underweight':
          return Colors.amber;
        case 'overweight':
          return Colors.orange;
        case 'obese':
          return Colors.red;
        default:
          return Colors.black; // You can set a default color if needed
      }
    }

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
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) => BMICalculatorScreen(),
              ),
            );
          },
          child: Text('RE-CALCULATE YOUR BMI', style: appFont),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Center(
            child: SizedBox(
              width: 160 * 2 + 4,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Your Result', style: appFontHighlight),
                  SizedBox(height: 16),
                  Container(
                    height: 425,
                    width: 160 * 2 + 4,
                    padding: EdgeInsets.all(32),
                    decoration: BoxDecoration(
                        color: const Color(0xFFFFDED6),
                        borderRadius: BorderRadius.circular(4)),
                    child: Column(
                      children: [
                        Text(userBMI.status.toUpperCase(),
                            style: GoogleFonts.dmSans(
                                color: _getStatusColor(userBMI.status),
                                fontSize: 16,
                                fontWeight: FontWeight.bold)),
                        Text(userBMI.bmi.toStringAsFixed(1),
                            style: GoogleFonts.dmSans(
                                color: Colors.black,
                                fontSize: 84,
                                fontWeight: FontWeight.bold)),
                        Text('Normal BMI range:', style: appFont),
                        Text('18.5 - 25 kg/m2', style: appFontHighlightSmall),
                        SizedBox(height: 16),
                        Text('You have an ${userBMI.status} body!',
                            style: appFontHighlightSmall),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
