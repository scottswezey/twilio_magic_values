defmodule TwilioMagicNumbers.Message do
  # Error docs @ https://www.twilio.com/docs/errors/#{error}
  # https://www.twilio.com/docs/iam/test-credentials#test-sms-messages

  def from_invalid,   do: "+15005550001" # Error: 21212
  def from_unowned,   do: "+15005550007" # Error: 21606
  def from_cant_sms,  do: "+15005550007" # Error: 21606
  def from_queue_full,do: "+15005550008" # Error: 21611
  def from_valid,     do: "+15005550006"

  def to_invalid,              do: "+15005550001" # Error: 21211
  def to_cant_route,           do: "+15005550002" # Error: 21612
  def to_geo_permission_error, do: "+15005550003" # Error: 21408
  def to_blacklisted,          do: "+15005550004" # Error 21610
  def to_cant_sms,             do: "+15005550009" # Error 21614
  def other(num),              do: num # All other numbers are validated normally. Errors are dependent on input.
end
