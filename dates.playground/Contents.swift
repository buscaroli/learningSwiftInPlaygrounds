import UIKit

print("""
Messing around with Dates, thanks to:
1. https://www.globalnerdy.com/2020/05/26/how-to-work-with-dates-and-times-in-swift-5-part-1-creating-and-deconstructing-dates-with-the-date-calendar-and-datecomponents-structs/

2. https://www.donnywals.com/formatting-dates-in-the-users-locale-using-dateformatter-in-swift/
\n
""")


print("~~~ Let's create a Date object with the current time. ~~~\n")
let now = Date()
print("now is: \(now).")
print("How long since 01/01/2001?\nIt has been \(now.timeIntervalSinceReferenceDate) seconds.")

print("Let's use Date's description property:")
print(now.description)

print("""
Let's change Locale:
1. en-GB    -> \(now.description(with: Locale(identifier: "en-GB")))
2. en-US    -> \(now.description(with: Locale(identifier: "en-US")))
3. it       -> \(now.description(with: Locale(identifier: "it")))
4. es       -> \(now.description(with: Locale(identifier: "es")))
5. zh-Hans  -> \(now.description(with: Locale(identifier: "zh-Hans")))
""")


let nextWeek = Date(timeIntervalSinceNow: 7*24*60*60)
let oneYear = TimeInterval(365*24*60*60)
print("\n~~~ Let's create a date object with a date different from now. ~~~\n")

print("""
1. Date before or after now:
    tomorrow: \(Date(timeIntervalSinceNow: 24*60*60))
    yesterday: \(Date(timeIntervalSinceNow: -24*60*60))
2. Date before or after a reference date:
    one day after nextWeek: \(Date(timeInterval: 24*60*60, since: nextWeek))
3. Date before or after UNIX Epoch time (01/01/1970 00:00:00 UTC):
    8th of Jan 1978: \(Date(timeIntervalSince1970: 7*24*60*60))
4. Date before or after Reference Date (01/01/2001 00:00:00 UTC):
    2nd of Jan 2001: \(Date(timeIntervalSinceReferenceDate: 24*60*60))
    1st of Jan 2002: \(Date(timeIntervalSinceReferenceDate: oneYear))
""")

print("\n~~~ Let's use SWIFT 5's Calendar and DateComponent structures ~~~\n")

print("Using the user's current Calendar, let's check it out:")
let userCalendar = Calendar.current
print(userCalendar)


let firstLunchOfMillenniumComponents = DateComponents(
    calendar: nil,
    year: 2000,
    month: 1,
    day: 1,
    hour: 13,
    minute: 00,
    second: 00,
    nanosecond: nil,
    weekday: nil,
    weekdayOrdinal: nil,
    quarter: nil,
    weekOfMonth: nil,
    weekOfYear: nil,
    yearForWeekOfYear: nil
)
let firstLunchOfMillennium = userCalendar.date(from: firstLunchOfMillenniumComponents)

let nonnasBirthdayComponents = DateComponents(
    calendar: nil,
    year: 1933,
    month: 2,
    day: 21,
    hour: 14,
    minute: 30
)
let nonnasBirthday = userCalendar.date(from: nonnasBirthdayComponents)
let formatter = DateFormatter()
formatter.dateFormat = "dd MMMM YYYY"
formatter.locale = Locale(identifier: "it")

let firstSatOfJuly2035Components = DateComponents(
    year: 2035,
    month: 7,
    weekday: 7,
    weekdayOrdinal: 1
)
let firstSatOfJuly2035 = userCalendar.date(from: firstSatOfJuly2035Components)


print("""

1. first lunchtime of the 3rd Millennium
    1st of Jan 2000, 1pm: \(firstLunchOfMillennium!.description(with: Locale(identifier: "en-GB")))
2. someone's Birthday
    23rd of February 1965, 14:30: \(nonnasBirthday!.description(with: Locale(identifier: "it")))
3. same Birthday, shorter format using DateFormatter:
    \(formatter.string(from: nonnasBirthday!))
4. first Saturday of July 2035, with DateFormatter:
    \(formatter.string(from: firstSatOfJuly2035!))
5. same but using a different syntax:
    \(firstSatOfJuly2035!.description(with: Locale(identifier: "en-GB")))

""")
