import mysql.connector

mydb = mysql.connector.connect(
    host="localhost",
    user="root",
    password="",
    database="hr"
)

mycursor = mydb.cursor()

mydb1 = mysql.connector.connect(
    host="localhost",
    user="root",
    password=""
)
mycursor1 = mydb1.cursor()

mycursor1.execute("CREATE DATABASE Sherif")


mycursor.execute("SELECT * FROM information_schema.columns WHERE table_schema = 'hr'")

myresult = mycursor.fetchall()
temp = []
i = 0;
temp
for x in myresult:
  temp.append(x[2])
temp = list(set(temp))
for s in temp:
    print("*********")
    print(s)

    mycursor.execute("select * from information_schema.columns where table_schema = 'hr' and table_name = %s", [s])
    Test = mycursor.fetchall()
    print(Test)
    counter=0
    for i in Test:
        print(i[3])
        if(counter==0):
            sql1="CREATE TABLE " +s+"("+i[3]+" "+i[15]+") "
            mycursor1.execute(sql1)
            counter=counter+1

        else:
            query = "ALTER TABLE "+s+" \
                    ADD "+i[3]+" "+i[15]+""
            mycursor1.execute(query)














