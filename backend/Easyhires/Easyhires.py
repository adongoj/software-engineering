from flask import Flask,jsonify,request
from flaskext.mysql import MySQL
from werkzeug.security import generate_password_hash,check_password_hash
import json
import collections
import hashlib
import gc
from flask_cors import CORS,cross_origin


app = Flask(__name__)
CORS(app)

mysql = MySQL()
# MySQL configurations
app.config['MYSQL_DATABASE_USER'] = 'root'
app.config['MYSQL_DATABASE_PASSWORD'] = ''
app.config['MYSQL_DATABASE_DB'] = 'easyhires'
app.config['MYSQL_DATABASE_HOST'] = 'localhost'
mysql.init_app(app)
conn = mysql.connect()
cursor = conn.cursor()

#return all posts from the posts table
@app.route('/allposts',methods = ['GET'])
@cross_origin(origin='*',headers=['Content-Type','Authorization'])
def all_posts():
    cursor.execute("""
            select post_id,username,phone_number,category,picture,price_range,bed,bath,size,description,title from posts
            """)
    rows = cursor.fetchall()

    JArray = []
    for row in rows:

        JArray2 = collections.OrderedDict()
        JArray2["id"]= row[0]
        JArray2["username"]= row[1]
        JArray2["phone_number"]= row[2]
        JArray2["category"]= row[3]
        JArray2["picture"]= row[4]
        JArray2["price_range"]= row[5]
        JArray2["bed"]= row[6]
        JArray2["bath"]= row[7]
        JArray2["size"]= row[8]
        JArray2["description"]= row[9]
        JArray2["title"]= row[10]

        JArray.append(JArray2)

    return jsonify(JArray)

gc.collect()

#return specific posts from the posts table
@app.route('/specificposts',methods= ['POST'])
def specific_posts():

    region_form = request.form['region_name']
    district_form = request.form['district_name']


    cursor.execute("""SELECT post_id,username,phone_number,category,price_range,region_name,district_name FROM posts  join regions on  regions.region_id = posts.region_id join districts on districts.district_id = posts.district_id  where regions.region_name = %s and district_name = %s""",(region_form,district_form))
    rows = cursor.fetchall()

    JArray = []
    for row in rows:

        JArray2 = collections.OrderedDict()
        JArray2["id"]= row[0]
        JArray2["username"]= row[1]
        JArray2["phone_number"]= row[2]
        JArray2["category"]= row[3]
        JArray2["price_range"]= row[4]
        JArray2["region_name"]= row[5]
        JArray2["district_name"]= row[6]
        JArray.append(JArray2)

    return jsonify(JArray)

gc.collect()

#user views own posts after logging in
@app.route('/userposts',methods=['GET','POST','PUT','DELETE'])
def userposts():
     username_form = request.form['username']

     cursor.execute("SELECT * from posts where username = %s",(username_form))
     rows = cursor.fetchall();

     JArray = []
     for row in rows:

        JArray2 = collections.OrderedDict()
        JArray2["id"]= row[0]
        JArray2["username"]= row[1]
        JArray2["phone_number"]= row[2]
        JArray2["category"]= row[3]
        JArray2["price_range"]= row[4]
        JArray2["region_name"]= row[5]
        JArray2["district_name"]= row[6]
        JArray.append(JArray2)

     return jsonify(JArray)
gc.collect()

#user delete posts
@app.route('/deleteposts',methods=['GET','POST','DELETE','ANY'])
def delposts():
    postid_form = request.form['post_id']

    if cursor.execute("delete from posts where post_id = %s",(postid_form)):
        conn.commit()
        return "post deleted successfully"
    else:
        return "couldn't delete post"

gc.collect()




#signup route
@app.route('/signup',methods= ['GET', 'POST', 'PATCH', 'PUT', 'DELETE'])
@cross_origin(origin='*',headers=['Content-Type','Authorization'])
def sign_up():
   username_form = request.json['username']
   email_form = request.json['email']
   password_form = generate_password_hash(request.json['password'])

   x = cursor.execute("""SELECT * from users where username = %s""",(username_form))
   if int(x) > 0:
          return "0"

   else:
          cursor.execute("""INSERT INTO  users (username,email,password) values (%s,%s,%s)""",(username_form,email_form,password_form)) # FETCH THE HASHED PASSWORD
          conn.commit()
          return "1"

gc.collect()

#login route
@app.route('/login',methods = ['GET','POST'])
def login():
   username_form = request.form['username']
   email_form = request.form['email']
   password_form = request.form['password']

   x = cursor.execute("""SELECT * from users where username = %s""",(username_form))
   x = cursor.fetchone()[2]
   if  check_password_hash(x,password_form):
       return "log in successful"
   else:
       return len(str(x))

gc.collect()




@app.route('/regiondistrict',methods= ['GET', 'POST', 'PATCH', 'PUT', 'DELETE'])
def region_district():


    cursor.execute("SELECT region_name,district_name FROM regions inner join districts on regions.region_id = districts.region_id order by region_name,district_name asc")
    rows = cursor.fetchall()

    JArray = []
    for row in rows:

        JArray2 = collections.OrderedDict()
        JArray2["region"]= row[0]
        JArray2["district"]= row[1]
        JArray.append(JArray2)

    return jsonify(JArray)

gc.collect()


@app.route('/newpost',methods = ['GET','POST'])
def newpost():
    username = request.form['username']
    phone_number = request.form['phone_number']
    category = request.form['category']
    picture = request.form['picture']
    price_range = request.form['price_range']
    bed = request.form['bed']
    bath = request.form['bath']
    sizer = request.form['size']
    description = request.form['description']
    title = request.form['title']
    region_name = request.form['region_name']
    district_name = request.form['district_name']


    if(cursor.execute("""INSERT into posts (username,phone_number,category,picture,price_range,bed,bath,size,description,title,region_id,district_id) values(%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,(select region_id from regions where region_name = %s),(select district_id from districts where district_name = %s))""",(username,phone_number,category,picture,price_range,bed,bath,sizer,description,title,region_name,district_name))):
        conn.commit()
        return "successfully inserted"
    else:
        return "insert falied"

gc.collect()


if __name__ == "__main__":
 app.run();










