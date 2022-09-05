// Standard package
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String input = "";
  String value = "";
  String changeValue2 = "";
  double value1 =0;
  double value2 =0;
  String operator = "";
  String result = "";
  String resultCheck = "";
  String infinityCheck = "";
  String decimal='';
  bool decimalKey = false;
/*
  double fontSize = 30;

  onChanged(){
    setState(() {
      if(input.length<18){
        fontSize = 30;
      }
      else{
        fontSize =25;
      }
    });
  }
*/


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [

            const Center(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 15,vertical: 20),
                child: Text(
                  "Basic Calculator",
                  style: TextStyle(
                    color: Colors.cyan,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
              height: 160,
              width: 340,
              decoration: BoxDecoration(
                color: Colors.black12,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  SizedBox(
                    height: 50,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      reverse: true,
                      child: Text(
                        input,
                        textDirection: TextDirection.ltr,
                        style: TextStyle(
                          color: Colors.cyan,
                          fontSize: input.length<=18 ? 30 : 26,
                          fontWeight: FontWeight.bold,

                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 15,),
                  SizedBox(
                    height: 50,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Text(
                        result,
                        textDirection: TextDirection.ltr,
                        style: TextStyle(
                          color: Colors.cyan,
                          fontSize: result.length<=18 ? 30 : 26,
                          fontWeight: FontWeight.bold,

                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20,),


            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 22,vertical: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 72,
                          width: 72,
                          /*decoration: BoxDecoration(
                              border: Border.all(
                                  color: Colors.white24,
                                  width: 4
                              ),
                              borderRadius: BorderRadius.circular(100)
                          ),*/
                          child: ElevatedButton(
                            onPressed: (){
                              setState(() {
                                input = "";
                                value = "";
                                changeValue2 = "";
                                value1 =0;
                                value2 =0;
                                operator = "";
                                result = "";
                                resultCheck = "";
                                infinityCheck = "";
                                decimal = '';
                                decimalKey = false;


                              });
                            },
                            child: const Text(
                              "AC",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                                primary: Colors.blueGrey,
                                elevation: 300,
                                // shadowColor: Colors.yellow.shade900,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(100)
                                )
                            ),
                          ),
                        ),
                        Container(
                          height: 72,
                          width: 72,

                          child: ElevatedButton(
                            onPressed: (){
                              setState(() {

                                if(result.isEmpty){
                                  if(input.isNotEmpty){
                                    if(decimal == input.substring(input.length-1)){
                                      decimal = '';
                                      decimalKey = false;
                                    }
                                    if(operator == input.substring(input.length-1)){
                                      operator = '';
                                      if((decimalKey == true)||(decimalKey == false&&operator.isEmpty)){
                                        decimal = '.';
                                        print(decimal);
                                      }

                                    }

                                    input= input.substring(0, input.length - 1);
                                    value= input;

                                    if(changeValue2.isNotEmpty) {
                                      changeValue2 = changeValue2.substring(0, changeValue2.length - 1);

                                    }

                                  }
                                }


                              });


                            },
                            child: const Text(
                              "C",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 25,
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                                primary: Colors.blueGrey,
                                elevation: 300,
                                // shadowColor: Colors.yellow.shade900,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(100)
                                )
                            ),
                          ),
                        ),
                        Container(
                          height: 72,
                          width: 72,

                          child: ElevatedButton(
                            onPressed: (){
                              setState(() {
                                if(input.isNotEmpty && operator.isEmpty && input!=decimal && result.isEmpty){
                                  input = input+"%";
                                  operator = "%";
                                  value1 = double.parse(value) ;
                                  value = '';
                                  changeValue2 = '';
                                  decimal = '';
                                  var res =value1/100;
                                  resultCheck = res.toString();
                                  print(resultCheck);
                                  var i=resultCheck.length;
                                  while(i>0){
                                    var zeroCheck = "0";
                                    var decimalCheck = ".";
                                    if(zeroCheck == resultCheck.substring(resultCheck.length-1)){
                                      resultCheck = resultCheck.substring(0, resultCheck.length - 1);

                                    }
                                    if(decimalCheck == resultCheck.substring(resultCheck.length-1)){
                                      resultCheck = resultCheck.substring(0, resultCheck.length - 1);
                                      break;
                                    }

                                    i--;
                                  }
                                  result = resultCheck;

                                  operator = '';

                                }
                                else if(result.isNotEmpty && operator.isEmpty && infinityCheck.isEmpty){
                                  input = result;
                                  value = result;
                                  input = input+ "%";
                                  operator = "%";
                                  value1 = double.parse(value);
                                  value = "";
                                  changeValue2 = '';
                                  result = "";
                                  decimal = '';
                                  var res =value1/100;
                                  resultCheck = res.toString();
                                  print(resultCheck);
                                  var i=resultCheck.length;
                                  while(i>0){
                                    var zeroCheck = "0";
                                    var decimalCheck = ".";
                                    if(zeroCheck == resultCheck.substring(resultCheck.length-1)){
                                      resultCheck = resultCheck.substring(0, resultCheck.length - 1);

                                    }
                                    if(decimalCheck == resultCheck.substring(resultCheck.length-1)){
                                      resultCheck = resultCheck.substring(0, resultCheck.length - 1);
                                      break;
                                    }

                                    i--;
                                  }
                                  result = resultCheck;
                                  operator = '';

                                }
                              });
                            },
                            child: const Text(
                              "%",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 25,
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                                primary: Colors.blueGrey,
                                elevation: 300,
                                // shadowColor: Colors.yellow.shade900,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(100)
                                )
                            ),
                          ),
                        ),
                        Container(
                          height: 72,
                          width: 72,

                          child: ElevatedButton(
                            onPressed: (){
                              setState(() {
                                if(input.isNotEmpty && operator.isEmpty && input!=decimal && result.isEmpty){
                                  input = input+'/';
                                  operator = "/";
                                  value1 = double.parse(value) ;
                                  value = '';
                                  changeValue2 = '';
                                  decimal = '';

                                }
                                if(result.isNotEmpty && infinityCheck.isEmpty){
                                  input = result;
                                  value = result;
                                  input = input+ "/";
                                  operator = "/";
                                  value1 = double.parse(value);
                                  value = "";
                                  changeValue2 = '';
                                  result = "";
                                  decimal = '';
                                }


                              });
                            },
                            child: const Text(
                              "/",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 25,
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                                primary: Colors.blueGrey,
                                elevation: 300,
                                // shadowColor: Colors.yellow.shade900,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(100)
                                )
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 72,
                          width: 72,

                          child: ElevatedButton(
                            onPressed: (){
                              setState(() {
                                if(result.isEmpty){
                                  input = input+'7';
                                  value = value+'7';
                                  changeValue2 = changeValue2+'7';

                                }


                              });
                            },
                            child: const Text(
                              "7",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 25,
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                                primary: Colors.cyan,
                                elevation: 300,
                                // shadowColor: Colors.yellow.shade900,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(100)
                                )
                            ),
                          ),
                        ),
                        Container(
                          height: 72,
                          width: 72,

                          child: ElevatedButton(
                            onPressed: (){
                              setState(() {
                                if(result.isEmpty){
                                  input = input+'8';
                                  value = value+'8';
                                  changeValue2 = changeValue2+'8';

                                }


                              });
                            },
                            child: const Text(
                              "8",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 25,
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                                primary: Colors.cyan,
                                elevation: 300,
                                // shadowColor: Colors.yellow.shade900,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(100)
                                )
                            ),
                          ),
                        ),
                        Container(
                          height: 72,
                          width: 72,

                          child: ElevatedButton(
                            onPressed: (){
                              setState(() {
                                if(result.isEmpty){
                                  input = input+'9';
                                  value = value+'9';
                                  changeValue2 = changeValue2+'9';

                                }


                              });
                            },
                            child: const Text(
                              "9",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 25,
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                                primary: Colors.cyan,
                                elevation: 300,
                                // shadowColor: Colors.yellow.shade900,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(100)
                                )
                            ),
                          ),
                        ),
                        Container(
                          height: 72,
                          width: 72,

                          child: ElevatedButton(
                            onPressed: (){
                              setState(() {
                                if(input.isNotEmpty && operator.isEmpty && input!=decimal && result.isEmpty){
                                  input = input+'*';
                                  operator = "*";
                                  value1 = double.parse(value) ;
                                  value = '';
                                  changeValue2 = '';
                                  decimal = '';

                                }
                                if(result.isNotEmpty && infinityCheck.isEmpty){
                                  input = result;
                                  value = result;
                                  input = input+ "*";
                                  operator = "*";
                                  value1 = double.parse(value);
                                  value = "";
                                  changeValue2 = '';
                                  result = "";
                                  decimal = '';
                                }


                              });
                            },
                            child: const Text(
                              "*",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                                primary: Colors.blueGrey,
                                elevation: 300,
                                // shadowColor: Colors.yellow.shade900,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(100)
                                )
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 72,
                          width: 72,

                          child: ElevatedButton(
                            onPressed: (){
                              setState(() {
                                if(result.isEmpty){
                                  input = input+'4';
                                  value = value+'4';
                                  changeValue2 = changeValue2+'4';

                                }

                              });
                            },
                            child: const Text(
                              "4",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 25,
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                                primary: Colors.cyan,
                                elevation: 300,
                                // shadowColor: Colors.yellow.shade900,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(100)
                                )
                            ),
                          ),
                        ),
                        Container(
                          height: 72,
                          width: 72,

                          child: ElevatedButton(
                            onPressed: (){
                              setState(() {
                                if(result.isEmpty){
                                  input = input+'5';
                                  value = value+'5';
                                  changeValue2 = changeValue2+'5';

                                }

                              });
                            },
                            child: const Text(
                              "5",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 25,
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                                primary: Colors.cyan,
                                elevation: 300,
                                // shadowColor: Colors.yellow.shade900,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(100)
                                )
                            ),
                          ),
                        ),
                        Container(
                          height: 72,
                          width: 72,

                          child: ElevatedButton(
                            onPressed: (){
                              setState(() {
                                if(result.isEmpty){
                                  input = input+'6';
                                  value = value+'6';
                                  changeValue2 = changeValue2+'6';

                                }

                              });
                            },
                            child: const Text(
                              "6",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 25,
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                                primary: Colors.cyan,
                                elevation: 300,
                                // shadowColor: Colors.yellow.shade900,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(100)
                                )
                            ),
                          ),
                        ),
                        Container(
                          height: 72,
                          width: 72,

                          child: ElevatedButton(
                            onPressed: (){
                              setState(() {
                                if(input.isNotEmpty && operator.isEmpty && input!=decimal && result.isEmpty){
                                  input = input+'-';
                                  operator = "-";
                                  value1 = double.parse(value) ;
                                  value = '';
                                  changeValue2 = '';
                                  decimal = '';

                                }
                                if(result.isNotEmpty && infinityCheck.isEmpty){
                                  input = result;
                                  value = result;
                                  input = input+ "-";
                                  operator = "-";
                                  value1 = double.parse(value);
                                  value = "";
                                  changeValue2 = '';
                                  result = "";
                                  decimal = '';
                                }


                              });
                            },
                            child: const Text(
                              "-",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 40,
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                                primary: Colors.blueGrey,
                                elevation: 300,
                                // shadowColor: Colors.yellow.shade900,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(100)
                                )
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 72,
                          width: 72,

                          child: ElevatedButton(
                            onPressed: (){
                              setState(() {
                                if(result.isEmpty){
                                  input = input+'1';
                                  value = value+'1';
                                  changeValue2 = changeValue2+'1';

                                }


                              });
                            },
                            child: const Text(
                              "1",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 25,
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                                primary: Colors.cyan,
                                elevation: 300,
                                // shadowColor: Colors.yellow.shade900,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(100)
                                )
                            ),
                          ),
                        ),
                        Container(
                          height: 72,
                          width: 72,

                          child: ElevatedButton(
                            onPressed: (){
                              setState(() {
                                if(result.isEmpty){
                                  input = input+'2';
                                  value = value+'2';
                                  changeValue2 = changeValue2+'2';


                                }

                              });
                            },
                            child: const Text(
                              "2",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 25,
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                                primary: Colors.cyan,
                                elevation: 300,
                                // shadowColor: Colors.yellow.shade900,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(100)
                                )
                            ),
                          ),
                        ),
                        Container(
                          height: 72,
                          width: 72,

                          child: ElevatedButton(
                            onPressed: (){
                              setState(() {
                                if(result.isEmpty){
                                  input = input+'3';
                                  value = value+'3';
                                  changeValue2 = changeValue2+'3';

                                }

                              });
                            },
                            child: const Text(
                              "3",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 25,
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                                primary: Colors.cyan,
                                elevation: 300,
                                // shadowColor: Colors.yellow.shade900,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(100)
                                )
                            ),
                          ),
                        ),
                        Container(
                          height: 72,
                          width: 72,

                          child: ElevatedButton(
                            onPressed: (){
                              setState(() {
                                if(input.isNotEmpty && operator.isEmpty && input!=decimal && result.isEmpty){
                                  input = input+"+";
                                  operator = "+";
                                  value1 = double.parse(value) ;
                                  value = '';
                                  changeValue2 = '';
                                  decimal = '';

                                }
                                if(result.isNotEmpty && infinityCheck.isEmpty){
                                  input = result;
                                  value = result;
                                  input = input+ "+";
                                  operator = "+";
                                  value1 = double.parse(value);
                                  value = "";
                                  changeValue2 = '';
                                  result = "";
                                  decimal = '';
                                }

                              });

                            },
                            child: const Text(
                              "+",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 25,
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                                primary: Colors.blueGrey,
                                elevation: 300,
                                // shadowColor: Colors.yellow.shade900,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(100)
                                )
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 72,
                          width: 72,

                          child: ElevatedButton(
                            onPressed: (){
                              setState(() {
                                if(result.isEmpty){
                                  input = input+'0';
                                  value = value+'0';
                                  changeValue2 = changeValue2+'0';

                                }

                              });
                            },
                            child: const Text(
                              "0",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 25,
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                                primary: Colors.cyan,
                                elevation: 300,
                                // shadowColor: Colors.yellow.shade900,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(100)
                                )
                            ),
                          ),
                        ),
                        Container(
                          height: 72,
                          width: 72,

                          child: ElevatedButton(
                            onPressed: (){
                              setState(() {
                                if(result.isEmpty){
                                  input = input+'00';
                                  value = value+'00';
                                  changeValue2 = changeValue2+'00';

                                }

                              });
                            },
                            child: const Text(
                              "00",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 25,
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                                primary: Colors.cyan,
                                elevation: 300,
                                // shadowColor: Colors.yellow.shade900,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(100)
                                )
                            ),
                          ),
                        ),
                        Container(
                          height: 72,
                          width: 72,

                          child: ElevatedButton(
                            onPressed: (){
                              setState(() {
                                if(result.isEmpty){
                                  if(decimal.isEmpty){
                                    input = input+'.';
                                    value = value+'.';
                                    changeValue2 = changeValue2+'.';
                                    decimal = '.';
                                    decimalKey = true;
                                  }
                                }


                              });
                            },
                            child: const Text(
                              ".",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 25,
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                                primary: Colors.cyan,
                                elevation: 300,
                                // shadowColor: Colors.yellow.shade900,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(100)
                                )
                            ),
                          ),
                        ),
                        Container(
                          height: 72,
                          width: 72,

                          child: ElevatedButton(
                            onPressed: (){
                              setState(() {
                                if(input.length > 2 && changeValue2.isNotEmpty && changeValue2 != decimal){

                                  value2 = double.parse(changeValue2) ;
                                  if(operator == "+"){
                                    var res = value1 + value2;
                                    resultCheck = res.toString();

                                  }
                                  if(operator == "-"){
                                    var res = value1 - value2;
                                    resultCheck = res.toString();

                                  }
                                  if(operator == "*"){
                                    var res = value1 * value2;
                                    resultCheck = res.toString();

                                  }
                                  if(operator == "/"){
                                    if (value2==0){
                                      resultCheck= "Infinity";
                                      infinityCheck = "Infinity";
                                    }
                                    else{
                                      var res = value1 / value2;
                                      resultCheck = res.toString();
                                    }
                                }
                                  var i=resultCheck.length;
                                while(i>0){
                                    var zeroCheck = "0";
                                    var decimalCheck = ".";
                                    if(zeroCheck == resultCheck.substring(resultCheck.length-1)){
                                      resultCheck = resultCheck.substring(0, resultCheck.length - 1);

                                    }
                                    if(decimalCheck == resultCheck.substring(resultCheck.length-1)){
                                      resultCheck = resultCheck.substring(0, resultCheck.length - 1);
                                      break;
                                    }

                                    i--;
                                }
                                  operator = '';
                                  result = resultCheck;

                                }

                              });
                            },
                            child: const Text(
                              "=",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 25,
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                                primary: Colors.blueGrey,
                                elevation: 300,
                                // shadowColor: Colors.yellow.shade900,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(100)
                                )
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

