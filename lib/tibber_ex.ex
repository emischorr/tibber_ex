defmodule TibberEx do
  @moduledoc """
  Documentation for `TibberEx`.
  """

  def priceInfo(token) do
    token
    |> TibberEx.Client.new()
    |> TibberEx.Api.price_info()
  end

  def priceRating(token) do
    token
    |> TibberEx.Client.new()
    |> TibberEx.Api.price_rating()
  end
end
