from broker.kotak_broker import KotakBroker

broker = KotakBroker()

print("\nAvailable methods:\n")

methods = dir(broker.client)

for method in sorted(methods):
    if not method.startswith("_"):
        print(method)