$(document).ready(
  function () {
    $("#" + QueryTag).keypress(
      function (event) {
        var current = $("#" + QueryTag + ":text").val();
        var keypressed = String.fromCharCode(event.which);

        // if the key was a backspace, remove a character
        if (8 === event.keyCode) {
          current = current.substring(0, current.length - 1);
        } else {
          current += String.fromCharCode(event.which);
        }

        if (0 === current.length) {
          return;
        }

        $.getJSON(QueryURL + current, function (json) {
          $("#" + ResultsDiv).empty();
          for (var i = 0; i < json.length; i++) {
            $("#" + ResultsDiv).append(json[i][Field] + "<br/>");
          }
        })
    });
});
