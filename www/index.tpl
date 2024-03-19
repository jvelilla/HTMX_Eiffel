<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Using HTMX with Eiffel</title>
  <script src="https://unpkg.com/htmx.org@1.9.11" integrity="sha384-0gxUXCCR8yv9FM2b+U3FDbsKthCI66oH5IA9fHppQq9DDMHuMauqq1ZHBpJxQ0J0" crossorigin="anonymous"></script>
</head>

<body>
    <div id="count">
      {include file="counter.tpl" /}
    </div>
    <button hx-post="/count" hx-target="#count">Count</button>
</body>
</html>