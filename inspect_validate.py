from neo_api_client import NeoAPI
import inspect

print(inspect.signature(NeoAPI.totp_validate))

print()

print(inspect.getdoc(NeoAPI.totp_validate))