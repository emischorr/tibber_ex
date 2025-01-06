defmodule TibberEx.Client do
  def new(token) do
    Tesla.client(
      [
        {Tesla.Middleware.BaseUrl, "https://api.tibber.com"},
        {Tesla.Middleware.DecodeJson, engine_opts: [keys: :atoms]},
        {Tesla.Middleware.Headers,
         [{"Authorization", token}, {"content-type", "application/json"}]},
        {Tesla.Middleware.Timeout, timeout: 5_000}
      ],
      Tesla.Adapter.Mint
    )
  end
end
