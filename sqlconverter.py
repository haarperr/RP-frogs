# open mysql connection
import datetime
import math

import mysql.connector

old = mysql.connector.connect(
  host = "62.171.159.104",
  user = "root",
  password = "643gw6543vw",
  database = "gtav_rp3",
)

new = mysql.connector.connect(
  host = "62.171.159.104",
  user = "root",
  password = "643gw6543vw",
  database = "rpfrogs2",
)

# select characters from old
old_cursor = old.cursor()
new_cursor = new.cursor()



def transferCharacter():
    old_cursor.execute("SELECT * FROM characters")
    data = old_cursor.fetchall()


    for oC in data:
        x2 = {
            "id": oC[0],
            "hex": oC[1],
            "first_name": oC[2],
            "last_name": oC[3],
            "gender": 1,
            "dob": oC[5],
            "cash": oC[6],
            "bankid": oC[0],
            "paycheck": 0,
            "health": 100,
            "armour": 100,
            "hunger": 100,
            "thirst": 100,
            "stress": 0,
            "phone": oC[8],
            "job": "",
            "job2": "",
            "jail": 0,
            "first_time": oC[4],
            "last_time": datetime.datetime.now(),
            "deleted": 0,
            "new": 0,
            "hotel": 1,
            "licenses": "{}",
            "aliases": "",
            "bones": "{}",
            "dna": ""
        }

        columns = ', '.join("`" + str(x).replace('/', '_') + "`" for x in x2.keys())
        values = ', '.join("'" + str(x).replace('/', '_') + "'" for x in x2.values())
        sql = "INSERT INTO %s ( %s ) VALUES ( %s );" % ('characters', columns, values)
        try:
            new_cursor.execute(sql)
            new.commit()
        except:
            print(sql)

def transferBoost():
    old_cursor.execute("SELECT * FROM boost_levels")
    data = old_cursor.fetchall()
    for d in data:
        de = {
            "id": d[0],
            "level": d[1],
            "xp": d[2],
        }
        columns = ', '.join("`" + str(x).replace('/', '_') + "`" for x in de.keys())
        values = ', '.join("'" + str(x).replace('/', '_') + "'" for x in de.values())
        sql = "INSERT INTO %s ( %s ) VALUES ( %s );" % ('boost_levels', columns, values)
        try:
            new_cursor.execute(sql)
            new.commit()
        except:
            print(sql)

    old_cursor.execute("SELECT * FROM boost_queue")
    data = old_cursor.fetchall()
    for d in data:
        de = {
            "id": d[0],
            "pSrc": d[1],
        }
        columns = ', '.join("`" + str(x).replace('/', '_') + "`" for x in de.keys())
        values = ', '.join("'" + str(x).replace('/', '_') + "'" for x in de.values())
        sql = "INSERT INTO %s ( %s ) VALUES ( %s );" % ('boost_queue', columns, values)
        try:
            new_cursor.execute(sql)
            new.commit()
        except:
            print(sql)


# transferCharacter()
transferBoost()



