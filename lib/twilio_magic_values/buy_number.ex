defmodule TwilioMagicValues.BuyNumber do
  @moduledoc """
  Wrapper for Twilio magic phone numbers used in tests buying phone numbers.

  See: [https://www.twilio.com/docs/iam/test-credentials#test-incoming-phone-numbers](https://www.twilio.com/docs/iam/test-credentials#test-incoming-phone-numbers)
  """
  @doc """
  Returns the magic phone number which is **UNAVAILABLE** for purchase.

  Expect the 21421 API error from Twilio.
  """
  def unavailable_phone_number, do: "+15005550000"

  @doc """
  Returns the magic phone number which is **INVALID** for purchase.

  Expect the 21421 API error from Twilio.
  """
  def invalid_phone_number, do: "+15005550001"

  @doc """
  Returns the magic phone number which is **VALID** for purchase.

  Expect no error.
  """
  def valid_phone_number, do: "+15005550006"

  @doc """
  Returns the magic area code which has **NO** numbers available for purchase.

  Expect the 21452 API error from Twilio.
  """
  def empty_area_code, do: "533"

  @doc """
  Returns the magic area code which has numbers available for purchase.

  Expect no error, and the purchased phone number to be: +15005550006
  """
  def available_area_code, do: "500"
end
