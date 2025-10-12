defmodule TibberEx do
  @moduledoc """
  Documentation for `TibberEx`.
  """

  def price_info(token) do
    token
    |> TibberEx.Client.new()
    |> TibberEx.Api.price_info()
  end
end
