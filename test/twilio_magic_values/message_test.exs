defmodule TwilioMagicValues.MessageTest do
  use ExUnit.Case
  doctest TwilioMagicValues.Message
  alias TwilioMagicValues.Message, as: Magic

  # POST /2010-04-01/Accounts/{TestAccountSid}/Messages

  test "from_invalid" do
    results =
      send_message(
        from: Magic.from_invalid(),
        to: Magic.to_other("+17148673509")
      )

    assert results.status == 400
    assert results.code == 21212
  end

  test "from_unowned" do
    results =
      send_message(
        from: Magic.from_unowned(),
        to: Magic.to_other("+17148673509")
      )

    assert results.status == 400
    assert results.code == 21606
  end

  test "from_cant_sms" do
    results =
      send_message(
        from: Magic.from_cant_sms(),
        to: Magic.to_other("+17148673509")
      )

    assert results.status == 400
    assert results.code == 21606
  end

  test "from_queue_full" do
    results =
      send_message(
        from: Magic.from_queue_full(),
        to: Magic.to_other("+17148673509")
      )

    assert results.status == 429
    assert results.code == 21611
  end

  test "from_valid" do
    results =
      send_message(
        from: Magic.from_valid(),
        to: Magic.to_other("+17148673509")
      )

    assert results.num_media == "0"
    assert results.num_segments == "1"
  end

  test "to_invalid" do
    results =
      send_message(
        from: Magic.from_valid(),
        to: Magic.to_invalid()
      )

    assert results.status == 400
    assert results.code == 21211
  end

  test "to_cant_route" do
    results =
      send_message(
        from: Magic.from_valid(),
        to: Magic.to_cant_route()
      )

    assert results.status == 400
    assert results.code == 21612
  end

  test "to_geo_permission_error" do
    results =
      send_message(
        from: Magic.from_valid(),
        to: Magic.to_geo_permission_error()
      )

    assert results.status == 400
    assert results.code == 21408
  end

  test "to_blacklisted" do
    results =
      send_message(
        from: Magic.from_valid(),
        to: Magic.to_blacklisted()
      )

    assert results.status == 400
    assert results.code == 21610
  end

  test "to_cant_sms" do
    results =
      send_message(
        from: Magic.from_valid(),
        to: Magic.to_cant_sms()
      )

    assert results.status == 400
    assert results.code == 21614
  end

  defp send_message(from: f, to: t) do
    headers = []
    options = [hackney: [basic_auth: {api_test_sid(), api_auth_token()}]]
    post_data = {:form, [{"To", t}, {"From", f}, {"Body", "Hello%20world"}]}

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
    "#{api_host()}/2010-04-01/Accounts/#{api_test_sid()}/Messages.json"
  end
end
