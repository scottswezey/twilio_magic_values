defmodule TwilioMagicValues.BuyNumber do
  @moduledoc """
  For tests buying a phone number with Twilio.

  See: [https://www.twilio.com/docs/iam/test-credentials#test-incoming-phone-numbers](https://www.twilio.com/docs/iam/test-credentials#test-incoming-phone-numbers)
  """

  def unavailable, do: "+15005550000" # Error: 21421
  def invalid,     do: "+15005550000" # Error: 21421
  def valid,       do: "+15005550006"

  def empty_area_code,     do: "533" # Error: 21452
  def available_area_code, do: "500"
end
