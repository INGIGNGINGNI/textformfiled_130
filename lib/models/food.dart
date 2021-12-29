class Food {
  String? enName;
  String? thName;
  String? foodvalue;
  int? price;
  // bool selected = false;

  // Constructor
  Food(this.enName, this.thName, this.foodvalue, this.price);

  static List<Food> getfood() {
    return [
      Food('Pizza', 'พิซซ่า', 'Pizza', 59),
      Food('Steak', 'สเต๊ก', 'Steak', 239),
      Food('Salad', 'สลัด', 'Salad', 79),
      Food('Shabu', 'ชาบู', 'Shabu', 399),
    ];
  }
}
