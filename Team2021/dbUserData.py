
class beanDBUser:

    def __init__(self):
        self.__NAME = ""  # DBテーブルの名前を入力
        self.__USER = ""  # Dbアクセスに使用するユーザ名を入力
        self.__PASSWORD = ""  # 上記ユーザのパスワードを入力
        self.__HOST = ""  # 上記ユーザのホスト(localhost)を入力

    def getName(self):
        return self.__NAME

    def getUser(self):
        return self.__USER

    def getPassword(self):
        return self.__PASSWORD

    def getHost(self):
        return self.__HOST
