defmodule TwilioMagicValues.CallTest do
  use ExUnit.Case
  doctest TwilioMagicValues.Call
  alias TwilioMagicValues.Call, as: Magic

  # POST /2010-04-01/Accounts/{TestAccountSid}/Calls

  test "from_invalid" do
    results = make_call(from: Magic.from_invalid(),
                          to: Magic.to_other("+17148675309"))

    assert results.status == 400
    assert results.code == 21212
  end
  test "from_valid" do
    results = make_call(from: Magic.from_valid(),
                          to: Magic.to_other("+17148675309"))


    assert results.from_formatted == "(500) 555-0006"
    assert results.to_formatted == "(714) 867-5309"
  end
  test "to_invalid" do
    results = make_call(from: Magic.from_valid(),
                          to: Magic.to_invalid())

    assert results.status == 400
    assert results.code == 21217
  end
  test "to_cant_route" do
    results = make_call(from: Magic.from_valid(),
                          to: Magic.to_cant_route())

    assert results.status == 400
    assert results.code == 21214
  end
  test "to_geo_permission_error" do
    results = make_call(from: Magic.from_valid(),
                          to: Magic.to_geo_permission_error())

    assert results.status == 400
    assert results.code == 21215
  end
  test "to_blacklisted" do
    results = make_call(from: Magic.from_valid(),
                          to: Magic.to_blacklisted())

    assert results.status == 400
    assert results.code == 21216
  end

  defp make_call(from: f, to: t) do
    headers = []
    options = [hackney: [basic_auth: {api_test_sid(), api_auth_token()}]]
    post_data = {:form, [{"To", t}, {"From", f}, {"Url", "http://demo.twilio.com/docs/voice.xml"}]}

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
