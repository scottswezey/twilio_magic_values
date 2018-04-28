defmodule TwilioMagicValuesTest do
  use ExUnit.Case
  doctest TwilioMagicValues

  test "greets the world" do
    assert TwilioMagicValues.hello() == :world
  end
end
