defmodule TwilioMagicValuesTest do
  use ExUnit.Case
  doctest TwilioMagicValues

  test "error info urls" do
    # This already has doctests
    assert TwilioMagicValues.error_info_url("example") ==
             "https://www.twilio.com/docs/errors/example"

    assert TwilioMagicValues.error_info_url("example2") ==
             "https://www.twilio.com/docs/errors/example2"
  end
end
