# Twilio Magic Values

Provide elixir apps with simple, pragmatic access to [magic testing values](https://www.twilio.com/docs/iam/test-credentials) for the [Twilio](https://www.twilio.com) API. The module and function names help give you code that is easier to read and is less prone to typos. Automated tests in this project also ensure that you will know if the magic numbers ever change.

## Installation

- Require `twilio_magic_values` in your `mix.exs` deps. Since this project isn't currently published to [Hex](https://hex.pm/docs/publish), you will need to use git as shown here:
```elixir
def deps do
  [
    {:twilio_magic_values, git: "git://github.com/scottswezey/twilio_magic_values.git", only: :test}
  ]
end
```
- This project is only needed for the `test` environment.
- After version `1.0.0`, the project will follow [SEMVER](https://semver.org) 2.0.
- Don't forget to run `mix deps.get`.

## Usage

- You do **NOT** need to include this as in `applications` or `extra_applications`.
- Use the provided functions to replace hard coded magic phone numbers in your test code.

### Examples:

- Instead of testing sending a message to `+15005550004`, use: `TwilioMagicValues.Message.to_blacklisted()`.
- Instead of testing a call from `+15005550001`, use: `TwilioMagicValues.Call.from_invalid()`.
- Instead of trying to purchase `+15005550000`, use: `TwilioMagicValues.BuyNumber.unavailable()`.

## Resources
- Docs are available at: [https://scottswezey.github.io/twilio_magic_values](https://scottswezey.github.io/twilio_magic_values). The Docs will be moved to Hexdocs when the project is posted on Hex.
- The Twilio docs for test credentials and magic phone numbers: [https://www.twilio.com/docs/iam/test-credentials](https://www.twilio.com/docs/iam/test-credentials)
- A Twilio authored blog post concerning test credentials and magic phone numbers: [https://www.twilio.com/blog/2018/04/twilio-test-credentials-magic-numbers.html](https://www.twilio.com/blog/2018/04/twilio-test-credentials-magic-numbers.html)

### Other useful Twilio projects in Elixir
- [https://github.com/danielberkompas/ex_twilio](https://github.com/danielberkompas/ex_twilio)
- [https://github.com/danielberkompas/telephonist](https://github.com/danielberkompas/telephonist)
- [https://github.com/danielberkompas/ex_twiml](https://github.com/danielberkompas/ex_twiml)
- Suggestions for this section are welcome. Please open an issue on GitHub.
---

## Contributing
- Twilio doesn't currently provide magic numbers for other parts of their APIs. If there is something they add new, or a magic number they offer which is otherwise missing from this project, please open an issue or pull request on GitHub.
- Issues and pull requests are welcome on [GitHub](https://github.com/scottswezey/twilio_magic_values).
- Please run `mix format` before committing.
- Ensure tests pass before committing. You will need to copy `config/test.secret.exs.sample` to `config/test.secret.exs` and add your own [testing credentials](https://www.twilio.com/console/account/settings) from Twilio.
- Do not bump the version number in your pull requests.

## License
GPL v3; See `LICENSE` file.

## Author and Major Contributors

Written by [Scott Swezey](https://github.com/scottswezey).

Made possible by the [fantastic documentation](https://www.twilio.com/docs/iam/test-credentials) and [blog posts](https://www.twilio.com/blog/2018/04/twilio-test-credentials-magic-numbers.html) provided by [Twilio](https://www.twilio.com).
