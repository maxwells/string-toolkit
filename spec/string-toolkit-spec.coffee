describe "String Toolkit", ->

  describe "at", ->

    it "returns the character specified by index passed if that index exists", ->
      expect("bar".at(0)).toEqual("b")
      expect("bar".at(1)).toEqual("a")
      expect("bar".at(2)).toEqual("r")

    it "returns empty string when character specified by index passed is out of bounds", ->
      expect("bar".at(4)).toEqual('')

  describe "isBlank", ->

    it "recognizes an empty string as blank", ->
      expect("".isBlank()).toBeTruthy()

    it "recognizes spaces as blank", ->
      expect(" ".isBlank()).toBeTruthy()
      expect("  ".isBlank()).toBeTruthy()

    it "recognizes tabs as blank", ->
      expect("\t".isBlank()).toBeTruthy()
      expect("\t\t".isBlank()).toBeTruthy()

    it "recognizs new lines as blank", ->
      expect("\n".isBlank()).toBeTruthy()
      expect("\n\n".isBlank()).toBeTruthy()

    it "recognizes combination of spaces, tabs, and new lines as blank", ->
      expect("\n\t  \t\n".isBlank()).toBeTruthy()

    it "recognizes any non space, tab, or new line as not blank", ->
      expect("\t a \n".isBlank()).toBeFalsy()
      expect(" 0 ".isBlank()).toBeFalsy()
      expect("\n!".isBlank()).toBeFalsy()

  describe "camelcase", ->

    it "references camelize", ->
      expect(String.prototype.camelcase).toEqual(String.prototype.camelize)

  describe "camelize", ->

    describe "when passed zero arguments", ->

      it "capitalizes first letter then removes underscores and capitalizes the letters that immediately follow", ->
        expect("foo_bar_baz".camelize()).toEqual("FooBarBaz")

      it "sets any letter that isnt the first or immediately following an underscore to lower case", ->
        expect("FOO_BAR_BAZ".camelize()).toEqual("FooBarBaz")

      it "does nothing if passed a camelized string", ->
        expect("FooBarBaz".camelize()).toEqual("FooBarBaz")

      it "upperizes lowerized camelized string", ->
        expect("fooBarBaz".camelize()).toEqual("FooBarBaz")

    describe "when passed 'upper'", ->

      it "capitalizes first letter then removes underscores and capitalizes the letters that immediately follow", ->
        expect("foo_bar_baz".camelize("upper")).toEqual("FooBarBaz")

      it "sets any letter that isnt the first or immediately following an underscore to lower case", ->
        expect("FOO_BAR_BAZ".camelize("upper")).toEqual("FooBarBaz")

      it "does nothing if passed a camelized string", ->
        expect("FooBarBaz".camelize("upper")).toEqual("FooBarBaz")

      it "upperizes lowerized camelized string", ->
        expect("fooBarBaz".camelize("upper")).toEqual("FooBarBaz")

    describe "when passed 'lower'", ->

      it "lowerizes first letter then removes underscores and capitalizes the letters that immediately follow", ->
        expect("foo_bar_baz".camelize("lower")).toEqual("fooBarBaz")

      it "sets any letter that isnt immediately following an underscore to lower case", ->
        expect("FOO_BAR_BAZ".camelize("lower")).toEqual("fooBarBaz")

      it "does nothing if passed a lowerized camelized string", ->
        expect("fooBarBaz".camelize("lower")).toEqual("fooBarBaz")

      it "lowerizes first letter if passed upperized camelized string", ->
        expect("FooBarBaz".camelize("lower")).toEqual("fooBarBaz")

  describe "constantize", ->

    it "takes a single word and finds that object within window", ->
      window.foo =
        hello: 'world'
      expect("foo".constantize()).toEqual(window.foo)

    it "takes dot delimited names and finds corresponding object within window", ->
      window.foo =
        hello:
          world: "hello world"
      expect('foo.hello.world'.constantize()).toEqual(window.foo.hello.world)

  describe "dasherize", ->

    it "replaces any underscores with dashes", ->
      expect("foo_bar_baz".dasherize()).toEqual("foo-bar-baz")
      expect("__".dasherize()).toEqual("--")
      expect("_hello_world_".dasherize()).toEqual("-hello-world-")

    it "returns string unchanged if there are no underscores", ->
      expect("foo".dasherize()).toEqual("foo")
      expect("some longer phrase (with parentheses)".dasherize()).toEqual("some longer phrase (with parentheses)")

  describe "ellipses", ->

    it "returns unchanged string if maxLength is greater than string length", ->
      expect("example".ellipses(15)).toEqual("example")

    it "returns string of length maxLength, ellipses included", ->
      expect("example".ellipses(4)).toEqual("e...")
      expect("a longer example".ellipses(10)).toEqual("a longe...")

  describe "exclude", ->

    it "returns false if the string argument is contained in the string object", ->
      expect("foo".exclude("o")).toBeFalsy()
      expect("hello".exclude("lo")).toBeFalsy()

    it "returns true if the string argument is not contained in the string object", ->
      expect("foo".exclude("a")).toBeTruthy()
      expect("hello".exclude("ol")).toBeTruthy()

  describe "first", ->

    it "returns the first character if no argument is passed", ->
      expect("foo".first()).toEqual("f")

    it "returns empty string if string is empty", ->
      expect("".first()).toEqual("")

    it "returns the number of characters passed as an argument (if less than length of string)", ->
      expect("hello".first(2)).toEqual("he")

    it "returns entire string if number of characters passed is greater than length of string", ->
      expect("hello".first(12)).toEqual("hello")

  describe "from", ->

    it "returns substring from position passed to end of string", ->
      expect("hello".from(0)).toEqual("hello")
      expect("hello".from(1)).toEqual("ello")
      expect("hello".from(3)).toEqual("lo")

    it "returns an empty string if position passed is greater than length of string", ->
      expect("hello".from(12)).toEqual("")

  describe "humanize", ->

    it "adds a humanize method to String", ->
      expect("".humanize?).toBeTruthy()

    it "removes underscores and capitalizes first letter", ->
      expect("foo_bar_baz".humanize()).toEqual("Foo bar baz")

    it "sets first letter to capital and the rest to lowercase", ->
      expect("Foo_Bar_Baz".humanize()).toEqual("Foo bar baz")

    it "does nothing when passed a humanized string", ->
      expect(("Foo bar baz").humanize()).toEqual("Foo bar baz")

  describe "include", ->

    it "returns true if the string argument is contained in the string object", ->
      expect("foo".include("o")).toBeTruthy()
      expect("hello".include("lo")).toBeTruthy()

    it "returns false if the string argument is not contained in the string object", ->
      expect("foo".include("a")).toBeFalsy()
      expect("hello".include("ol")).toBeFalsy()

  describe "last", ->

    it "returns last character when no argument is passed", ->
      expect("hello".last()).toEqual("o")

    it "returns substring of length passed, terminating at end of string when length passed is less than string length", ->
      expect("hello".last(3)).toEqual("llo")

    it "returns entire string when length passed is greater than length of string", ->
      expect("hello".last(12)).toEqual("hello")

  describe "parameterize", ->

    it "removes all non alphanumeric characters and replaces spaces with the separator passed", ->
      expect("Foo bar baz".parameterize('_')).toEqual("Foo_bar_baz")
      expect("hello! world@".parameterize('.')).toEqual("hello.world")

    it "defaults to a dash separator", ->
      expect("foo bar baz".parameterize()).toEqual("foo-bar-baz")

  describe "reverse", ->

    it "reverses the string", ->
      expect("foo".reverse()).toEqual("oof")
      expect("bar".reverse()).toEqual("rab")

  describe "to", ->

    it "returns substring from index 0 to position passed", ->
      expect("hello".to(0)).toEqual("h")
      expect("hello".to(2)).toEqual("hel")

    it "returns entire string when position passed is greater than length of string", ->
      expect("hello".to(12)).toEqual("hello")