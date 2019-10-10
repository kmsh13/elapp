defmodule ElcastTest do
  use ExUnit.Case
  doctest Elcast

  test "greets the world" do
    assert Elcast.hello() == :world
  end
end
