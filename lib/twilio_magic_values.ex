defmodule TwilioMagicValues do
  @moduledoc """
  This is an elixir wrapper for magic values provided by Twilio. See https://www.twilio.com/docs/iam/test-credentials
  """

  def error_info_url(code) do
    "https://www.twilio.com/docs/errors/#{code}"
  end
end
