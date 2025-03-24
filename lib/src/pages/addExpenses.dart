import 'package:flutter/material.dart';

class addExpensesPage extends StatefulWidget {
  const addExpensesPage({Key? key}) : super(key: key);

  @override
  State<addExpensesPage> createState() => _AddExpensesScreenState();
}

class _AddExpensesScreenState extends State<addExpensesPage> {
  final TextEditingController _amountController = TextEditingController();
  String? _selectedCategory;

  final List<String> _categories = [
    'Food',
    'Drunk',
    'Sport',
    'Game',
  ];

  void _addExpense() {
    if (_amountController.text.isEmpty || _selectedCategory == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('กรุณากรอกจำนวนเงินและเลือกหมวดหมู่'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    // ทำการบันทึกข้อมูลค่าใช้จ่าย
    // โค้ดส่วนนี้จะเพิ่มข้อมูลเข้าสู่ฐานข้อมูลหรือ state management ที่คุณใช้
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
            'เพิ่มค่าใช้จ่าย ${_amountController.text} บาท ในหมวด $_selectedCategory เรียบร้อยแล้ว'),
        backgroundColor: Colors.green,
      ),
    );

    // ล้างข้อมูลหลังบันทึก
    setState(() {
      _amountController.clear();
      _selectedCategory = null;
    });
  }

  @override
  void dispose() {
    _amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: const BackButton(
          color: Colors.black,
        ),
        title: const Text(
          'Add Expenses',
          style: TextStyle(
            color: Colors.green,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Amount',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _amountController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.grey[100],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide.none,
                ),
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 14,
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Category',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                childAspectRatio: 1,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemCount: _categories.length,
              itemBuilder: (context, index) {
                final category = _categories[index];
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedCategory = category;
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFF2D4F63),
                      borderRadius: BorderRadius.circular(8),
                      border: _selectedCategory == category
                          ? Border.all(color: Colors.blue, width: 2)
                          : null,
                    ),
                    child: Center(
                      child: Text(
                        category,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
            const SizedBox(height: 40),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: _addExpense,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text(
                  'เพิ่มค่าใช้จ่าย',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
