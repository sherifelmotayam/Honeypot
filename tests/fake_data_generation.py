import mysql.connector
from aifc import Error

class DBConnection:
    __host = "localhost"
    __user = "root"
    __password = ""
    __database = ""

    def __init__(self, db_name):
        self.__database = db_name
        try:
            self.__conn = mysql.connector.connect(host=self.__host, user=self.__user, password=self.__password, database=self.__database)
            self.__cursor = self.__conn.cursor(buffered=True, dictionary=True)
        except Error as e:
            print(e)

    def get_conn(self):
        return self.__conn
    
    def get_cursor(self):
        return self.__cursor

class FakeDataGeneration:
    tablename = set()

    def __init__(self, db_name1, db_name2):
        self.db_name1 = db_name1
        self.db_name2 = db_name2
 
        self.db1 = DBConnection(db_name1)
        self.conn1 = self.db1.get_conn()
        self.cursor1 = self.db1.get_cursor()

        self.db2 = DBConnection(db_name2)
        self.conn2 = self.db2.get_conn()
        self.cursor2 = self.db2.get_cursor()


        result = self.get_table_feature()
        # print("Database tables features: ", result)
        self.get_tables_names(result)
        # self.create_db_tables()
        self.fab_data()

    def get_table_feature(self):
        readFromSql = "SELECT * FROM information_schema.columns WHERE table_schema = %s"
        self.cursor1.execute(readFromSql, (self.db_name1,))
        # result is a list each index is json
        result = self.cursor1.fetchall()
        self.conn1.commit()
        return result

    def get_tables_names(self, result):
        for item in result:
            self.tablename.add(item['TABLE_NAME'])
        # print("Database table names: ", self.tablename)    

    def create_db_tables(self):
        for i in self.tablename:
            sql = "create table " +  i + " like " + self.db_name1 + "." + i
            self.cursor2.execute(sql)
            self.conn2.commit() 


if __name__ == "__main__":
    #  send the db name to work on it
    db_name1 = "real_data_server"
    db_name2 = "new_data_server"
    fake = FakeDataGeneration(db_name1, db_name2)


