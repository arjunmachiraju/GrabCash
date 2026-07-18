from neo_api_client import NeoAPI
import inspect

print("=" * 70)
print("quotes")
print("=" * 70)

print(inspect.signature(NeoAPI.quotes))

print()

help(NeoAPI.quotes)