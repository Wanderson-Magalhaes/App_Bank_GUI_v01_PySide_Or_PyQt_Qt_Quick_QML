# This Python file uses the following encoding: utf-8
from PySide2.QtGui import QGuiApplication
from PySide2.QtQml import QQmlApplicationEngine
from PySide2.QtCore import QObject, Slot, Signal, QTimer, QUrl

class MainWindow(QObject):
    def __init__(self):
        QObject.__init__(self)
        pass
