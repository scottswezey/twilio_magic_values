defmodule TwilioMagicValues do
  @moduledoc false

  @type phone_number :: String.t
  @type t :: phone_number

  @doc """
  Helper returns a URL to the Twilio documentation for a specific error code.

  ## Examples

      iex> TwilioMagicValues.error_info_url("21212")
      "https://www.twilio.com/docs/errors/21212"

      iex> TwilioMagicValues.error_info_url("21606")
      "https://www.twilio.com/docs/errors/21606"

  """
  def error_info_url(integer_or_string_error_code)

  def error_info_url(code) do
    "https://www.twilio.com/docs/errors/#{code}"
  end
end
