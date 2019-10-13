defmodule ElreqTest do
  use ExUnit.Case
  doctest Elreq

  test "greets the world" do
    assert Elreq.hello() == :world
  end
end
