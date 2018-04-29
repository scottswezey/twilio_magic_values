ExUnit.start()
require Logger

Logger.warn("""

==============================================================================
* WARNING!! Most of the tests in this project hit the actual Twilio test API!!
* Be cautious about running these tests too often.
* Test credentials must provided in `config/test.secret.exs`!
==============================================================================
""")
