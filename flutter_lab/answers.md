

A1: 20
A2: 9
A3: 6
A4: 28

B1: Stateless classes: LabApp, HomePage, StudentCard and GoalBanner. They only show
the data they are given, and nothing inside them changes. Stateful classes: Tally,
BuggyCounter and Countdown. They keep data that changes while the app runs (the count,
the clicks and the seconds), so they need a State object to remember it.

B2: A Timer keeps running even after its widget is removed from the screen. If I do not
cancel it in dispose(), it will try to call setState on a widget that no longer exists.
That causes an error and wastes memory. dispose() is the place to clean up.

B3: These can be const: the MaterialApp in LabApp, HomePage(), Tally(), Countdown(),
BuggyCounter(), SizedBox, EdgeInsets and Text widgets with fixed text. const means
Flutter creates the object once and reuses it, so it does not need to rebuild it again.
This makes the app faster and saves work.