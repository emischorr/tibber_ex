defmodule TibberEx do
  @moduledoc """
  Documentation for `TibberEx`.
  """

  def priceInfo(token) do
    token
    |> TibberEx.Client.new()
    |> TibberEx.Api.price_info()
  end
end
