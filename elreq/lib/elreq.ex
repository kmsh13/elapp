defmodule Elreq do
  @moduledoc """
  Documentation for Elreq.
  """

  @doc """
  Hello world.

  ## Examples

      iex> Elreq.hello
      :world

  """
  def hello do
    :world
  end
  def get(url, headers \\ []) do
    url
    |> HTTPoison.get(headers)
    |> case do
        {:ok, %{body: raw, status_code: code}} -> {code, raw}
        {:error, %{reason: reason}} -> {:error, reason}
       end
    |> (fn {ok, body} ->
          body
          |> Poison.decode(keys: :atoms)
          |> case do
               {:ok, parsed} -> {ok, parsed}
               _ -> {:error, body}
             end
        end).()
  end
end
