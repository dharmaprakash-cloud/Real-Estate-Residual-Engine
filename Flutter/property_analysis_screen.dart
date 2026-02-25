import 'package:flutter/material.dart';

void main() {
  runApp(PropertyAnalysisScreen());
}

class PropertyAnalysisScreen extends StatelessWidget {
  final TextEditingController addressController = TextEditingController();
  final TextEditingController purchasePriceController = TextEditingController();
  final TextEditingController downPaymentController = TextEditingController();
  final TextEditingController monthlyRentController = TextEditingController();
  final TextEditingController interestRateController = TextEditingController();
  final TextEditingController loanTermController = TextEditingController();
  final TextEditingController propertyTaxController = TextEditingController();
  final TextEditingController insuranceController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Property Analysis')), 
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('Property Address'),
              TextField(controller: addressController),
              SizedBox(height: 10),
              Text('Purchase Price'),
              TextField(controller: purchasePriceController, keyboardType: TextInputType.number),
              SizedBox(height: 10),
              Text('Down Payment'),
              TextField(controller: downPaymentController, keyboardType: TextInputType.number),
              SizedBox(height: 10),
              Text('Monthly Rent'),
              TextField(controller: monthlyRentController, keyboardType: TextInputType.number),
              SizedBox(height: 10),
              Text('Interest Rate (%)'),
              TextField(controller: interestRateController, keyboardType: TextInputType.number),
              SizedBox(height: 10),
              Text('Loan Term (years)'),
              TextField(controller: loanTermController, keyboardType: TextInputType.number),
              SizedBox(height: 10),
              Text('Property Tax ($)'),
              TextField(controller: propertyTaxController, keyboardType: TextInputType.number),
              SizedBox(height: 10),
              Text('Insurance ($)'),
              TextField(controller: insuranceController, keyboardType: TextInputType.number),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Perform calculations on button press
                  double purchasePrice = double.parse(purchasePriceController.text);
                  double downPayment = double.parse(downPaymentController.text);
                  double monthlyRent = double.parse(monthlyRentController.text);
                  double interestRate = double.parse(interestRateController.text) / 100 / 12;
                  int loanTerm = int.parse(loanTermController.text) * 12;
                  double propertyTax = double.parse(propertyTaxController.text);
                  double insurance = double.parse(insuranceController.text);

                  double loanAmount = purchasePrice - downPayment;
                  double monthlyPayment = (loanAmount * interestRate * pow((1 + interestRate), loanTerm)) / (pow((1 + interestRate), loanTerm) - 1);
                  double totalMonthlyExpenses = monthlyPayment + (propertyTax / 12) + (insurance / 12);
                  double monthlyCashFlow = monthlyRent - totalMonthlyExpenses;
                  double annualNOI = (monthlyRent * 12) - (propertyTax + insurance);
                  double capRate = (annualNOI / purchasePrice) * 100;
                  double cashOnCashReturn = (monthlyCashFlow * 12) / downPayment * 100;

                  // Display results
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text('Analysis Results'),
                        content: Text('Monthly Cash Flow: \\$${monthlyCashFlow.toStringAsFixed(2)}\nCap Rate: ${capRate.toStringAsFixed(2)}%\nCash-on-Cash Return: ${cashOnCashReturn.toStringAsFixed(2)}%\nAnnual NOI: \\$${annualNOI.toStringAsFixed(2)}\nTotal Monthly Expenses: \\$${totalMonthlyExpenses.toStringAsFixed(2)}'),
                        actions: <Widget>[
                          FlatButton(
                            child: Text('Close'),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      );
                    },
                  );
                },
                child: Text('Analyze'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}