import 'package:flutter/material.dart';
import 'custom_text_field.dart';
import 'custom_dropdown.dart';
import 'profile_avatar.dart';

class CreateWalletCard extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final String? selectedSpendPeriod;
  final List<String> spendPeriodItems;
  final String? selectedCurrency;
  final List<String> currencyItems;
  final Function(String?) onSpendPeriodChanged;
  final Function(String?) onCurrencyChanged;
  final VoidCallback onSubmit;

  const CreateWalletCard({
    super.key,
    required this.formKey,
    required this.selectedSpendPeriod,
    required this.spendPeriodItems,
    required this.selectedCurrency,
    required this.currencyItems,
    required this.onSpendPeriodChanged,
    required this.onCurrencyChanged,
    required this.onSubmit,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Container(
        padding: const EdgeInsets.all(24),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              const Text(
                'Create Your Wallet',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                  color: Colors.blue,
                ),
              ),
              const SizedBox(height: 24),
              const ProfileAvatar(initials: 'AH'),
              const SizedBox(height: 24),
              const CustomTextField(
                label: 'Wallet Name',
                hint: 'Enter your wallet name',
                icon: Icons.account_balance_wallet,
                isRequired: true,
              ),
              const SizedBox(height: 16),
              const CustomTextField(
                label: 'Starting Money',
                hint: 'Enter your initial balance',
                icon: Icons.monetization_on,
                keyboardType: TextInputType.number,
                isRequired: true,
              ),
              const SizedBox(height: 24),
              Row(
                children: [
                  Expanded(
                    child: CustomDropdown(
                      hint: "Spend Money Per?",
                      value: selectedSpendPeriod,
                      items: spendPeriodItems,
                      icon: Icons.calendar_today,
                      onChanged: onSpendPeriodChanged,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: CustomDropdown(
                      hint: "Select Currency",
                      value: selectedCurrency,
                      items: currencyItems,
                      icon: Icons.currency_exchange,
                      onChanged: onCurrencyChanged,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              const CustomTextField(
                label: 'Expense Limit',
                hint: 'How much money can you spend?',
                icon: Icons.money_off,
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 32),
              SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                  onPressed: onSubmit,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue.shade800,
                    foregroundColor: Colors.white,
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  child: const Text(
                    'CREATE WALLET',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
