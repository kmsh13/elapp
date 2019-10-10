defmodule ElappTest do
  use ExUnit.Case
  doctest Elapp

  test "greets the world" do
    assert Elapp.hello() == :world
  end
end
