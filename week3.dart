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

//  PART 3

// 3.4
Map<String, int> buildStock() {
  return {
    for (final book in books)
      book['title'] as String: book['copies'] as int
  };
}


// PART 4 

// 4.1(generic class name box)
class Box<T> {
  T value;

  Box(this.value);
}

// 4.2(if list!=empty return first element otherwise return last)
T firstOr<T>(List<T> items, T fallback) {
  if (items.isEmpty) {
    return fallback;
  }

  return items.first;
}

// 4.3(pair store 2 values that can have different types)
class Pair<A, B> {
  A first;
  B second;

  Pair(this.first, this.second);

  @override
  String toString() {
    return '($first, $second)';
  }
}


// PART 5

// 5.1(2 exception 1: book not exist   2:book exist but 0 copies)
class BookNotFoundException implements Exception {
  final String title;

  BookNotFoundException(this.title);
}

class BookNotAvailableException implements Exception {
  final String title;

  BookNotAvailableException(this.title);
}

// 5.2(checkout function)
void checkOut(Map<String, int> stock, String title) {
  if (!stock.containsKey(title)) {
    throw BookNotFoundException(title);
  }

  if (stock[title]! <= 0) {
    throw BookNotAvailableException(title);
  }

  stock[title] = stock[title]! - 1;
}

// 5.4
Map<String, dynamic> findBook(String title) {
  return books.firstWhere(
    (book) => book['title'] == title,
  );
}


// PART 6 

// 6.1
Future<String> fetchBookOfTheDay() async {
  await Future.delayed(const Duration(seconds: 1));

  return 'Dart in Action';
}

// 6.3 (handle error)
Future<String> fetchBroken() async {
  await Future.delayed(const Duration(milliseconds: 500));

  throw Exception('Server down');
}



// MAIN

void main() async {
  part1();
  part2();
  part3();
  part4();
  part5();
  await part6();
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

// PART 3 output

void part3() {
  print('--- Part 3 ---');

  // 3.1(use .where to filer and .map to get book title)
  final titles = books
      .map((book) => book['title'] as String)
      .toList();

  print('Titles: $titles');

  final available = books
      .where((book) => (book['copies'] as int) > 0)
      .map((book) => book['title'] as String)
      .toList();

  print('Available: $available');

  // 3.2(fold and reduce)
  final totalCopies = books.fold<int>(
    0,
    (sum, book) => sum + (book['copies'] as int),
  );

  print('Total copies: $totalCopies');

  final years = books
      .map((book) => book['year'] as int)
      .toList();

  final oldestYear = years.reduce(
    (a, b) => a < b ? a : b,
  );

  print('Oldest year: $oldestYear');

  // 3.3(sort book by year)
  final sortedBooks = [...books];

  sortedBooks.sort(
    (a, b) => (a['year'] as int).compareTo(b['year'] as int),
  );

  final sortedTitles = sortedBooks
      .map((book) => book['title'] as String)
      .toList();

  print('By year: $sortedTitles');

  // 3.4
  final stock = buildStock();

  print('Stock: $stock');

  stock.forEach((title, copies) {
    if (copies == 0) {
      print('Out of stock: $title');
    }
  });

  print('Copies of Unknown: ${stock['Unknown'] ?? 0}');

  // 3.5(sets and tags)
  final allTags = <String>{
    for (final book in books) ...(book['tags'] as List<String>)
  };

  print('All tags: $allTags');

  final a = {
    'Dart in Action',
    'Clean Code',
    'Flutter Basics'
  };

  final b = {
    'Clean Code',
    'Flutter Basics',
    'Algorithms'
  };

  print('Union: ${a.union(b)}');

  print('Common: ${a.intersection(b)}');

  print('Only in A: ${a.difference(b)}');
}


//  PART 4 output

void part4() {
  print('--- Part 4 ---');

  // 4.1
  final intBox = Box<int>(5);
  final strBox = Box<String>('hello');

  print('Box<int>: ${intBox.value}');
  print('Box<String>: ${strBox.value}');

  // 4.2
  print(firstOr(
    ['Dart in Action', 'Clean Code'],
    'none',
  ));

  print(firstOr<String>(
    [],
    'z',
  ));

  // 4.3
  print(Pair<String, int>(
    'Dart in Action',
    3,
  ));
}


//  PART 5 output 

void part5() {
  print('--- Part 5 ---');

  final stock = buildStock();

  final titles = [
    'Dart in Action',
    'Flutter Basics',
    'Unknown Book'
  ];

  for (final title in titles) {
    try {
      checkOut(stock, title);

      print('Checked out: $title');
    } on BookNotAvailableException catch (e) {
      print('Sorry: "${e.title}" has no copies left');
    } on BookNotFoundException catch (e) {
      print('Not found: "${e.title}"');
    } finally {
      print('Transaction logged.');
    }
  }

  print('Copies left of Dart in Action: ${stock['Dart in Action']}');

  try {
    findBook('Missing');
  } on StateError {
    print('Search failed: no such book');
  }
}


//  PART 6 output 

Future<void> part6() async {
  print('--- Part 6 ---');

  print('Fetching...');

  final book = await fetchBookOfTheDay();

  print('Book of the day: $book');

  try {
    final result = await fetchBroken();

    print(result);
  } catch (e) {
    print('Fetch failed: $e');
  }
}


// REFLECTION QUESTIONS 

/* 1. When would you choose fold over reduce?
 I would choose fold when I need a starting value or when the collection
 might be empty, because fold also deal with empty.

 2. What does it mean that a closure "captures" a variable?
 A closure captures a variable when it remembers and can use a variable
 from its surrounding scope. In makeCounter, the closure captures count.

 3. Why must on BookNotAvailableException come before a general catch (e)?
 The specific exception should be handled before a general catch so that
 BookNotAvailableException is handled correctly instead of being caught
 by the general catch.

 4. Why does forgetting await still compile, but give the wrong result?
 Without await, the function returns a Future instead of the actual String
 result, so the program can print the Future object instead of the book name.*/
