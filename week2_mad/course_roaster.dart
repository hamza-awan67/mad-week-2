/// welcome message
void printWelcome(String appName) {
  print(' $appName ');
}

String generateCode(String title) {
  return title.substring(0, 2).toUpperCase() + '101';
}


void main() {
  printWelcome('Course Roster Manager');

  /// student data
  const int maxCapacity = 4;
final DateTime createdAt = DateTime.now();

String courseTitle = 'MAD: Mobile App Development';
int capacity = maxCapacity;
double creditHours = 3.0;
bool isOpen = true;

List<String> enrolledStudents = [
  'Aiden',
  'Maria',
  'Jamal'
];

Set<String> waitlist = {
  'Priya',
  'Noah'
};

Map<String, int> attendanceCount = {
  'Aiden': 3,
  'Maria': 4,
  'Jamal': 2
};
  
  print(
  '$courseTitle | Capacity: $capacity | Enrolled: ${enrolledStudents.length}'
);
  
  
  
  String? instructorEmail;

print(instructorEmail ?? 'TBA');

late String enrollmentCode;

enrollmentCode = generateCode(courseTitle);

print('Enrollment code: $enrollmentCode');
  
  /// here it give error because this sign ! means that value is not null  we are sure but if it is null then program crash same like this
 /// print(instructorEmail!.length);
  
  
  /// format the names in sttring
  
  String rawNames = ' Aiden , maria ,JAMAL , Priya ';

List<String> cleanNames = [];

for (var name in rawNames.split(',')) {
  cleanNames.add(name.trim());
}

print(cleanNames);
  
  /// capacity=4 and enrolled=3 so 4-3=1
  print('Seats left: ${capacity - enrolledStudents.length}');
  
  /// here we have fullgroup of length 3 and in leftover we see that how many groups that are not of length 3
  
  int fullGroups = enrolledStudents.length ~/ 3;
int leftover = enrolledStudents.length % 3;

print('Full groups of 3: $fullGroups, leftover: $leftover');
  
  /// if forminput is string then print is if it is not string then print is!
  
  Object formInput = 'twenty-two';

if (formInput is String) {
  print('This is a String');
}

if (formInput is! int) {
  print('This is not an int');
}
  
  /// allow to perform multiple operation on same object 
  
  StringBuffer report = StringBuffer()
  ..write('Report: $courseTitle')
  ..write(' | Cap: $capacity')
  ..write(' | Roster: ${enrolledStudents.length}');
  
  print(report.toString());
  
  /// null aware cascade  normal cascade object.. and null aware cascade object?..
  
  
  List<String>? extraNotes;

extraNotes?..add('Room change pending');

print('Extra notes: $extraNotes');
  
  // asign only if it is null ??=
  
  int? bonusSeats;

bonusSeats ??= 0;

print('Bonus seats: $bonusSeats');
  
  // part 6
  
  if (isOpen && enrolledStudents.length < capacity) {
  print("You're in! Welcome aboard.");
} else {
  print('Sorry, the course is full or closed.');
}
  
  int enrollmentStatusCode = 200;

switch (enrollmentStatusCode) {
  case 200:
    print('Enrolled');
    break;

  case 404:
    print('Course not found');
    break;

  default:
    print('Unknown error');
    break;
}
  
  // ternary operator
  
  String statusTag = isOpen ? 'OPEN' : 'FULL';

print(statusTag);

// for in loop

for (var student in enrolledStudents) {
  print(student);
}

// for each loop

attendanceCount.forEach((key, value) {
  print('$key: $value');
});

// if and for used both

List<String> announcements = [
  'Welcome to $courseTitle',
  if (!isOpen) 'Course is FULL — waitlist open',
  for (var student in waitlist)
    'Reminder: $student, please confirm attendance',
];

for (var announcement in announcements) {
  print(announcement);
}
  
  
  
}
