defmodule TwilioMagicValues.Call do
  @moduledoc """
  For tests making calls with Twilio.

  See: [https://www.twilio.com/docs/iam/test-credentials#test-calls](https://www.twilio.com/docs/iam/test-credentials#test-calls)
  """

  @doc """
  Returns the magic phone number which is **INVALID** to call from.

  Expect the 21212 API error from Twilio.
  """
  def from_invalid, do: "+15005550001"
  @doc """
  Returns the magic phone number which is **VALID** to call from.

  Expect no error.
  """
  def from_valid, do: "+15005550006"
  @doc """
  All other phone numbers, even ones owned by your production credentials, will return an error when used to call from.

  (Other numbers are not verified on your test credentials.)

  Expect the 21210 API error from Twilio.
  """
  def from_other(string)
  def from_other(num), do: num

  @doc """
  Returns the magic phone number which is **INVALID** to call to.

  Expect the 21217 API error from Twilio.
  """
  def to_invalid, do: "+15005550001"
  @doc """
  Returns the magic phone number which is **UNROUTABLE** to call to.

  Expect the 21214 API error from Twilio.
  """
  def to_cant_route, do: "+15005550002"
  @doc """
  Returns the magic phone number which has **GEO PERMISSION ERRORS** to call to.

  Expect the 21515 API error from Twilio.
  """
  def to_geo_permission_error, do: "+15005550003"
  @doc """
  Returns the magic phone number which is **BLACKLISTED** to call to.

  Expect the 21216 API error from Twilio.
  """
  def to_blacklisted, do: "+15005550004"
  @doc """
  All other phone numbers are potentially valid and subject to verified normally.

  Errors are dependent on input.
  """
  def to_other(string)
  def to_other(num), do: num
end
