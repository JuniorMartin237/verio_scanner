import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:verio/result_scan.dart';

const bgColor = Color(0xfffafafa);

class QrCode extends StatefulWidget {
  const QrCode({super.key});

  @override
  State<QrCode> createState() => _QrCodeState();
}

class _QrCodeState extends State<QrCode> {
  @override
  Widget build(BuildContext context) {

    bool isScancompleted = false;

    void closeScreen(){
      isScancompleted = false;
    }

    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "VERIO Scanner",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            letterSpacing: 1,
          ),
        ),
      ),
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Placez le QR Code dans la zone",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Le scan sera lancé automatiquement",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black54,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 3,
              child: MobileScanner(
                allowDuplicates: true,
                onDetect: (barcode, args){
                    if(!isScancompleted){
                      String code = barcode.rawValue ?? '----';
                      isScancompleted =true;
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ResultScan(
                            closeScreen: closeScreen,
                            code: code,
                          ),
                        ),
                      );
                    }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
