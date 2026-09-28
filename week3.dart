// week3.dart
// Hamza Awan 04072313045
final List<Map<String, dynamic>> books = [
  {
    'title': 'Dart in Action',
    'author': 'Ada',
    'year': 2021,
    'copies': 3,
    'tags': ['dart', 'programming']
  },
  {
    'title': 'Flutter Basics',
    'author': 'Sam',
    'year': 2023,
    'copies': 0,
    'tags': ['flutter', 'mobile']
  },
  {
    'title': 'Clean Code',
    'author': 'Martin',
    'year': 2008,
    'copies': 2,
    'tags': ['programming', 'design']
  },
  {
    'title': 'Algorithms',
    'author': 'Knuth',
    'year': 1968,
    'copies': 1,
    'tags': ['programming', 'math']
  },
  {
    'title': 'UI Design',
    'author': 'Nora',
    'year': 2019,
    'copies': 4,
    'tags': ['design', 'mobile']
  },
];

// part 1

// 1.1(positional parameter)
double lateFee(int daysLate, double ratePerDay) => daysLate * ratePerDay;

// 1.2(optional parameter)
String formatTitle(String title, [String? author]) {
  if (author == null) {
    return title;
  }

  return '$title by $author';
}

// 1.3(named paramter)
Map<String, dynamic> makeBook({
  required String title,
  required String author,
  int year = 2024,
  int copies = 1,
}) {
  return {
    'title': title,
    'author': author,
    'year': year,
    'copies': copies,
  };
}

// 1.4(arrow function)
bool isClassic(int year) => year < 2000;


//  PART 2

// 2.1(higher order function)
List<String> transformAll(
    List<String> items, String Function(String) fn) {
  return items.map(fn).toList();
}

// 2.2
int Function() makeCounter() {
  int count = 0;

  return () {
    count++;
    return count;
  };
}

// 2.3
double Function(int) makeFeeCalculator(double rate) {
  return (int days) => days * rate;
}

// 2.4(recursive)
int sumDigits(int n) {
  if (n < 10) {
    return n;
  }

  return (n % 10) + sumDigits(n ~/ 10);
}


// MAIN

void main() async {
  part1();
  part2();
//   part3();
//   part4();
//   part5();
//   await part6();
}


//  PART 1 output

void part1() {
  print('--- Part 1 ---');

  print('Late fee: ${lateFee(5, 0.5)}');

  print(formatTitle('Dart in Action'));

  print(formatTitle('Dart in Action', 'Ada'));

  print(makeBook(
    title: 'Clean Code',
    author: 'Martin',
  ));

  print(makeBook(
    title: 'Algorithms',
    author: 'Knuth',
    year: 1968,
  ));

  print(isClassic(1968));

  print(isClassic(2021));
}


//  PART 2 output

void part2() {
  print('--- Part 2 ---');

  final items = ['Dart in Action', 'Clean Code'];

  // Anonymous function: converts strings to uppercase
  final upperCase = transformAll(
    items,
    (item) => item.toUpperCase(),
  );

  print(upperCase);

  // Arrow function: adds !
  final withExclamation = transformAll(
    items,
    (item) => '$item!',
  );

  print(withExclamation);

  // Two independent closures
  final desk1 = makeCounter();
  final desk2 = makeCounter();

  print(desk1());
  print(desk1());
  print(desk1());

  print(desk2());

  // Fee calculator closures
  final studentFee = makeFeeCalculator(0.25);
  final staffFee = makeFeeCalculator(0.10);

  print('Student fee: ${studentFee(4)}');
  print('Staff fee: ${staffFee(4)}');

  print('Sum of digits: ${sumDigits(1235)}');
}


