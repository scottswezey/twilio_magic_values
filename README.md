# Twilio Magic Values

Provides elixir apps with simple, pragmatic access to [magic testing values](https://www.twilio.com/docs/iam/test-credentials) for the [Twilio](https://www.twilio.com) API. The module and function names help give you code that is easier to read and is less prone to typos. Automated tests in this project also ensure that you will know if the magic numbers ever change.

## Installation

- Update your `mix.exs` deps.

```elixir
def deps do
  [
    ...,
    {:twilio_magic_values, "~> 1.0", only: :test}
  ]
end
```

- Run `mix deps.get`.
- No need to modify the `applications` or `extra_applications` settings to use this project.

## Pseudocode usage examples

See the docs for all available modules and methods for all known magic numbers.

### Instead of testing a call from `+15005550001`

Use: `TwilioMagicValues.Calling.invalid_caller_id/1`

```elixir
alias TwilioMagicValues.Calling

make_test_call(from: Calling.invalid_caller_id(),
               to: Calling.invalid_recipient(),
               ...)
```

---

### Instead of testing a purchase for `+15005550000`

Use: `TwilioMagicValues.NumberPurchasing.unavailable_phone_number/1`

```elixir
alias TwilioMagicValues.NumberPurchasing

buy_test_number(exactly: NumberPurchasing.unavailable_phone_number())
```

---

### Instead of testing sending a message to `+15005550004`

Use: `TwilioMagicValues.Messaging.blacklisted_recipient/1`

```elixir
alias TwilioMagicValues.Messaging

send_test_message(from: Messaging.valid_sender(),
                  to: Messaging.blacklisted_recipient(),
                  ...)
```

---

## Project freshness

- **Latest development:** April 2, 2019
- **Tests passed:** April 2, 2019

## Versioning

This project is versioned using the [SEMVER 2.0.0 rules](https://semver.org).

- **Major** versions (ex: 1.y.z) will be introduced in the event of breaking changes where clients using this project will need to update their code.
- **Minor** versions (ex: x.1.z) will be introduced for new features, such as new magic numbers provided by Twilio.
- **Patch** versions (ex: x.y.1) will be introduced for fixes, documentation and instruction updates, and similar minor, non-breaking changes.

## Resources

- [Project documentation](https://hexdocs.pm/twilio_magic_values).
- The Twilio docs for [test credentials and magic phone numbers](https://www.twilio.com/docs/iam/test-credentials).
- A related [blog post](https://www.twilio.com/blog/2018/04/twilio-test-credentials-magic-numbers.html) by Twilio concerning test credentials and magic phone numbers.

### Other useful Twilio projects written in Elixir

- [ex_twilio](https://github.com/danielberkompas/ex_twilio)
- [telephonist](https://github.com/danielberkompas/telephonist)
- [ex_twiml](https://github.com/danielberkompas/ex_twiml)
- Suggestions for this section are welcome. Please open an issue on GitHub.

## Contributing

- Issues and pull requests are welcome on [GitHub](https://github.com/scottswezey/twilio_magic_values).
- Twilio doesn't currently provide magic numbers for other parts of their APIs. If they add a new magic number, please open an issue or pull request.
- See [`CONTRIBUTING.md`](https://github.com/scottswezey/twilio_magic_values/blob/master/CONTRIBUTING.md)

## License

GPL v3; See `LICENSE` file.

## Author and Major Contributors

Written by [Scott Swezey](https://github.com/scottswezey).
