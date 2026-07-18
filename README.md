# 🚀 GrabCash
### AI-Powered Trading Intelligence Platform for Indian Financial Markets

*"Open. Scan. Decide. Trade Smarter."*

---

## 📖 About GrabCash

Every trading day begins with the same challenge.

Traders spend hours switching between charts, indicators, broker terminals, and news feeds trying to answer one simple question:

> **"What should I trade today?"**

While modern trading platforms provide abundant market data and charting tools, they still rely heavily on the trader to interpret complex signals, identify opportunities, and make timely decisions.

**GrabCash was built to bridge this gap.**

GrabCash is an AI-powered desktop application that continuously scans the market, analyzes technical indicators, evaluates trend strength and momentum, measures trading risk, and presents the most promising opportunities in a clear and explainable manner.

Rather than replacing the trader, GrabCash acts as an intelligent decision-support assistant, helping traders focus on the opportunities that matter most.

---

# 🎯 Our Mission

Our mission is simple:

> **Help traders make faster, smarter, and more disciplined trading decisions through explainable AI and intelligent market analysis.**

GrabCash combines proven technical analysis techniques with modern software engineering to reduce information overload and improve trading confidence.

---

# ❓ Why We Built GrabCash

Most trading platforms answer the question:

> **"What is happening in the market?"**

GrabCash answers a different question:

> **"What is the best trading opportunity available right now?"**

Instead of manually monitoring multiple charts, traders receive:

- AI-assisted trade recommendations
- Confidence scores
- Opportunity rankings
- Risk assessment
- Suggested entries and exits
- Transparent reasoning behind each recommendation

The objective is not to automate trading, but to help traders make informed decisions with greater confidence.

---

# ✨ Features

## 📊 Market Intelligence

- Live Market Scanner
- Multi-Symbol Analysis
- Opportunity Ranking
- Automatic Market Refresh
- Instrument Database
- Dynamic Symbol Management

---

## 📈 Technical Analysis

GrabCash currently evaluates multiple technical indicators including:

- Exponential Moving Averages (EMA)
- Average Directional Index (ADX)
- Relative Strength Index (RSI)
- Average True Range (ATR)
- VWAP
- Volume Analysis
- Trend Detection

These indicators work together to identify high-quality trading opportunities.

---

## 🤖 AI-Assisted Recommendation Engine

The Recommendation Engine combines multiple technical signals into a single explainable trading recommendation.

Each recommendation includes:

- BUY / SELL / WAIT
- Confidence Score
- Opportunity Score
- Trend Direction
- Suggested Entry Price
- Stop Loss
- Target Price

Unlike traditional trading software, GrabCash explains **why** a recommendation has been generated.

---

# 📦 Supported Markets

Current implementation supports:

- MCX Commodities
- NSE Indices
- NSE Equities (Foundation)
- BSE Equities (Foundation)

The architecture is designed to support additional exchanges and brokers with minimal changes.

---

# 🏗️ System Architecture

GrabCash has been designed using a modular layered architecture.

```
main.py
        │
        ▼
MainWindow
        │
        ▼
GrabCashTerminal
        │
        ▼
LiveMarketController
        │
        ▼
Market Layer
        │
        ▼
Indicator Engine
        │
        ▼
Trend Engine
        │
        ▼
Recommendation Engine
        │
        ▼
Trade Manager
        │
        ▼
Risk Engine
        │
        ▼
Scanner Engine
        │
        ▼
Desktop User Interface
```

Each component has a single responsibility, making the platform scalable, maintainable, and easy to extend.

---

# 💻 Technology Stack

- Python 3.12
- PySide6
- SQLite
- Dhan API
- Kotak Neo API (Execution Foundation)
- Object-Oriented Design
- Modular Architecture

---

# 📁 Project Structure

```
GrabCash/

├── ai/
├── analysis/
├── broker/
├── config/
├── core/
├── database/
├── indicators/
├── market/
├── models/
├── opportunity/
├── risk/
├── scanner/
├── services/
├── strategy/
├── trade/
├── ui/
├── utils/

├── main.py
├── GrabCash_Installer.bat
├── Run_GrabCash.bat
```

---

# ⚙️ System Requirements

- Windows 10 / Windows 11
- Python 3.12 or later
- Internet connection
- Dhan trading account (for live market data)

---

# 🚀 Getting Started

## First-Time Setup

Run:

```
GrabCash_Installer.bat
```

The installer automatically:

- Creates a Python virtual environment
- Installs all required dependencies
- Configures the application for first use

---

## Running GrabCash

After installation, simply double-click:

```
Run_GrabCash.bat
```

The launcher automatically:

- Verifies the project directory
- Checks the virtual environment
- Activates Python
- Launches GrabCash
- Displays clear guidance if setup is incomplete

No command-line knowledge is required.

---

# 🔄 Trading Workflow

```
Live Market Data
        │
        ▼
Market Scanner
        │
        ▼
Indicator Engine
        │
        ▼
Trend Analysis
        │
        ▼
Recommendation Engine
        │
        ▼
Risk Evaluation
        │
        ▼
Opportunity Ranking
        │
        ▼
Trade Recommendation
```

---

# 🛠️ Engineering Principles

GrabCash follows professional software engineering practices:

- Single Responsibility Principle
- Loose Coupling
- High Cohesion
- Layered Architecture
- Incremental Development
- Production-Safe Refactoring
- Backward Compatibility

Large components are enhanced through targeted method-level improvements, reducing regression risk while allowing continuous evolution of the platform.

---

# 🛣️ Roadmap

### Near-Term

- Enhanced Live Dashboard
- Market Filters (MCX / NSE / BSE)
- Advanced Opportunity Ranking
- Richer Trade Explanations
- Performance Improvements

### Future Vision

- Live WebSocket Market Data
- Portfolio Management
- Paper Trading
- Backtesting Engine
- Strategy Builder
- AI Market Summaries
- Machine Learning-Based Trade Scoring
- Multi-Broker Support
- Cloud Synchronization
- Mobile Companion Application

---

# 🤝 Contributing

Contributions, ideas, feature requests, and bug reports are welcome.

If you'd like to contribute:

1. Fork the repository
2. Create a feature branch
3. Commit your changes
4. Submit a Pull Request

---

# ⚠️ Disclaimer

GrabCash is an AI-assisted trading decision support platform.

It is intended for educational and analytical purposes only and does not constitute financial or investment advice.

All trading decisions remain the responsibility of the user.

---

# 🙏 Acknowledgements

GrabCash was created during **OpenAI Build Week** as an exploration of how AI can enhance trading workflows through explainable decision support.

The project architecture, product vision, engineering decisions, implementation, integration, and testing were led by the project creator. ChatGPT served as an AI engineering collaborator, assisting with software architecture, implementation guidance, code reviews, and technical documentation throughout development.

---

# 🌟 Looking Ahead

GrabCash is more than a trading application—it is the foundation of an intelligent trading ecosystem designed to evolve alongside traders and the markets they navigate.

As AI and financial technology continue to advance, GrabCash aims to provide transparent, explainable, and reliable decision support that empowers traders rather than replacing them.

**The journey has just begun.**
