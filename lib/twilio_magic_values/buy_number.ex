defmodule TwilioMagicValues.BuyNumber do
  @moduledoc """
  For tests buying a phone number with Twilio.

  See: [https://www.twilio.com/docs/iam/test-credentials#test-incoming-phone-numbers](https://www.twilio.com/docs/iam/test-credentials#test-incoming-phone-numbers)
  """
  @doc """
  Returns the magic phone number which is **UNAVAILABLE** for purchase.

  Expect the 21421 API error from Twilio.
  """
  def unavailable, do: "+15005550000"

  @doc """
  Returns the magic phone number which is **INVALID** for purchase.

  Expect the 21421 API error from Twilio.
  """
  def invalid, do: "+15005550000"

  @doc """
  Returns the magic phone number which is **VALID** for purchase.

  Expect no error.
  """
  def valid, do: "+15005550006"

  @doc """
  Returns the magic area code which has **NO** numbers available for purchase.

  Expect the 21452 API error from Twilio.
  """
  def empty_area_code, do: "533"

  @doc """
  Returns the magic area code which has numbers available for purchase.

  Expect no error.
  """
  def available_area_code, do: "500"
end
