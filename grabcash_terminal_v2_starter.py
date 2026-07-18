"""
GrabCash Professional Trading Terminal v2.0 (Starter)

This is a fresh implementation scaffold intended to replace and modernize
the previous terminal incrementally.
"""

from PySide6.QtWidgets import (
    QWidget, QVBoxLayout, QHBoxLayout, QLabel,
    QListWidget, QTextEdit, QPushButton
)
from PySide6.QtCore import Qt, QTimer

try:
    from core.live_market_controller import LiveMarketController
except Exception:
    LiveMarketController = None


class GrabCashTerminal(QWidget):

    def __init__(self):
        super().__init__()

        self.controller = LiveMarketController() if LiveMarketController else None
        self.timer = QTimer(self)
        self.timer.timeout.connect(self.refresh_market)

        self.build_ui()

        self.timer.start(30000)

    def build_ui(self):
        self.setWindowTitle("GrabCash Professional Trading Terminal")

        root = QVBoxLayout(self)

        title = QLabel("GRABCASH TERMINAL")
        title.setAlignment(Qt.AlignCenter)
        root.addWidget(title)

        body = QHBoxLayout()
        root.addLayout(body)

        self.trade_list = QListWidget()
        body.addWidget(self.trade_list)

        self.trade_details = QTextEdit()
        self.trade_details.setReadOnly(True)
        body.addWidget(self.trade_details)

        buttons = QVBoxLayout()
        self.buy_button = QPushButton("BUY")
        self.sell_button = QPushButton("SELL")
        buttons.addWidget(self.buy_button)
        buttons.addWidget(self.sell_button)
        body.addLayout(buttons)

    def refresh_market(self):
        if not self.controller:
            return
        # TODO: integrate LiveMarketController pipeline
        pass
