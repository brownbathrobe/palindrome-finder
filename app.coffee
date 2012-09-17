longestPalindrome = (str) ->
  longest = ""
  noPalindromes = "no palindromes"

  findMatches = (str, cutoff = str.length) ->
    lastIndex = str.lastIndexOf str[0], cutoff

    if lastIndex > 0
      substr = str.slice 0, lastIndex + 1
      if substr.length > longest.length
        return substr if isPalindrome substr

      findMatches str, lastIndex - 1
      return

  return str if str.length == 1

  for ltr, i in str
    seg = str.slice i
    if seg.length > longest.length
      longest = findMatches(seg) || longest
    else
      break

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
    return

  $input.on "keydown", (e) ->
    if e.which == 13
      $input.blur()
      showTheStuff()
      return

  $input.on "focus", () ->
    $(@).val ""
    $message.fadeOut 200
    return

  $button.on "click", showTheStuff
  return
