<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Using HTMX with Eiffel</title>
  <script src="https://unpkg.com/htmx.org@1.9.11" integrity="sha384-0gxUXCCR8yv9FM2b+U3FDbsKthCI66oH5IA9fHppQq9DDMHuMauqq1ZHBpJxQ0J0" crossorigin="anonymous"></script>



</head>

<body>
    
    {include file="form.tpl" /}

    <hr />

    {include file="display.tpl" /}


  <script>
    document.addEventListener("DOMContentLoaded", (event) => {
      document.body.addEventListener('htmx:beforeSwap', function(evt) {
        if (evt.detail.xhr.status === 422) {
          // allow 422 responses to swap as we are using this a singal
          // a for was submitted with bad data and want to rerender
          // errors
          evt.detail.shouldSwap = true;
          evt.detail.isError = false; 
        }
      });
    })
  </script>  
</body>
</html>