# HTMX using Eiffel 

https://htmx.org/

## Full Introduction to HTMX using Golang

https://www.youtube.com/watch?v=x7v6SNIgJpE



https://github.com/ThePrimeagen/fem-htmx-proj

## Task
- Display a count that represents how many times the page has been requested.

- Add an endpoint POST /count to that increments the count value and returns the index.html page.
- Remove the incrementing in the Get / route
- add a button to the HTML 

- index.html now require an object with `contacts`
- we need a new endpoint `/contacts` that takes `POST` request

- Deleting and Events

- Icon
   <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
            <path fill="none" d="M0 0h24v24H0z"/>
            <path d="M4 2h16a1 1 0 011 1v1a1 1 0 01-1 1H4a1 1 0 01-1-1V3a1 1 0 011-1zM3 6h18v16a1 1 0 01-1 1H4a1 1 0 01-1-1V6zm3 3v9a1 1 0 002 0v-9a1 1 0 00-2 0zm5 0v9a1 1 0 002 0v-9a1 1 0 00-2 0zm5 0v9a1 1 0 002 0v-9a1 1 0 00-2 0z"/>
    </svg>

- Delete: in htmx we can use actual verbs of HTTP to delete (no need to use POST with URI describing actions to delete or update a reousrce.) Just use

GET /contents/:id
POST /contents
DELETE /contents/:id
PUT|PATCH /contents/:id
    
- Update the current code to add a delete icon next to and address to delete it.
- First include the icon next to the address.
- next make it DELETE /contacts/:id
- add an update 

