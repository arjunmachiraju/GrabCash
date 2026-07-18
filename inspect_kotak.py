from neo_api_client import NeoAPI

print("NeoAPI methods:\n")

methods = [m for m in dir(NeoAPI) if not m.startswith("_")]

for method in methods:
    print(method)