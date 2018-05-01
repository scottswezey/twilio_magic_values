ExUnit.start()
require Logger

Logger.warn("""

==============================================================================
* WARNING!! Most of the tests in this project hit the LIVE Twilio test API!!
* Be cautious about running these tests too often.
* YOUR test credentials must provided in `config/test.secret.exs`!
==============================================================================
""")
