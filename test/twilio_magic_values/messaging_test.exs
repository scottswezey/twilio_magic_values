defmodule TwilioMagicValues.MessagingTest do
  use ExUnit.Case
  doctest TwilioMagicValues.Messaging
  alias TwilioMagicValues.Messaging, as: Magic

  # POST /2010-04-01/Accounts/{TestAccountSid}/Messages

  test "invalid_sender" do
    results =
      send_message(
        from: Magic.invalid_sender(),
        to: Magic.to_other("+17148673509")
      )

    assert results.status == 400
    assert results.code == 21212
  end

  test "from unowned_number" do
    results =
      send_message(
        from: Magic.unowned_number(),
        to: Magic.to_other("+17148673509")
      )

    assert results.status == 400
    assert results.code == 21606
  end

  test "sender_cant_send_sms" do
    results =
      send_message(
        from: Magic.sender_cant_send_sms(),
        to: Magic.to_other("+17148673509")
      )

    assert results.status == 400
    assert results.code == 21606
  end

  test "sender_queue_full" do
    results =
      send_message(
        from: Magic.sender_queue_full(),
        to: Magic.to_other("+17148673509")
      )

    assert results.status == 429
    assert results.code == 21611
  end

  test "valid_sender" do
    results =
      send_message(
        from: Magic.valid_sender(),
        to: Magic.to_other("+17148673509")
      )

    assert results.num_media == "0"
    assert results.num_segments == "1"
  end

  test "invalid_recipient" do
    results =
      send_message(
        from: Magic.valid_sender(),
        to: Magic.invalid_recipient()
      )

    assert results.status == 400
    assert results.code == 21211
  end

  test "unroutable_recipient" do
    results =
      send_message(
        from: Magic.valid_sender(),
        to: Magic.unroutable_recipient()
      )

    assert results.status == 400
    assert results.code == 21612
  end

  test "geo_blocked_recipient" do
    results =
      send_message(
        from: Magic.valid_sender(),
        to: Magic.geo_blocked_recipient()
      )

    assert results.status == 400
    assert results.code == 21408
  end

  test "blacklisted_recipient" do
    results =
      send_message(
        from: Magic.valid_sender(),
        to: Magic.blacklisted_recipient()
      )

    assert results.status == 400
    assert results.code == 21610
  end

  test "cant_receive_sms" do
    results =
      send_message(
        from: Magic.valid_sender(),
        to: Magic.cant_receive_sms()
      )

    assert results.status == 400
    assert results.code == 21614
  end

  defp send_message(from: f, to: t) do
    # headers = []
    # options = [hackney: [basic_auth: {api_test_sid(), api_auth_token()}]]
    # post_data = {:form, [{"To", t}, {"From", f}, {"Body", "Hello%20world"}]}
    #
    # {:ok, %HTTPoison.Response{} = resp} = HTTPoison.post(api_url(), post_data, headers, options)
    #
    # Poison.Parser.parse!(resp.body, keys: :atoms)

    get_http_response([{"To", t}, {"From", f}, {"Body", "Hello%20world"}])
    |> Map.get(:body)
    |> Poison.Parser.parse!(keys: :atoms)
  end

  defp get_http_response(form_args) do
    headers = []
    options = [hackney: [basic_auth: {api_test_sid(), api_auth_token()}]]
    post_data = {:form, form_args}

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
    "#{api_host()}/2010-04-01/Accounts/#{api_test_sid()}/Messages.json"
  end
end
