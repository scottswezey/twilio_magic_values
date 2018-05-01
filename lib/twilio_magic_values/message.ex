defmodule TwilioMagicValues.Message do
  @moduledoc """
  Wrapper for Twilio magic phone numbers used in tests sending SMS messages.

  See: [https://www.twilio.com/docs/iam/test-credentials#test-sms-messages](https://www.twilio.com/docs/iam/test-credentials#test-sms-messages)
  """

  @doc """
  Returns the magic phone number which is **INVALID** to send SMS from.

  Expect the 21212 API error from Twilio.
  """
  def invalid_sender, do: "+15005550001"

  @doc """
  Returns the magic phone number which is **NOT VERIFIED BY YOUR ACCOUNT** to send SMS from.

  Expect the 21606 API error from Twilio.
  """
  def unowned_number, do: "+15005550007"

  @doc """
  Returns the magic phone number which is **CANT SEND SMS** to send SMS from.

  Expect the 21606 API error from Twilio.
  """
  def sender_cant_send_sms, do: "+15005550007"

  @doc """
  Returns the magic phone number which has **A FULL QUEUE** to send SMS from.

  Expect the 21611 API error from Twilio.
  """
  def sender_queue_full, do: "+15005550008"

  @doc """
  Returns the magic phone number which is **VALID** to send SMS from.

  Expect no error.
  """
  def valid_sender, do: "+15005550006"

  @doc """
  Returns the magic phone number which is **INVALID** to send a message to.

  Expect the 21211 API error from Twilio.
  """
  def invalid_recipient, do: "+15005550001"

  @doc """
  Returns the magic phone number which is **UNROUTABLE** to send a message to.

  Expect the 21612 API error from Twilio.
  """
  def unroutable_recipient, do: "+15005550002"

  @doc """
  Returns the magic phone number which has a **GEO PERMISSION ERROR** to send a message to.

  Expect the 21408 API error from Twilio.
  """
  def geo_blocked_recipient, do: "+15005550003"

  @doc """
  Returns the magic phone number which is **BLACKLISTED** to send a message to.

  Expect the 21610 API error from Twilio.
  """
  def blacklisted_recipient, do: "+15005550004"

  @doc """
  Returns the magic phone number which is **DOESNT SUPPORT SMS** to send a message to.

  Expect the 21614 API error from Twilio.
  """
  def cant_receive_sms, do: "+15005550009"

  @doc """
  All other phone numbers are potentially valid and are verified normally.

  Errors are dependent on input.
  """
  def to_other(phone_number), do: phone_number
end
