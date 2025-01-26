import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wage Calculator',
      home: WageCalculatorScreen(),
    );
  }
}

class WageCalculatorScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _WageCalculatorScreenState();
  }
}

class _WageCalculatorScreenState extends State<WageCalculatorScreen> {
  String hours = '';
  String rate = '';
  final _formKey = GlobalKey<FormState>();

  double regularPay = 0.0;
  double overtimePay = 0.0;
  double totalPay = 0.0;
  double tax = 0.0;

  void calculatePay() {
    if (_formKey.currentState!.validate()) {
      double hoursValue = double.parse(hours);
      double rateValue = double.parse(rate);

      if (hoursValue <= 40) {
        regularPay = hoursValue * rateValue;
        overtimePay = 0.0;
      } else {
        regularPay = 40 * rateValue;
        overtimePay = (hoursValue - 40) * rateValue * 1.5;
      }

      totalPay = regularPay + overtimePay;
      tax = totalPay * 0.18;

      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Wage Calculator'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Input Section
              TextFormField(
                onChanged: (value) => setState(() => hours = value),
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Hours Worked',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Enter hours';
                  }
                  double? hours = double.tryParse(value);
                  if (hours == null || hours > 90) {
                    return 'Invalid hours';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              TextFormField(
                onChanged: (value) => setState(() => rate = value),
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Hourly Rate',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Enter rate';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: calculatePay,
                child: Text('Calculate'),
              ),
              SizedBox(height: 16),

              // Results Section
              Divider(),
              Text('Regular Pay: \$${regularPay.toStringAsFixed(2)}'),
              Text('Overtime Pay: \$${overtimePay.toStringAsFixed(2)}'),
              Text('Total Pay: \$${totalPay.toStringAsFixed(2)}'),
              Text('Tax: \$${tax.toStringAsFixed(2)}'),
              Spacer(),

              // About Me Section
              Container(
                color: Colors.grey[200],
                padding: EdgeInsets.all(16),
                child: Column(
                  children: [
                    Text('Mukund Kapadia'),
                    Text('Student ID: 301403876'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
