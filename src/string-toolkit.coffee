###

at
blank?
camelcase
camelize
classify
constantize
dasherize
deconstantize
demodulize
include
exclude
first
foreign_key
from
humanize
last
parameterize
pluralize
singularize
squish
tableize
titleize
to
to_date
to_datetime
to_time
truncate
underscore

###

stringExtension =
  at: (i) ->
    @charAt(i)

  isBlank: ->
    @match(/[^\t\n\ ]/) == null

  camelize: (firstLetter = "upper") ->
    product = @replace(/([A-Z]{1}[a-z])/g, "_$1")
    product = product.substring(1, product.length) if product.at(0) == "_"
    sections = product.split(/_/)
    product = ""
    for s, i in sections
      product += (if i == 0 and firstLetter == "lower" then s.charAt(0).toLowerCase() else s.charAt(0).toUpperCase()) + s.slice(1).toLowerCase()
    product

  classify: ->
    @camelize(@singuralize())

  constantize: ->
    names = @split '.'
    klass = window
    klass = klass[name] for name in names
    klass

  ellipses: (maxLength) ->
    if @length > maxLength
      @to(maxLength-4) + "..."
    else
      @

  dasherize: ->
    @replace(/_/g, "-")

  deconstantize: ->

  define: (value) ->
    namespace = @split "."
    current = window
    for object, i in namespace
      current[object] ||= (if i == namespace.length - 1 then value else {})
      current = current[object]
    value

  include: (string) ->
    @indexOf(string) > -1

  exclude: (string) ->
    @indexOf(string) == -1

  first: (num = 1) ->
    @substr(0, num)

  from: (position) ->
    @substring(position, @length)

  humanize: ->
    s = @replace(/_/g, " ").toLowerCase()
    s.charAt(0).toUpperCase() + s.slice(1)

  last: (num = 1) ->
    @substring(@length-num, @length)

  parameterize: (separator = '-') ->
    @replace(/[^a-zA-Z0-9\ ]/g, "").replace(/\ /g, separator)

  reverse: ->
    @split("").reverse().join("")

  to: (position) ->
    @substr(0, position+1)

stringExtension.camelcase = stringExtension.camelize

for key, value of stringExtension
  String.prototype[key] = value