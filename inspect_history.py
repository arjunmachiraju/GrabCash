from neo_api_client import NeoAPI
import inspect

print("=" * 70)
print("historical_data()")
print("=" * 70)

print(inspect.signature(NeoAPI.historical_data))

print("\n")

help(NeoAPI.historical_data)