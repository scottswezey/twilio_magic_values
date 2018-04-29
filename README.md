# Twilio Magic Values

Provide elixir apps with simple, pragmatic access to [magic testing values](https://www.twilio.com/docs/iam/test-credentials) for [Twilio](https://www.twilio.com).

## Usage

1. Require this dep in your `mix.exs`, then run `mix deps.get`.
1. There is **NO** need to include this as in `applications` or `extra_applications`.
1. Use the provided modules and functions in your test code.

### Example:

- `TwilioMagicValues.Message.to_blacklisted()`
- `TwilioMagicValues.Call.from_invalid()`
- `TwilioMagicValues.BuyNumber.unavailable()`

## Other resources
- [https://www.twilio.com/docs/iam/test-credentials](https://www.twilio.com/docs/iam/test-credentials)
- [https://www.twilio.com/blog/2018/04/twilio-test-credentials-magic-numbers.html](https://www.twilio.com/blog/2018/04/twilio-test-credentials-magic-numbers.html)
- The code should be simple enough and is documented. Run `mix docs` to generate docs.

### Other useful Twilio projects in Elixir
- [https://github.com/danielberkompas/ex_twilio](https://github.com/danielberkompas/ex_twilio)
- [https://github.com/danielberkompas/telephonist](https://github.com/danielberkompas/telephonist)
- [https://github.com/danielberkompas/ex_twiml](https://github.com/danielberkompas/ex_twiml)
---

## Contributing
- Issues and pull requests are welcome on [Github](https://github.com/scottswezey/twilio_magic_values).
- Please run `mix format` before committing.
- Ensure tests pass before committing. You will need to copy `config/test.secret.exs.sample` to `config/test.secret.exs` and add your own [testing credentials](https://www.twilio.com/console/account/settings) from Twilio.

## License
GPL v3; See `LICENSE` file.

## Author and Major Contributors
Written by [Scott Swezey](https://github.com/scottswezey).


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
