longestPalindrome = (str) ->
  longest = ""
  noPalindromes = "no palindromes"

  findMatches = (str, cutoff = str.length) ->
    lastIndex = str.lastIndexOf str[0], cutoff

    if lastIndex > 0
      substr = str.slice 0, lastIndex + 1
      if substr.length <= longest.length
        return
      else
        if isPalindrome substr
          longest = substr
          return

      findMatches str, lastIndex - 1

  return str if str.length == 1

  for ltr, i in str
    seg = str.slice i
    findMatches seg if seg.length > longest.length

  longest || noPalindromes

isPalindrome = (str) ->
  str == str.split("").reverse().join("")


$ () ->

  $message = $("#message")
  $button  = $("#submit")
  $answer  = $("#answer")
  $input   = $("#user-input")

  showTheStuff = () ->
    noSpaces = $input.val().replace /\s/g, ""
    $answer.html longestPalindrome noSpaces
    $message.show()

  $input.on "keydown", (e) ->
    if e.which == 13
      $input.blur()
      showTheStuff()

  $input.on "focus", () ->
    $(@).val ""
    $message.fadeOut 200

  $button.on "click", showTheStuff
