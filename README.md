# String Toolkit

A JavaScript implementation of some of my favorite ActiveSupport String methods.

### Usage

Include `lib/string-toolkit.js` in the appropriate place for your web framework and you're good to go. All methods are automatically added to `String.prototype`

### Methods

- at(index) - returns character at specified index

```javascript
"foo".at(0) // returns "f"
```

- isBlank() - returns boolean describing whether the string is entirely - comprised of spaces, tabs, and/or carriage returns

```javascript
" \t\n".isBlank() // returns true
" \tA\n ".isBlank() // returns false
```

- camelcase(firstLetter = "upper") - alias for camelize(firstLetter = "upper")
- camelize(firstLetter = "upper") - returns camelcased string with case of first letter specified by argument ("upper" for upper, "lower" for lower). underscores or first capital letter (of a consecutive sequence of letters) are treated as delimiters.

```javascript
"foo_bar_baz".camelize() // returns "FooBarBaz"
"foo_bar_baz".camelize("lower") // returns "fooBarBaz"
"FOO_BAR_BAZ".camelize() // returns "FooBarBaz"
"FooBarBaz".camelize("lower") // returns "fooBarBaz"
```

- constantize - returns the JavaScript object corresponding with the string. Will return undefined or throw TypeError if it does not exist

```javascript
"foo".constantize() // returns window.foo if it exists
"foo.bar".constantize() // returns window.foo.bar if it exists
```

- dasherize - returns string with underscores replaced with dashes

```javascript
"foo_bar_baz".dasherize() // returns "foo-bar-baz"
```

- ellipses(maxLength) - returns truncated string with "..." appended of length maxLength. If maxLength is greater than length of string, then the string is unchanged

```javascript
"alphabet soup".ellipses(19) // returns "alphabet soup"
"alphabet soup".ellipses(5) // returns "al..."
```

- exclude(string) - returns boolean, describing whether search string (case-sensitive) does not appear

```javascript
"if I were a rich man".exclude("man") // returns false
"if I were a rich man".exclude("MAN") // returns true
"if I were a rich man".exclude("fiddler") // returns true
```

- first(numChars) - returns a substring starting at zero of length specified by numChars. If numChars is longer than string, entire string is returned

```javascript
"alphabet soup".first(3) // returns "alp"
"super nintendo".first(20) // returns "super nintendo"
```

- from(position) - returns a substring starting at index position provided to end of string. If position provided is negative, entire string is returned. If position provided is greater than string length, an empty string is returned

```javascript
"alphabet soup".from(3) // returns "habet soup"
"super nintendo".from(20) // returns ""
```

- humanize() - returns string with underscores replaced with spaces and everything lowercase but first letter of first word.

```javascript
"alphabet_soup".humanize() // returns "Alphabet soup"
"what_a_long_phrase".humanize() // returns "What a long phrase"
```

- include(string) - returns boolean, describing whether or not search string (case-sensitive) appears

```javascript
"if I were a rich man".include("man") // returns true
"if I were a rich man".include("MAN") // returns false
"if I were a rich man".include("fiddler") // returns false
```

- last(numChars = 1) - returns substring ending with last character of string of length numChars.

```javascript
"alphabet soup".last() // returns "p"
"alphabet soup".last(4) // returns "soup"
"alphabet soup".last(44) // returns "alphabet soup"
```

- parameterize(separator = '-') - returns concatenation of alphanumeric portions of string, combined with the separator provided

```javascript
"alphabet soup".parameterize() // returns "alphabet-soup"
"odd! symbols#*".parameterize("&") // returns "odd&symbols"
"99 red balloons".parameterize("_") // returns "99_red_balloons"
```

- reverse() - returns string in reverse

```javascript
"alphabet soup".reverse() // returns "puos tebahpla"
```

- to(position) - returns a substring from 0th index to position

```javascript
"alphabet soup".to(3) // returns "alph"
"alphabet soup".to(100) // returns "alphabet soup"
```

### Building

Continuous building from the coffee files requires the following rubygems:

- rake
- guard
- guard-rake

To continuously build `lib/string-toolkit.js` and `spec/string-toolkit-spec.js` from their coffee files, run guard

		$ guard

### Testing

Open `SpecRunner.html` in your favorite browser.