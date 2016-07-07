# RestHelloWorld

Cowboy REST handler example ported to Elixir:

https://github.com/ninenines/cowboy/tree/1.0.x/examples/rest_hello_world


# Instructions

    mix deps.get
    mix compile
    iex -S mix


    curl -X GET http://localhost:8080 -H "Accept: application/json"
