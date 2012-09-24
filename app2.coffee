findLongestPalindrome = (str) ->
  longestPalindrome = ""

  return str if str.length == 1

  for ltr, i in str
    seg = str.slice i
    candidate = findPalindromeCandidate seg
    test = (candidate) ->
      if candidate
        if assessCandidate candidate, longestPalindrome
          longestPalindrome = candidate
        else
          test(findPalindromeCandidate(candidate, candidate.length-1))

    test(candidate)

  longestPalindrome

findPalindromeCandidate = (str, cutoff = str.length) ->
  lastIndexOfLetter = str.lastIndexOf str[0], cutoff-1
  if lastIndexOfLetter > 0
    substr = str.slice 0, lastIndexOfLetter + 1

assessCandidate = (candidate, longestPalindrome) ->
  if candidate.length > longestPalindrome.length
    if isPalindrome candidate
      candidate

isPalindrome = (str) ->
  str == str.split("").reverse().join("")

jQuery ->

  $message = $("#message")
  $button  = $("#submit")
  $answer  = $("#answer")
  $input   = $("#user-input")

  showTheStuff = ->
    noSpaces = $input.val().replace /\s/g, ""
    $answer.html findLongestPalindrome(noSpaces) || "there are no palindromes"
    $message.show()
    return

  $input.on "keydown", (e) ->
    if e.which == 13
      $input.blur()
      showTheStuff()
      return

  $input.on "focus", ->
    $(@).val ""
    $message.fadeOut 200
    return

  $button.on "click", showTheStuff
  return
