// Generated by CoffeeScript 1.3.3
(function() {
  var assessCandidate, findLongestPalindrome, findPalindromeCandidate, isPalindrome;

  findLongestPalindrome = function(str) {
    var candidate, i, longestPalindrome, ltr, seg, test, _i, _len;
    longestPalindrome = "";
    if (str.length === 1) {
      return str;
    }
    for (i = _i = 0, _len = str.length; _i < _len; i = ++_i) {
      ltr = str[i];
      seg = str.slice(i);
      candidate = findPalindromeCandidate(seg);
      test = function(candidate) {
        if (candidate) {
          if (assessCandidate(candidate, longestPalindrome)) {
            return longestPalindrome = candidate;
          } else {
            return test(findPalindromeCandidate(candidate, candidate.length - 1));
          }
        }
      };
      test(candidate);
    }
    return longestPalindrome;
  };

  findPalindromeCandidate = function(str, cutoff) {
    var lastIndexOfLetter, substr;
    if (cutoff == null) {
      cutoff = str.length;
    }
    lastIndexOfLetter = str.lastIndexOf(str[0], cutoff - 1);
    if (lastIndexOfLetter > 0) {
      return substr = str.slice(0, lastIndexOfLetter + 1);
    }
  };

  assessCandidate = function(candidate, longestPalindrome) {
    if (candidate.length > longestPalindrome.length) {
      if (isPalindrome(candidate)) {
        return candidate;
      }
    }
  };

  isPalindrome = function(str) {
    return str === str.split("").reverse().join("");
  };

  jQuery(function() {
    var $answer, $button, $input, $message, showTheStuff;
    $message = $("#message");
    $button = $("#submit");
    $answer = $("#answer");
    $input = $("#user-input");
    showTheStuff = function() {
      var noSpaces;
      noSpaces = $input.val().replace(/\s/g, "");
      $answer.html(findLongestPalindrome(noSpaces) || "there are no palindromes");
      $message.show();
    };
    $input.on("keydown", function(e) {
      if (e.which === 13) {
        $input.blur();
        showTheStuff();
      }
    });
    $input.on("focus", function() {
      $(this).val("");
      $message.fadeOut(200);
    });
    $button.on("click", showTheStuff);
  });

}).call(this);
