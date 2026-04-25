import sys
from pathlib import Path

from PySide6.QtCore import QObject, Signal, Property, Qt
from PySide6.QtGui import QGuiApplication
from PySide6.QtQml import QQmlApplicationEngine


class ThemeDetector(QObject):
    """Exposes the system dark/light theme to QML and tracks changes."""
    themeChanged = Signal()

    def __init__(self, app, parent=None):
        super().__init__(parent)
        self._app = app
        self._app.styleHints().colorSchemeChanged.connect(self._on_change)

    def _on_change(self):
        self.themeChanged.emit()

    @Property(bool, notify=themeChanged)
    def systemIsDark(self):
        return self._app.styleHints().colorScheme() == Qt.ColorScheme.Dark


if __name__ == "__main__":
    app = QGuiApplication(sys.argv)
    engine = QQmlApplicationEngine()

    theme = ThemeDetector(app)
    engine.rootContext().setContextProperty("systemTheme", theme)

    engine.load(Path(__file__).parent / "markup" / "main.qml")
    if not engine.rootObjects():
        sys.exit(-1)
    sys.exit(app.exec())
