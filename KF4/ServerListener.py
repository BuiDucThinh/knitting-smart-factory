# This Python file uses the following encoding: utf-8
import pymysql

class ServerListener:
    'Class for receiving data from iot machines, devices and update to database'

    def __init__(self):
        self.connectToDtb()
        pass

    def connectToDtb():
        nonlocal connection
        nonlocal cursor
        connection= pymysql.connect(host='localhost', user='root', password='thinh', database='mydb', cursorclass=pymysql.cursors.DictCursor)
        cursor = connection.cursor()

    def insertKnittingMachine(_id, _name, _ip, _states, _minutesToCheck):
        sql = """INSERT INTO `mydb`.`Knitting Machine` (`id`, `name`, `ip`, `states`, `minutesToCheck`) VALUES ('%d', '%s', '%s', '%d', '%d')""" % (_id, _name, _ip, _states, _minutesToCheck)
        cursor.execute(sql)
        connection.commit()
