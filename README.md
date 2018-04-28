# Twilio Magic Values

[Twilio](https://www.twilio.com) provides magic values for use in testing. Details at: https://www.twilio.com/docs/iam/test-credentials

The goal of this project is to provide simple pragmatic access to these for elixir apps.

## Usage

1. Require this dep in your `mix.exs`, then `mix deps.get`
1. There is **NO** need to include this as an application or extra_application.
1. Use the provided modules and functions in your test code.

### Example:

- `TwilioMagicValues.Message.to_blacklisted`
- `TwilioMagicValues.Call.from_invalid`
- `TwilioMagicValues.BuyNumber.unavailable`

---

## License
GPL v3; See `LICENSE` file

## Author
Written by Scott Swezey.

## Issues and Pull Requests
Issues and pull requests are welcome on Github.

<!-- ## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `twilio_magic_values` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:twilio_magic_values, "~> 0.1.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/twilio_magic_values](https://hexdocs.pm/twilio_magic_values). -->
