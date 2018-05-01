defmodule TwilioMagicValues.Call do
  @moduledoc """
  Wrapper for Twilio magic phone numbers used in tests making calls.

  See: [https://www.twilio.com/docs/iam/test-credentials#test-calls](https://www.twilio.com/docs/iam/test-credentials#test-calls)
  """

  @doc """
  Returns the magic phone number which is **INVALID** to call from.

  Expect the [21212](https://www.twilio.com/docs/errors/21212) API error from Twilio.
  """
  def invalid_sender, do: "+15005550001"

  @doc """
  Returns the magic phone number which is **VALID** to call from.

  Expect no error.
  """
  def valid_sender, do: "+15005550006"

  @doc """
  All other phone numbers, even ones owned by your production credentials, will return an error when used to call from.

  (Other numbers are not verified on your test credentials.)

  Expect the [21210](https://www.twilio.com/docs/errors/21210) API error from Twilio.
  """
  def from_other(phone_number), do: phone_number

  @doc """
  Returns the magic phone number which is **INVALID** to call to.

  Expect the [21217](https://www.twilio.com/docs/errors/21217) API error from Twilio.
  """
  def invalid_recipient, do: "+15005550001"

  @doc """
  Returns the magic phone number which is **UNROUTABLE** to call to.

  Expect the [21214](https://www.twilio.com/docs/errors/21214) API error from Twilio.
  """
  def unroutable_recipient, do: "+15005550002"

  @doc """
  Returns the magic phone number which has **GEO PERMISSION ERRORS** to call to.

  Expect the [21215](https://www.twilio.com/docs/errors/21215) API error from Twilio.
  """
  def geo_blocked_recipient, do: "+15005550003"

  @doc """
  Returns the magic phone number which is **BLACKLISTED** to call to.

  Expect the [21216](https://www.twilio.com/docs/errors/21216) API error from Twilio.
  """
  def blacklisted_recipient, do: "+15005550004"

  @doc """
  All other phone numbers are potentially valid and are verified normally.

  Errors are dependent on input.
  """
  def to_other(phone_number), do: phone_number
end
