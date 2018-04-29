defmodule TwilioMagicValues.BuyNumberTest do
  use ExUnit.Case
  doctest TwilioMagicValues.BuyNumber
  alias TwilioMagicValues.BuyNumber, as: Magic

  # POST https://api.twilio.com/2010-04-01/Accounts/{TestAccountSid}/IncomingPhoneNumbers

  test "unavailable" do
    results = post(phone_number: Magic.unavailable())

    assert results.code == 21422
    assert results.status == 400
  end

  test "invalid" do
    results = post(phone_number: Magic.invalid())

    assert results.code == 21421
    assert results.status == 400
  end

  test "valid" do
    results = post(phone_number: Magic.valid())

    assert results.status == "new"
    assert results.friendly_name == "(500) 555-0006"
  end

  test "empty_area_code" do
    results = post(area_code: Magic.empty_area_code())

    assert results.code == 21452
    assert results.status == 400
  end

  test "available_area_code" do
    results = post(area_code: Magic.available_area_code())

    assert results.status == "new"
    assert results.friendly_name == "(500) 555-0006"
  end

  defp post(phone_number: num) do
    headers = []
    options = [hackney: [basic_auth: {api_test_sid(), api_auth_token()}]]
    post_data = {:form, [{"PhoneNumber", num}]}

    {:ok, %HTTPoison.Response{} = resp} = HTTPoison.post(api_url(), post_data, headers, options)

    Poison.Parser.parse!(resp.body, keys: :atoms)
  end

  defp post(area_code: num) do
    headers = []
    options = [hackney: [basic_auth: {api_test_sid(), api_auth_token()}]]
    post_data = {:form, [{"AreaCode", num}]}

    {:ok, %HTTPoison.Response{} = resp} = HTTPoison.post(api_url(), post_data, headers, options)

    Poison.Parser.parse!(resp.body, keys: :atoms)
  end

  defp api_test_sid do
    Application.get_env(
      :twilio_magic_values,
      :test_account_sid,
      "Test Account SID not provided"
    )
  end

  defp api_auth_token,
    do:
      Application.get_env(:twilio_magic_values, :test_auth_token, "Test auth token not provided")

  defp api_host, do: "https://api.twilio.com"

  defp api_url do
    "#{api_host()}/2010-04-01/Accounts/#{api_test_sid()}/IncomingPhoneNumbers.json"
  end
end
