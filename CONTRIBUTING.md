# Guidelines for Contributing

## Using GitHub

- Issues and pull requests are welcome on [GitHub](https://github.com/scottswezey/twilio_magic_values).
- If there is a Twilio Magic Number missing from this project, please open an issue or add it with a pull request.
- Please open an issue to discuss major changes before doing a lot of work and submitting a PR. While contributions are generally welcome, it's best to ensure the change will be accepted into the project before investing much time.

## Before submitting a pull request

1. Ensure tests pass by running `mix test`.

> You will need to copy `config/test.secret.exs.sample` to `config/test.secret.exs` and update it with your own [testing credentials](https://www.twilio.com/console/account/settings) from Twilio.

> Remember that most of the tests hit Twilio's API. Avoid running the tests too frequently.

2. Please run `mix credo` and fix any issues before committing.
1. Please run `mix format` before committing.
1. Do not bump the version number in your pull requests.