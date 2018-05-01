defmodule TwilioMagicValues.BuyNumber do
  @moduledoc """
  Wrapper for Twilio magic phone numbers used in tests buying phone numbers.

  See: [https://www.twilio.com/docs/iam/test-credentials#test-incoming-phone-numbers](https://www.twilio.com/docs/iam/test-credentials#test-incoming-phone-numbers)
  """
  @doc """
  Returns the magic phone number which is **UNAVAILABLE** for purchase.

  Expect the [21422](https://www.twilio.com/docs/errors/21422) API error from Twilio.

  ## Example

      iex> map = buy_number(exactly: TwilioMagicValues.BuyNumber.unavailable_phone_number())
      iex> Map.get(map, :code)
      21422
  """
  def unavailable_phone_number, do: "+15005550000"

  @doc """
  Returns the magic phone number which is **INVALID** for purchase.

  Expect the [21421](https://www.twilio.com/docs/errors/21421) API error from Twilio.

  ## Example

      iex> map = buy_number(exactly: TwilioMagicValues.BuyNumber.invalid_phone_number())
      iex> Map.get(map, :code)
      21421
  """
  def invalid_phone_number, do: "+15005550001"

  @doc """
  Returns the magic phone number which is **VALID** for purchase.

  Expect no error.

  ## Example

      iex> map = buy_number(exactly: TwilioMagicValues.BuyNumber.valid_phone_number())
      iex> Map.get(map, :code, "There was no error code")
      "There was no error code"
      iex> Map.get(map, :friendly_name)
      "(500) 555-0006"
  """
  def valid_phone_number, do: "+15005550006"

  @doc """
  Returns the magic area code which has **NO** numbers available for purchase.

  Expect the [21452](https://www.twilio.com/docs/errors/21452) API error from Twilio.

  ## Example

      iex> map = buy_number(area_code: TwilioMagicValues.BuyNumber.empty_area_code())
      iex> Map.get(map, :code)
      21452
  """
  def empty_area_code, do: "533"

  @doc """
  Returns the magic area code which has numbers available for purchase.

  Expect no error, and the purchased phone number to be: +15005550006

  ## Example

      iex> map = buy_number(area_code: TwilioMagicValues.BuyNumber.available_area_code())
      iex> Map.get(map, :code, "There was no error code")
      "There was no error code"
      iex> Map.get(map, :friendly_name)
      "(500) 555-0006"
  """
  def available_area_code, do: "500"
end
