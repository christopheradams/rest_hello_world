defmodule RestHelloWorld do
  use Application

  # See http://elixir-lang.org/docs/stable/elixir/Application.html
  # for more information on OTP Applications
  def start(_type, _args) do
    import Supervisor.Spec, warn: false

    dispatch = :cowboy_router.compile([
      {:_,
       [
         {"/", ToppageHandler, []}
       ]}
    ])

    {:ok, _} = :cowboy.start_http(
      :http,
      100,
      [{:port, 8080}],
      [{:env, [{:dispatch, dispatch}]}]
    )

    # Define workers and child supervisors to be supervised
    children = [
      # Starts a worker by calling: RestHelloWorld.Worker.start_link(arg1, arg2, arg3)
      # worker(RestHelloWorld.Worker, [arg1, arg2, arg3]),
    ]

    # See http://elixir-lang.org/docs/stable/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: RestHelloWorld.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
