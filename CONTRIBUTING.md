# Guidelines for Contributing

## GitHub
- Issues and pull requests are welcome on [GitHub](https://github.com/scottswezey/twilio_magic_values).
- Twilio doesn't currently provide magic numbers for other parts of their APIs. If there is something they add new, or a magic number they offer which is otherwise missing from this project, please open an issue or pull request.

## Code
- Please run `mix format` before committing.
- Please run `mix credo` before committing. Fix any issues in additional commits before creating a pull request.
- Ensure tests pass before committing. You will need to copy `config/test.secret.exs.sample` to `config/test.secret.exs` and add your own [testing credentials](https://www.twilio.com/console/account/settings) from Twilio.
- Do not bump the version number in your pull requests.
- If your changes require the docs to be regenerated, please mention this in a pull request or issue.