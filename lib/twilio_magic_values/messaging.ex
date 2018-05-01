defmodule TwilioMagicValues.Messaging do
  @moduledoc """
  Wrapper for Twilio magic phone numbers used in tests sending SMS messages.

  See: [https://www.twilio.com/docs/iam/test-credentials#test-sms-messages](https://www.twilio.com/docs/iam/test-credentials#test-sms-messages)
  """

  @doc """
  Returns the magic phone number which is **INVALID** as an SMS sender.

  Expect the [21212](https://www.twilio.com/docs/errors/21212) API error from Twilio.

  ## Example

      iex> map = send_message(from: TwilioMagicValues.Messaging.invalid_sender(), to: TwilioMagicValues.Messaging.to_other("+17148673509"))
      iex> Map.get(map, :code)
      21212
  """
  def invalid_sender, do: "+15005550001"

  @doc """
  Returns the magic phone number which is **NOT VERIFIED OR OWNED BY YOUR ACCOUNT** and cannot be used as an SMS sender.

  Expect the [21606](https://www.twilio.com/docs/errors/21606) API error from Twilio.

  ## Example

      iex> map = send_message(from: TwilioMagicValues.Messaging.unowned_number(), to: TwilioMagicValues.Messaging.to_other("+17148673509"))
      iex> Map.get(map, :code)
      21606
  """
  def unowned_number, do: "+15005550007"

  @doc """
  Returns the magic phone number which is **CANT SEND SMS**.

  Expect the [21606](https://www.twilio.com/docs/errors/21606) API error from Twilio.

  ## Example

      iex> map = send_message(from: TwilioMagicValues.Messaging.sender_cant_send_sms(), to: TwilioMagicValues.Messaging.to_other("+17148673509"))
      iex> Map.get(map, :code)
      21606
  """
  def sender_cant_send_sms, do: "+15005550007"

  @doc """
  Returns the magic phone number which has a **FULL OUTGOING SMS QUEUE**.

  Expect the [21611](https://www.twilio.com/docs/errors/21611) API error from Twilio.

  ## Example

      iex> map = send_message(from: TwilioMagicValues.Messaging.sender_queue_full(), to: TwilioMagicValues.Messaging.to_other("+17148673509"))
      iex> Map.get(map, :code)
      21611
  """
  def sender_queue_full, do: "+15005550008"

  @doc """
  Returns the magic phone number which can send SMS messages.

  Expect no error.

  ## Example

      iex> map = send_message(from: TwilioMagicValues.Messaging.valid_sender(), to: TwilioMagicValues.Messaging.to_other("+17148673509"))
      iex> Map.get(map, :code, "There is no error code")
      "There is no error code"
      iex> Map.get(map, :num_segments)
      "1"
      iex> Map.get(map, :num_media)
      "0"
  """
  def valid_sender, do: "+15005550006"

  @doc """
  Returns the magic phone number which is **INVALID** and cannot receive SMS messages.

  Expect the [21211](https://www.twilio.com/docs/errors/21211) API error from Twilio.

  ## Example

      iex> map = send_message(from: TwilioMagicValues.Messaging.valid_sender(), to: TwilioMagicValues.Messaging.invalid_recipient())
      iex> Map.get(map, :code)
      21211
  """
  def invalid_recipient, do: "+15005550001"

  @doc """
  Returns the magic phone number which is **UNROUTABLE** and cannot receive SMS messages.

  Expect the [21612](https://www.twilio.com/docs/errors/21612) API error from Twilio.

  ## Example

      iex> map = send_message(from: TwilioMagicValues.Messaging.valid_sender(), to: TwilioMagicValues.Messaging.unroutable_recipient())
      iex> Map.get(map, :code)
      21612
  """
  def unroutable_recipient, do: "+15005550002"

  @doc """
  Returns the magic phone number which returns a **GEO PERMISSION ERROR** when sent an SMS message.

  Expect the [21408](https://www.twilio.com/docs/errors/21408) API error from Twilio.

  ## Example

      iex> map = send_message(from: TwilioMagicValues.Messaging.valid_sender(), to: TwilioMagicValues.Messaging.geo_blocked_recipient())
      iex> Map.get(map, :code)
      21408
  """
  def geo_blocked_recipient, do: "+15005550003"

  @doc """
  Returns the magic phone number which is **BLACKLISTED** such that your account cannot send a message to it.

  Expect the [21610](https://www.twilio.com/docs/errors/21610) API error from Twilio.

  ## Example

      iex> map = send_message(from: TwilioMagicValues.Messaging.valid_sender(), to: TwilioMagicValues.Messaging.blacklisted_recipient())
      iex> Map.get(map, :code)
      21610
  """
  def blacklisted_recipient, do: "+15005550004"

  @doc """
  Returns the magic phone number which **DOESNT SUPPORT RECEIVING SMS MESSAGES**.

  Expect the [21614](https://www.twilio.com/docs/errors/21614) API error from Twilio.

  ## Example

      iex> map = send_message(from: TwilioMagicValues.Messaging.valid_sender(), to: TwilioMagicValues.Messaging.cant_receive_sms())
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
