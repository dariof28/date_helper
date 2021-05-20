# date_helper

Provide a set of utils and helper methods to deal with dates. This is an extension for embedded `DateTime` library so you can use this methods in every `DateTime` instance

## Features

### Day Start
Returns the start (midnight) of the date

```dart
new DateTime().dayStart //2021-05-21 00:00
```

### Day End
Returns the end (11:59PM) of the date

```dart
new DateTime().dayEnd //2021-05-21 23:59
```

### AM
Determine if the date is AM

```dart
new DateTime().isAM //true if hour is beetween 12AM and 11:59AM
```

### PM
Determine if the date is PM

```dart
new DateTime().isPM //true if hour is beetween 12PM and 11:59PM
```

### Tomorrow
Returns the day after of the date

```dart
new DateTime().tomorrow //2021-05-21 => 2021-05-22
```

### Yesterday
Returns the day before the date

```dart
new DateTime().yesterday //2021-05-21 => 2021-05-20
```

### Following
Returns the following specified weekday

```dart
new DateTime().following(DateTime.monday) //Since 2021-05-21 is Friday => 2021-05-24
```

### Previous
Returns the previous specified weekday

```dart
new DateTime().previous(DateTime.monday) //Since 2021-05-21 is Friday => 2021-05-17
```
