defmodule TwilioMagicValues.NumberPurchasingTest do
  use ExUnit.Case, async: true
  doctest TwilioMagicValues.NumberPurchasing
  alias TwilioMagicValues.NumberPurchasing, as: Magic

  test "unavailable_phone_number" do
    results = buy_number(exactly: Magic.unavailable_phone_number())

    assert results.code == 21_422
    assert results.status == 400
  end

  test "invalid_phone_number" do
    results = buy_number(exactly: Magic.invalid_phone_number())

    assert results.code == 21_421
    assert results.status == 400
  end

  test "valid_phone_number" do
    results = buy_number(exactly: Magic.valid_phone_number())

    assert results.status == "new"
    assert results.friendly_name == "(500) 555-0006"
  end

  test "empty_area_code" do
    results = buy_number(area_code: Magic.empty_area_code())

    assert results.code == 21_452
    assert results.status == 400
  end

  test "available_area_code" do
    results = buy_number(area_code: Magic.available_area_code())

    assert results.status == "new"
    assert results.friendly_name == "(500) 555-0006"
  end

  defp buy_number(exactly: num) do
    get_http_response(number: num)
    |> Map.get(:body)
    |> Poison.Parser.parse!(%{keys: :atoms})
  end

  defp buy_number(area_code: num) do
    get_http_response(area: num)
    |> Map.get(:body)
    |> Poison.Parser.parse!(%{keys: :atoms})
  end

  defp get_http_response(number: num), do: get_http_response([{"PhoneNumber", num}])
  defp get_http_response(area: num), do: get_http_response([{"AreaCode", num}])

  defp get_http_response(form_arg_list) do
    headers = []
    options = [hackney: [basic_auth: {api_test_sid(), api_auth_token()}]]
    post_data = {:form, form_arg_list}

    {:ok, %HTTPoison.Response{} = response} =
      HTTPoison.post(api_url(), post_data, headers, options)

    response
  end

  defp api_test_sid do
    Application.get_env(
      :twilio_magic_values,
      :test_account_sid,
      "Test Account SID not provided"
    )
  end

  defp api_auth_token do
    Application.get_env(
      :twilio_magic_values,
      :test_auth_token,
      "Test auth token not provided"
    )
  end

  defp api_host, do: "https://api.twilio.com"

  defp api_url do
    "#{api_host()}/2010-04-01/Accounts/#{api_test_sid()}/IncomingPhoneNumbers.json"
  end
end
