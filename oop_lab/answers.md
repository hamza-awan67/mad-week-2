Q1. What can a subclass using extends use for free that a class using implements has to write itself?
A subclass using extends gets the parent class fields and method for free. A class using implements gets only the names, so it must write everything itself.

Q2. Book and Dvd both use Renewable. When would you pick a mixin, and when an abstract parent class?
I pick a mixin to share readymade code with some unrelated classes like Book and Dvd but not Magazine. I pick an abstract parent when the classes are the same kind of thing and need a common base.

Q3. Why must you override hashCode whenever you override ==?
Sets and maps check hashCode first then ==. If equal objects have different hash codes a set may keep both as different items.

Q4. An extension method on String and a subclass of String both add behaviour. Why does Dart let you write the first one but not the second?
An extension only adds a method to the existing type and creates no new type. String is a final class, so Dart does not allow anyone to extend it.