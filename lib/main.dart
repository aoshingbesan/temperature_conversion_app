import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Temperature Converter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TemperatureConverter(),
    );
  }
}

class TemperatureConverter extends StatefulWidget {
  @override
  _TemperatureConverterState createState() => _TemperatureConverterState();
}

class _TemperatureConverterState extends State<TemperatureConverter> {
  bool isFahrenheitToCelsius = true;
  TextEditingController _temperatureController = TextEditingController();
  String _result = '';
  List<String> _history = [];

  // Convert the temperature and update the UI
  void _convert() {
    if (_temperatureController.text.isEmpty) return;

    double inputTemp = double.parse(_temperatureController.text);
    double convertedTemp;
    String operation;

    // Apply conversion formula based on selected direction
    if (isFahrenheitToCelsius) {
      convertedTemp = (inputTemp - 32) * 5 / 9;
      operation = 'F to C';
    } else {
      convertedTemp = inputTemp * 9 / 5 + 32;
      operation = 'C to F';
    }

    // Update state and add to conversion history
    setState(() {
      _result = convertedTemp.toStringAsFixed(2);
      _history.insert(0, '$operation: ${inputTemp.toStringAsFixed(1)} => $_result');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Temperature Converter'),
      ),
      body: OrientationBuilder(
        builder: (context, orientation) {
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: RadioListTile<bool>(
                          title: Text('F to C'),
                          value: true,
                          groupValue: isFahrenheitToCelsius,
                          onChanged: (value) {
                            setState(() {
                              isFahrenheitToCelsius = value!;
                            });
                          },
                        ),
                      ),
                      Expanded(
                        child: RadioListTile<bool>(
                          title: Text('C to F'),
                          value: false,
                          groupValue: isFahrenheitToCelsius,
                          onChanged: (value) {
                            setState(() {
                              isFahrenheitToCelsius = value!;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 24),
                  TextField(
                    controller: _temperatureController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'Enter temperature',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 24),
                  ElevatedButton(
                    child: Text('Convert'),
                    onPressed: _convert,
                  ),
                  SizedBox(height: 24),
                  Text(
                    'Result: $_result',
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 24),
                  Text(
                    'History:',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 12),
                  Container(
                    height: orientation == Orientation.portrait ? 200 : 100,
                    child: ListView.builder(
                      itemCount: _history.length,
                      itemBuilder: (context, index) {
                        return Text(_history[index]);
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}