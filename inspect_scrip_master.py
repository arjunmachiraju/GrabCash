from neo_api_client import NeoAPI
import inspect

print("=" * 70)
print("scrip_master")
print("=" * 70)

print(inspect.signature(NeoAPI.scrip_master))

print()

help(NeoAPI.scrip_master)