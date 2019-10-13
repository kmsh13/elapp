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
    |> parse_resp

  end

  def parse_resp({code, body}) do
    IO.puts(code)
    temp = body

    a = temp |> Poison.decode! |> Map.fetch!("current_user_url")
    IO.puts(a)

    {:ok, a}
  end

  def parse_resp({:error, reason}) do
    IO.puts(reason)
    {:ok, reason}
  end
end
