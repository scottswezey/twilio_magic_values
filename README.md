# Twilio Magic Values

Provide elixir apps with simple, pragmatic access to [magic testing values](https://www.twilio.com/docs/iam/test-credentials) for the [Twilio](https://www.twilio.com) API.

## Installation

<!-- If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `twilio_magic_values` to your list of dependencies in `mix.exs`: -->

- Require `twilio_magic_values` in your `mix.exs` deps. Since this project isn't currently published to Hex, you will need to use git as shown here:
```elixir
def deps do
  [
    {:twilio_magic_values, git: "git://github.com/scottswezey/twilio_magic_values.git", only: :test}
  ]
end
```
- Don't forget to run `mix deps.get`.

## Usage

- You do **NOT** need to include this as in `applications` or `extra_applications`.
- Use the provided functions to replace hard coded magic phone numbers in your test code.

### Examples:

- Instead of `+15005550004`, use: `TwilioMagicValues.Message.to_blacklisted()`
- Instead of `+15005550001`, use: `TwilioMagicValues.Call.from_invalid()`
- Instead of `+15005550000`, use: `TwilioMagicValues.BuyNumber.unavailable()`

<!-- Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/twilio_magic_values](https://hexdocs.pm/twilio_magic_values). -->


## Other resources
- Run `mix docs` to generate docs for this project. They will be published online when the project is posted on Hex.
- [https://www.twilio.com/docs/iam/test-credentials](https://www.twilio.com/docs/iam/test-credentials)
- [https://www.twilio.com/blog/2018/04/twilio-test-credentials-magic-numbers.html](https://www.twilio.com/blog/2018/04/twilio-test-credentials-magic-numbers.html)

### Other useful Twilio projects in Elixir
- [https://github.com/danielberkompas/ex_twilio](https://github.com/danielberkompas/ex_twilio)
- [https://github.com/danielberkompas/telephonist](https://github.com/danielberkompas/telephonist)
- [https://github.com/danielberkompas/ex_twiml](https://github.com/danielberkompas/ex_twiml)
- Suggestions for this section are welcome. Please open an issue.
---

## Contributing
- Twilio doesn't currently provide magic numbers for other portion of their API. If there is something they add new, or a magic number they offer which is otherwise missing from this project, please open an issue or pull request.
- Issues and pull requests are welcome on [Github](https://github.com/scottswezey/twilio_magic_values).
- Please run `mix format` before committing.
- Ensure tests pass before committing. You will need to copy `config/test.secret.exs.sample` to `config/test.secret.exs` and add your own [testing credentials](https://www.twilio.com/console/account/settings) from Twilio.

## License
GPL v3; See `LICENSE` file.

## Author and Major Contributors
Written by [Scott Swezey](https://github.com/scottswezey).
Made possible by the [fantastic documentation](https://www.twilio.com/docs/iam/test-credentials) and [blog posts](https://www.twilio.com/blog/2018/04/twilio-test-credentials-magic-numbers.html) provided by twilio.
