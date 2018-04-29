defmodule TwilioMagicValues.Message do
  @moduledoc """
  For tests sending SMS messages with Twilio.

  See: [https://www.twilio.com/docs/iam/test-credentials#test-sms-messages](https://www.twilio.com/docs/iam/test-credentials#test-sms-messages)
  """

  @doc """
  Returns the magic phone number which is **INVALID** to send SMS from.

  Expect the 21212 API error from Twilio.
  """
  def from_invalid, do: "+15005550001"

  @doc """
  Returns the magic phone number which is **NOT VERIFIED BY YOUR ACCOUNT** to send SMS from.

  Expect the 21606 API error from Twilio.
  """
  def from_unowned, do: "+15005550007"

  @doc """
  Returns the magic phone number which is **CANT SEND SMS** to send SMS from.

  Expect the 21606 API error from Twilio.
  """
  def from_cant_sms, do: "+15005550007"

  @doc """
  Returns the magic phone number which has **A FULL QUEUE** to send SMS from.

  Expect the 21611 API error from Twilio.
  """
  def from_queue_full, do: "+15005550008"

  @doc """
  Returns the magic phone number which is **VALID** to send SMS from.

  Expect no error.
  """
  def from_valid, do: "+15005550006"

  @doc """
  Returns the magic phone number which is **INVALID** to send a message to.

  Expect the 21211 API error from Twilio.
  """
  def to_invalid, do: "+15005550001"

  @doc """
  Returns the magic phone number which is **UNROUTABLE** to send a message to.

  Expect the 21612 API error from Twilio.
  """
  def to_cant_route, do: "+15005550002"

  @doc """
  Returns the magic phone number which has a **GEO PERMISSION ERROR** to send a message to.

  Expect the 21408 API error from Twilio.
  """
  def to_geo_permission_error, do: "+15005550003"

  @doc """
  Returns the magic phone number which is **BLACKLISTED** to send a message to.

  Expect the 21610 API error from Twilio.
  """
  def to_blacklisted, do: "+15005550004"

  @doc """
  Returns the magic phone number which is **DOESNT SUPPORT SMS** to send a message to.

  Expect the 21614 API error from Twilio.
  """
  def to_cant_sms, do: "+15005550009"

  @doc """
  All other phone numbers are potentially valid and are verified normally.

  Errors are dependent on input.
  """
  def to_other(string)
  def to_other(num), do: num
end
