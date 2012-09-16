function longestPalindrome(str) {
  var i = 0,
      len = str.length,
      longest = "",
      noPalindromes = "no palindromes",
      ltr, lastIndex, substr

  function findMatches(str, cutoff) {
    cutoff || (cutoff = str.length)
    var ltr = str[0],
        lastIndex = str.lastIndexOf(ltr, cutoff)


    if (lastIndex > 0) {
      substr = str.slice(0, lastIndex + 1) // <== +1 offset to include the letter
      if (substr.length <= longest.length) {
        return
      } else {
        if (isPalindrome(substr)) {
          longest = substr
          return
        }
      }
      findMatches(str, lastIndex - 1)
    }
  }

  if (str.length === 1) {
    return str
  }

  for (i; i < str.length; i++) {
    segment = str.slice(i)
    if (segment.length > longest.length) {
      findMatches(segment)
    }
  }

  return longest || noPalindromes
}

function isPalindrome(str) {
  var rev = str.split("").reverse().join("")
  return str === rev
}


$(function () {
  var $input = $("#user-input"),
      $button = $("#submit"),
      $message = $("#message"),
      $answer = $("#answer")

  $input.on("keydown", function (e) {
    if (e.which === 13) {
      $input.blur()
      showTheStuff()
    }
  })

  $input.on("focus", function () {
    $(this).val("")
    $message.fadeOut(200)
  })

  $button.on("click", showTheStuff)

  function showTheStuff() {
    var noSpaces = $input.val().replace(/\s/g, "")
    $answer.html(longestPalindrome(noSpaces))
    $message.show()
  }
})
