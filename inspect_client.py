from broker.kotak_broker import KotakBroker

broker = KotakBroker()

totp = input("Google Authenticator Code : ").strip()

if broker.login(totp):

    print("\n" + "=" * 70)
    print("NeoAPI Client Methods")
    print("=" * 70)

    methods = sorted(
        m for m in dir(broker.client)
        if not m.startswith("_")
    )

    for method in methods:
        print(method)