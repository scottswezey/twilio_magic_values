defmodule TwilioMagicValues.Message do
  @moduledoc """
  Wrapper for Twilio magic phone numbers used in tests sending SMS messages.

  See: [https://www.twilio.com/docs/iam/test-credentials#test-sms-messages](https://www.twilio.com/docs/iam/test-credentials#test-sms-messages)
  """

  @doc """
  Returns the magic phone number which is **INVALID** to send SMS from.

  Expect the [21212](https://www.twilio.com/docs/errors/21212) API error from Twilio.

  ## Example

      iex> map = send_message(from: TwilioMagicValues.Message.invalid_sender(), to: TwilioMagicValues.Message.to_other("+17148673509"))
      iex> Map.get(map, :code)
      21212
  """
  def invalid_sender, do: "+15005550001"

  @doc """
  Returns the magic phone number which is **NOT VERIFIED BY YOUR ACCOUNT** to send SMS from.

  Expect the [21606](https://www.twilio.com/docs/errors/21606) API error from Twilio.

  ## Example

      iex> map = send_message(from: TwilioMagicValues.Message.unowned_number(), to: TwilioMagicValues.Message.to_other("+17148673509"))
      iex> Map.get(map, :code)
      21606
  """
  def unowned_number, do: "+15005550007"

  @doc """
  Returns the magic phone number which is **CANT SEND SMS** to send SMS from.

  Expect the [21606](https://www.twilio.com/docs/errors/21606) API error from Twilio.

  ## Example

      iex> map = send_message(from: TwilioMagicValues.Message.sender_cant_send_sms(), to: TwilioMagicValues.Message.to_other("+17148673509"))
      iex> Map.get(map, :code)
      21606
  """
  def sender_cant_send_sms, do: "+15005550007"

  @doc """
  Returns the magic phone number which has **A FULL QUEUE** to send SMS from.

  Expect the [21611](https://www.twilio.com/docs/errors/21611) API error from Twilio.

  ## Example

      iex> map = send_message(from: TwilioMagicValues.Message.sender_queue_full(), to: TwilioMagicValues.Message.to_other("+17148673509"))
      iex> Map.get(map, :code)
      21611
  """
  def sender_queue_full, do: "+15005550008"

  @doc """
  Returns the magic phone number which is **VALID** to send SMS from.

  Expect no error.

  ## Example

      iex> map = send_message(from: TwilioMagicValues.Message.valid_sender(), to: TwilioMagicValues.Message.to_other("+17148673509"))
      iex> Map.get(map, :code, "There is no error code")
      "There is no error code"
      iex> Map.get(map, :num_segments)
      "1"
      iex> Map.get(map, :num_media)
      "0"
  """
  def valid_sender, do: "+15005550006"

  @doc """
  Returns the magic phone number which is **INVALID** to send a message to.

  Expect the [21211](https://www.twilio.com/docs/errors/21211) API error from Twilio.

  ## Example

      iex> map = send_message(from: TwilioMagicValues.Message.valid_sender(), to: TwilioMagicValues.Message.invalid_recipient())
      iex> Map.get(map, :code)
      21211
  """
  def invalid_recipient, do: "+15005550001"

  @doc """
  Returns the magic phone number which is **UNROUTABLE** to send a message to.

  Expect the [21612](https://www.twilio.com/docs/errors/21612) API error from Twilio.

  ## Example

      iex> map = send_message(from: TwilioMagicValues.Message.valid_sender(), to: TwilioMagicValues.Message.unroutable_recipient())
      iex> Map.get(map, :code)
      21612
  """
  def unroutable_recipient, do: "+15005550002"

  @doc """
  Returns the magic phone number which has a **GEO PERMISSION ERROR** to send a message to.

  Expect the [21408](https://www.twilio.com/docs/errors/21408) API error from Twilio.

  ## Example

      iex> map = send_message(from: TwilioMagicValues.Message.valid_sender(), to: TwilioMagicValues.Message.geo_blocked_recipient())
      iex> Map.get(map, :code)
      21408
  """
  def geo_blocked_recipient, do: "+15005550003"

  @doc """
  Returns the magic phone number which is **BLACKLISTED** to send a message to.

  Expect the [21610](https://www.twilio.com/docs/errors/21610) API error from Twilio.

  ## Example

      iex> map = send_message(from: TwilioMagicValues.Message.valid_sender(), to: TwilioMagicValues.Message.blacklisted_recipient())
      iex> Map.get(map, :code)
      21610
  """
  def blacklisted_recipient, do: "+15005550004"

  @doc """
  Returns the magic phone number which is **DOESNT SUPPORT SMS** to send a message to.

  Expect the [21614](https://www.twilio.com/docs/errors/21614) API error from Twilio.

  ## Example

      iex> map = send_message(from: TwilioMagicValues.Message.valid_sender(), to: TwilioMagicValues.Message.cant_receive_sms())
      iex> Map.get(map, :code)
      21614
  """
  def cant_receive_sms, do: "+15005550009"

  @doc """
  All other phone numbers are potentially valid and are verified normally.

  Errors are dependent on input.
  """
  def to_other(phone_number), do: phone_number
end
