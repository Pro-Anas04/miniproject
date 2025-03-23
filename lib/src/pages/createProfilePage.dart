import 'package:flutter/material.dart';
import '../widgets/create_wallet_card.dart';

class CreateProfilePage extends StatefulWidget {
  const CreateProfilePage({super.key});

  @override
  State<CreateProfilePage> createState() => _CreateProfilePageState();
}

class _CreateProfilePageState extends State<CreateProfilePage> {
  String? selectedSpendPeriod;
  List<String> spendPeriodItems = ['A Day', 'A Week'];

  String? selectedCurrency;
  List<String> currencyItems = ['THB', 'USD', 'EUR', 'JPY', 'CNY', 'GBP'];

  final _formKey = GlobalKey<FormState>();

  void _handleSubmit() {
    if (_formKey.currentState!.validate()) {
      // Process data
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.blue.shade800,
        title: const Text(
          "Welcome To MoneySpend",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 22,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.blue.shade800, Colors.blue.shade200],
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: CreateWalletCard(
                formKey: _formKey,
                selectedSpendPeriod: selectedSpendPeriod,
                spendPeriodItems: spendPeriodItems,
                selectedCurrency: selectedCurrency,
                currencyItems: currencyItems,
                onSpendPeriodChanged: (String? newValue) {
                  setState(() {
                    selectedSpendPeriod = newValue;
                  });
                },
                onCurrencyChanged: (String? newValue) {
                  setState(() {
                    selectedCurrency = newValue;
                  });
                },
                onSubmit: _handleSubmit,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
