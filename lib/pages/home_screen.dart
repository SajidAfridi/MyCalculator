import 'package:flutter/material.dart';
import '../widgets/theme/themChanger.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String valueGettingComputed = '';
  String totalValue = '';
  String operator = '';

  operation([clearAll]) {
    operator = valueGettingComputed.replaceAll(RegExp(r"[^+-/x%]"), '');
    int firstValue = 0;
    int secondValue = 0;
    if (operator.isNotEmpty) {
      List<String> separateValue;
      separateValue = valueGettingComputed.split(operator);
      firstValue = int.parse(separateValue[0]);
      secondValue = int.parse(separateValue[1]);
    }
    if (clearAll == 'C') {
      setState(() {
        valueGettingComputed = ' ';
        totalValue = '0';
      });
    } else if (operator == '+') {
      setState(() {
        totalValue = (firstValue + secondValue).toString();
      });
    } else if (operator == '-') {
      setState(() {
        totalValue = (firstValue - secondValue).toString();
      });
    } else if (operator == 'x') {
      setState(() {
        totalValue = (firstValue * secondValue).toString();
      });
    } else if (operator == '/') {
      setState(() {
        totalValue = (firstValue / secondValue).toString();
      });
    } else if (operator == '%') {
      setState(() {
        totalValue = ((firstValue / secondValue) * 100).toString();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        body: Column(
          children: [
            resultScreen(),
            buildButtons(),
          ],
        ),
      ),
    );
  }

  buildButtons() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 1),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.58,
        width: MediaQuery.of(context).size.width,
        color: Theme.of(context).backgroundColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                buildContainer(
                  () {
                    operation('C');
                  },
                  'C',
                ),
                buildContainer(() {
                  setState(() {
                    // Here is the logic of trimming the string in
                    // order to remove the last part of the string
                    if (valueGettingComputed.isNotEmpty) {
                      var reversedValue =
                          valueGettingComputed.split('').reversed.join();
                      reversedValue = reversedValue.substring(1);
                      valueGettingComputed =
                          reversedValue.split('').reversed.join();
                    }
                  });
                }, '+/='),
                buildContainer(() {
                  setState(() {
                    if(valueGettingComputed.isNotEmpty){
                      valueGettingComputed =
                          valueGettingComputed + '%'.toString();
                    }
                  });
                }, '%'),
                buildContainer(() {
                  setState(() {
                    valueGettingComputed =
                        valueGettingComputed + '/'.toString();
                  });
                }, '/'),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                buildContainer(() {
                  setState(() {
                    valueGettingComputed = valueGettingComputed + 7.toString();
                  });
                }, 7),
                buildContainer(() {
                  setState(() {
                    valueGettingComputed = valueGettingComputed + 8.toString();
                  });
                }, 8),
                buildContainer(() {
                  setState(() {
                    valueGettingComputed = valueGettingComputed + 9.toString();
                  });
                }, 9),
                buildContainer(() {
                  setState(() {
                    valueGettingComputed =
                        valueGettingComputed + 'x'.toString();
                  });
                }, '*'),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                buildContainer(() {
                  setState(() {
                    valueGettingComputed = valueGettingComputed + 4.toString();
                  });
                }, 4),
                buildContainer(() {
                  setState(() {
                    valueGettingComputed = valueGettingComputed + 5.toString();
                  });
                }, 5),
                buildContainer(() {
                  setState(() {
                    valueGettingComputed = valueGettingComputed + 6.toString();
                  });
                }, 6),
                buildContainer(() {
                  setState(() {
                    valueGettingComputed =
                        valueGettingComputed + '+'.toString();
                  });
                }, '+'),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                buildContainer(() {
                  setState(() {
                    valueGettingComputed = valueGettingComputed + 1.toString();
                  });
                }, 1),
                buildContainer(() {
                  setState(() {
                    valueGettingComputed = valueGettingComputed + 2.toString();
                  });
                }, 2),
                buildContainer(() {
                  setState(() {
                    valueGettingComputed = valueGettingComputed + 3.toString();
                  });
                }, 3),
                buildContainer(() {
                  setState(() {
                    valueGettingComputed =
                        valueGettingComputed + '-'.toString();
                  });
                }, '-'),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                buildContainer(() {
                  setState(() {
                    valueGettingComputed = valueGettingComputed + 0.toString();
                  });
                }, 0),
                buildContainer(() {
                  setState(() {
                    valueGettingComputed =
                        valueGettingComputed + '.'.toString();
                  });
                }, '.'),
                buildContainer(() {
                  setState(() {
                    operation();
                  });
                }, '='),
              ],
            ),
          ],
        ),
      ),
    );
  }

  buildContainer(voiceCallBack, value) {
    var yellowButton = 0;
    if (value == "/" ||
        value == '+' ||
        value == '*' ||
        value == '-' ||
        value == '=') {
      yellowButton = 1;
    } else if (value == "C" || value == '+/=' || value == '%') {
      yellowButton = 2;
    } else {
      yellowButton = 0;
    }
    return InkWell(
      onTap: voiceCallBack,
      child: Container(
        height: MediaQuery.of(context).size.height * 0.1,
        width: value == 0
            ? MediaQuery.of(context).size.width * 0.44
            : MediaQuery.of(context).size.width * 0.20,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: buttonColorDecider(yellowButton),
            boxShadow: Theme.of(context).cardColor == Colors.white
                ? [
                    const BoxShadow(
                      color: Colors.black12,
                      offset: Offset(4, 4),
                      blurRadius: 15,
                      spreadRadius: 1,
                    ),
                    const BoxShadow(
                      color: Colors.black26,
                      offset: Offset(-4, -4),
                      blurRadius: 15,
                      spreadRadius: 1,
                    )
                  ]
                : [
                    BoxShadow(
                      color: Colors.grey.shade200,
                      offset: const Offset(4, 4),
                      blurRadius: 15,
                      spreadRadius: 1,
                    ),
                    const BoxShadow(
                      color: Colors.grey,
                      offset: Offset(-4, -4),
                      blurRadius: 15,
                      spreadRadius: 1,
                    )
                  ]),
        child: Center(
          child: value == '+/='
              ? Icon(
                  Icons.backspace_outlined,
                  size: 30,
                  color: Theme.of(context).cardColor,
                )
              : Text(
                  value.toString(),
                  style: TextStyle(
                      fontSize: 30, color: Theme.of(context).cardColor),
                ),
        ),
      ),
    );
  }

  buttonColorDecider(number) {
    if (number == 1) {
      return Theme.of(context).primaryColor;
    } else if (number == 2) {
      return Theme.of(context).secondaryHeaderColor;
    } else {
      return Theme.of(context).canvasColor;
    }
  }

  resultScreen() {
    return Stack(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          height: MediaQuery.of(context).size.height * 0.38,
          width: MediaQuery.of(context).size.width,
          color: Theme.of(context).backgroundColor,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  valueGettingComputed.isEmpty
                      ? 0.toString()
                      : valueGettingComputed.toString(),
                  style: TextStyle(
                      fontSize: 40,
                      color: Theme.of(context).secondaryHeaderColor),
                ),
                Text(
                  totalValue.isEmpty ? 0.toString() : totalValue.toString(),
                  style: TextStyle(
                      fontSize: 60, color: Theme.of(context).cardColor),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          top: 1,
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 8),
            height: MediaQuery.of(context).size.height * 0.1,
            width: MediaQuery.of(context).size.width * 0.2,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Theme.of(context).canvasColor,
            ),
            child: IconButton(
              onPressed: () {
                setState(() {
                  ThemeBuilder.of(context)!.changeTheme();
                });
              },
              icon: const Icon(
                Icons.wb_sunny,
                size: 30,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
