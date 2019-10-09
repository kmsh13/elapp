defmodule Elpy do
  @moduledoc """
  Documentation for ElixirPythonQrcode.
  """
  alias Elpy.Helper

  defp default_instance() do
    #Load all modules in our priv/python directory
    path = [:code.priv_dir(:elapp), "python"] |> Path.join()
    Helper.python_instance(to_charlist(path))
  end

  # wrapper function to call python functions using
  # default python instance
  defp call_python(module, function, args \\ []) do
    default_instance()
    |> Helper.call_python(module, function, args)
  end

  def encode(name) do
    call_python(:echo, :greetings, [name])
  end

  def decode(name) do
    call_python(:echo, :greetings, [name])
  end

  def greetings(name) do
    call_python(:echo, :greetings, [name])
  end
  def p(name,test) do
    call_python(:echo, :greetings, [name,test])
  end
   def k(name,test) do
    call_python(:echo, :greetings, [name,test])
  end

end
