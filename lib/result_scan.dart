import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:verio/QR_code.dart';


class ResultScan extends StatelessWidget {

  final String code;
  final Function() closeScreen;

  const ResultScan({super.key, required this.code, required this.closeScreen});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        leading: IconButton(onPressed: (){
          closeScreen();
          Navigator.pop(context);
        }, icon: Icon(Icons.arrow_back_ios_new_rounded, color: Colors.black87,)),
        centerTitle: true,
        title: Text("VERIO Scanner", style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            letterSpacing: 1),),
      ),
      body: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children:  [

              Text("Résultat du Scan", style: TextStyle(
                  fontSize: 18,
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1),),
              SizedBox(height: 10,),
              Text(code, style: TextStyle(
                  fontSize: 16,
                  color: Colors.black87,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1),),
              const SizedBox(height: 10,),
              SizedBox(
                width: MediaQuery.of(context).size.width-100,
                height: 48,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                  ),
                  onPressed: (){
                    Clipboard.setData(ClipboardData(text: code));
                  }, 
                child: const Text("Copier", style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  letterSpacing: 1.0,
                ),)),
              ),
            ],
          ),
      ),
    );
  }
}
