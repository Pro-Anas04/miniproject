class Expense {
  final int? id;
  final double amount;
  final String category;
  final DateTime date;

  Expense({
    this.id,
    required this.amount,
    required this.category,
    required this.date,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'amount': amount,
      'category': category,
      'date': date.toIso8601String(),
    };
  }

  static Expense fromMap(Map<String, dynamic> map) {
    return Expense(
      id: map['id'] as int?,
      amount: map['amount'] as double,
      category: map['category'] as String,
      date: DateTime.parse(map['date'] as String),
    );
  }
}
