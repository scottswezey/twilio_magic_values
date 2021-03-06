defmodule TwilioMagicValues.CallingTest do
  use ExUnit.Case, async: true
  doctest TwilioMagicValues.Calling
  alias TwilioMagicValues.Calling, as: Magic

  test "invalid_caller_id" do
    results =
      make_call(
        from: Magic.invalid_caller_id(),
        to: Magic.to_other("+17148675309")
      )

    assert results.status == 400
    assert results.code == 21_212
  end

  test "valid_caller_id" do
    results =
      make_call(
        from: Magic.valid_caller_id(),
        to: Magic.to_other("+17148675309")
      )

    assert results.from_formatted == "(500) 555-0006"
    assert results.to_formatted == "(714) 867-5309"
  end

  test "invalid_recipient" do
    results =
      make_call(
        from: Magic.valid_caller_id(),
        to: Magic.invalid_recipient()
      )

    assert results.status == 400
    assert results.code == 21_217
  end

  test "unroutable_recipient" do
    results =
      make_call(
        from: Magic.valid_caller_id(),
        to: Magic.unroutable_recipient()
      )

    assert results.status == 400
    assert results.code == 21_214
  end

  test "geo_blocked_recipient" do
    results =
      make_call(
        from: Magic.valid_caller_id(),
        to: Magic.geo_blocked_recipient()
      )

    assert results.status == 400
    assert results.code == 21_215
  end

  test "blacklisted_recipient" do
    results =
      make_call(
        from: Magic.valid_caller_id(),
        to: Magic.blacklisted_recipient()
      )

    assert results.status == 400
    assert results.code == 21_216
  end

  defp make_call(from: f, to: t) do
    get_http_response(call_to: t, from: f)
    |> Map.get(:body)
    |> Poison.Parser.parse!(%{keys: :atoms})
  end

  defp get_http_response(call_to: t, from: f),
    do:
      get_http_response([{"To", t}, {"From", f}, {"Url", "http://demo.twilio.com/docs/voice.xml"}])

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
    "#{api_host()}/2010-04-01/Accounts/#{api_test_sid()}/Calls.json"
  end
end
