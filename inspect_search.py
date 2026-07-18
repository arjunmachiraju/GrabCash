from neo_api_client import NeoAPI
import inspect

print("=" * 70)
print("search_scrip")
print("=" * 70)

try:
    print(inspect.signature(NeoAPI.search_scrip))
except Exception as e:
    print("Signature Error:", e)

print()

help(NeoAPI.search_scrip)