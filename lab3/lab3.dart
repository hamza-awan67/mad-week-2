// lab3.dart campus cafe orser system

// roll-no 04072313045

const String rollNo = '04072313045';

final int seed = int.parse(rollNo.substring(rollNo.length - 2));
final int t = seed ~/ 10;
final int u = seed % 10;

const List<String> menu = [
  'Chai',
  'Latte',
  'Mocha',
  'Samosa',
  'Brownie',
  'Sandwich',
  'Cold Coffee',
  'Fries',
  'Pakora',
  'Zinger Wrap',
];

int priceOf(int i) => 100 + 7 * i + 3 * t;

final int priceFloor = 60 + 5 * t;
final int taxPercent = 5 + t;
final int bigOrderLimit = 450 + 20 * t;
final int balanceCap = 600 + 20 * t;
final int couponPercent = 5 + t + u;

class Dish {
  late String name;
  late int price;
}

class MenuItem {
  String name;
  int price;

  // Main constructor
  MenuItem(this.name, this.price) {
    if (this.price < priceFloor) {
      this.price = priceFloor;
    }
  }

  // Named constructor (.free)
  MenuItem.free(this.name) : price = 0;

  // Named constructor (.formstring)
  MenuItem.fromString(String text)
      : name = text.split(':')[0],
        price = int.parse(text.split(':')[1]);
}

class OrderLog {
  static OrderLog? _instance;
  final List<String> entries = [];

  OrderLog._internal();

  factory OrderLog() {
    return _instance ??= OrderLog._internal();
  }

  void add(String msg) => entries.add(msg);
}

class Order {
  final int id;
  int table;

  Order(this.id, this.table)
      : assert(table >= 1 && table <= 20);

  String get label => 'Order #$id - Table $table';

  set changeTable(int value) {
    assert(value >= 1 && value <= 20);
    table = value;
  }
}

void main() {
  print('Seed: $seed (t=$t, u=$u)');
  step1();
  step2();
  step3();
  step4();
  step5();
  step6();
  step7();
  step8();
  step9();
  step10();
}

void step1() {
  Dish item1 = Dish();
  item1.name = menu[u];
  item1.price = priceOf(u);

  Dish item2 = Dish();
  int index = (u + 1) % 10;
  item2.name = menu[index];
  item2.price = priceOf(index);

  item2.price = item2.price - u;

  print('--- Step 1 ---');
  print('Step 1: ${item1.name} Rs ${item1.price}');
  print('Step 1: ${item2.name} Rs ${item2.price}');
}

void step2() {
  MenuItem a = MenuItem(menu[u], priceOf(u));

  MenuItem b = MenuItem('Test Special', 15 * u);

  print('--- Step 2 ---');
  print('Step 2: ${a.name} Rs ${a.price}');
  print('Step 2: Test Special Rs ${b.price}');
}

void step3() {
  MenuItem freebie = MenuItem.free('Water');

  int i = (u + 2) % 10;

  MenuItem parsed =
      MenuItem.fromString('${menu[i]}:${priceOf(i)}');

  print('--- Step 3 ---');
  print('Step 3: ${freebie.name} Rs ${freebie.price}');
  print('Step 3: ${parsed.name} Rs ${parsed.price}');
  print('Step 3: floor=$priceFloor, free price=${freebie.price}');
}

void step4() {
  OrderLog log1 = OrderLog();
  OrderLog log2 = OrderLog();

  for (int i = 1; i <= u + 2; i++) {
    String message = 'order #${100 * t + i}';

    if (i % 2 == 1) {
      log1.add(message);
    } else {
      log2.add(message);
    }
  }

  print('--- Step 4 ---');
  print('Step 4: same object? ${identical(log1, log2)}');
  print('Step 4: entries = ${log1.entries.length}');
  print('Step 4: last = ${log2.entries.last}');
}

void step5() {
  Order order = Order(100 + u, 5 + u);

  print('--- Step 5 ---');
  print('Step 5: order id=${order.id}, table=${order.table}');
}

// add getter

void step6() {
  Order order = Order(100 + u, 5 + u);

  print('--- Step 6 ---');
  print('Step 6: ${order.label}');
}

// add setter

void step7() {
  Order order = Order(100 + u, 5 + u);

  order.changeTable = 12;

  print('--- Step 7 ---');
  print('Step 7: ${order.label}');
}

// create a list

void step8() {
  List<MenuItem> items = [];

  for (int i = 0; i < menu.length; i++) {
    items.add(MenuItem(menu[i], priceOf(i)));
  }

  print('--- Step 8 ---');

  for (MenuItem item in items) {
    print('${item.name}: Rs ${item.price}');
  }
}

// calculate bill

void step9() {
  MenuItem item1 = MenuItem(menu[u], priceOf(u));
  MenuItem item2 = MenuItem(menu[(u + 1) % 10], priceOf((u + 1) % 10));

  int subtotal = item1.price + item2.price;
  int tax = (subtotal * taxPercent) ~/ 100;
  int total = subtotal + tax;

  print('--- Step 9 ---');
  print('${item1.name}: Rs ${item1.price}');
  print('${item2.name}: Rs ${item2.price}');
  print('Subtotal: Rs $subtotal');
  print('Tax: Rs $tax');
  print('Total: Rs $total');
}

void step10() {
  int subtotal = 301;

  int discount = (subtotal * couponPercent) ~/ 100;
  int afterDiscount = subtotal - discount;

  int tax = (afterDiscount * taxPercent) ~/ 100;
  int total = afterDiscount + tax;

  print('--- Step 10 ---');
  print('Subtotal: Rs $subtotal');
  print('Coupon: $couponPercent%');
  print('Discount: Rs $discount');
  print('After discount: Rs $afterDiscount');
  print('Tax: Rs $tax');
  print('Final total: Rs $total');
}

// ==================== REFLECTION QUESTIONS ====================

/* Q1. Animal(this.name, this.type); and the verbose constructor give the same result.
 What does the shorthand save you?
 Ans:  shorthand saves us from writing separate assignments for each field.
 It makes the constructor shorter and easier to read.

 Q2. When would you choose a named constructor, and when a factory constructor?
 Ans: I would use a named constructor when I need different ways to create an object.
 I would use a factory constructor when I need more control over object creation, such as
 returning an existing object or choosing which object to create.

 Q3. What is the difference between assigning a field in a constructor body and assigning it
 in an initializer list?
 Ans: An initializer list assigns fields before the constructor body runs and can initialize
 final fields. A constructor body runs after the initial values have been set.

 Q4. Give one reason to use a getter instead of storing the value in a field, and one reason
 to use a setter instead of a public field.
 Ans: A getter can calculate a value when it is accessed. A setter allows us to
 control a value before changing it.*/












