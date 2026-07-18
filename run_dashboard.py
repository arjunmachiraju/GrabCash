import sys

from PySide6.QtWidgets import QApplication

from broker.kotak_broker import KotakBroker
from ui.main_window import MainWindow
from ui.theme import APP_STYLE


def main():

    broker = KotakBroker()

    print()

    totp = input("Enter Google Authenticator Code : ").strip()

    totp = totp.replace(" ", "")

    if not broker.login(totp):

        print("\nLogin Failed")

        return

    app = QApplication(sys.argv)

    # Apply GrabCash Professional Theme
    app.setStyleSheet(APP_STYLE)

    window = MainWindow(broker)

    window.show()

    sys.exit(app.exec())


if __name__ == "__main__":
    main()