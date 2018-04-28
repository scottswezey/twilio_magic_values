defmodule TwilioMagicNumbers.Call do
  @moduledoc """
  For tests making calls with Twilio.

  See: [https://www.twilio.com/docs/iam/test-credentials#test-calls](https://www.twilio.com/docs/iam/test-credentials#test-calls)
  """

  def from_invalid,    do: "+15005550001" # Error 21212
  def from_valid,      do: "+15005550006"
  def from_other(num), do: num # Not verified for account; Error 21210

  def to_invalid,              do: "+15005550001" # Error: 21217
  def to_cant_route,           do: "+15005550002" # Error: 21214
  def to_geo_permission_error, do: "+15005550003" # Error: 21515
  def to_blacklisted,          do: "+15005550004" # Error 21216
  def to_other(num),           do: num # All other numbers are validated normally. Errors are dependent on input.
end
