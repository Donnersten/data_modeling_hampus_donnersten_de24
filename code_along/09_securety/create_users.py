from connect_postgres import connect_postgres
from sqlalchemy import text
from read_sql import read_sql_file

create_user_sql = read_sql_file("create_user.sql")

#print(create_user_sql)

with connect_postgres().connect() as conn:
    conn.execute(text(create_user_sql))
    
    conn.commit()
