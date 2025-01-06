defmodule TibberEx.Api do
  @moduledoc """
  API wrapper according to the tibber API spec:
  https://developer.tibber.com/docs/reference
  """
  require Logger
  use Tesla, docs: false

  @endpoint "/v1-beta/gql"

  def price_info(client) do
    case query(
           client,
           "{viewer {homes {currentSubscription {priceInfo {today {total energy tax startsAt } tomorrow {total energy tax startsAt} }}}}}"
         ) do
      {:ok, %{status: 200, body: body}} ->
        body[:data][:viewer][:homes]
        |> List.first()
        |> get_in([:currentSubscription, :priceInfo])
        |> Enum.flat_map(fn {_k, v} -> v end)
        |> Enum.into(%{}, fn d ->
          {to_datetime(d[:startsAt]), Map.take(d, [:total, :energy, :tax])}
        end)

      {:ok, %{status: status, body: body}} ->
        Logger.warning(
          "Expected status code 200. status code was: #{inspect(status)} - #{inspect(body)}"
        )

      {:error, error} ->
        Logger.error("Error while retrieving price info: #{inspect(error)}")
        {}
    end
  end

  def price_rating(client) do
    case query(
           client,
           "{viewer { homes { currentSubscription { priceRating { hourly {maxTotal minTotal currency entries {time level total difference}} }}}}}"
         ) do
      {:ok, %{status: 200, body: body}} ->
        body[:data][:viewer][:homes]
        |> List.first()
        |> get_in([:currentSubscription, :priceRating, :hourly])
        |> Map.get_and_update!(:entries, fn e ->
          {e,
           Enum.into(e, %{}, fn d ->
             {to_datetime(d[:time]), Map.take(d, [:total, :level, :difference])}
           end)}
        end)
        |> elem(1)

      {:ok, %{status: status}} ->
        Logger.warning("Expected status code 200. status code was: #{inspect(status)}")

      {:error, error} ->
        Logger.error("Error while retrieving price rating: #{inspect(error)}")
        {}
    end
  end

  defp query(client, query_string) do
    post(client, @endpoint, ~s<{"query": "#{query_string}"}>)
  end

  defp to_datetime(string) do
    case DateTime.from_iso8601(string) do
      {:ok, key, _rest} -> key
      {:error, _error} -> string
    end
  end
end
