from flask import Flask, render_template, request, url_for, redirect
# MongoClient

# ObjectId


app = Flask(__name__)

# client

# db


@app.route('/')
def home():
    return render_template('home.html')

@app.route('/conferences')
@app.route('/conferences/<conference_id>')
def conferences(conference_id=None):
    if conference_id == None:
        conference_list = db.conferences.find({})
        return render_template('conferences.html', conference_list=conference_list)
    else:
        conference = db.conferences.find_one({'_id': conference_id})
        return render_template('conference.html', conference=conference)

@app.route('/register/<conference_id>', methods=['GET', 'POST'])
def register(conference_id=None):
    if request.method == 'GET':
        return render_template('register.html')
    else:
        conference = db.conferences.find_one({"_id": conference_id})

        first_name = request.form['first_name']
        last_name = request.form['last_name']
        premium = True if 'premium' in request.form else False

        # insert_one
        

        # update_one
        

        return redirect(url_for('conferences'))

@app.route('/registrations')
@app.route('/registrations/<registration_id>', methods=['GET', 'POST'])
def registrations(registration_id=None):
    if request.method == 'GET':
        if registration_id == None:
            tickets = db.registrations.find({})
            return render_template('tickets.html', tickets=tickets)
        else:
            ticket = db.registrations.find_one({'_id': ObjectId(registration_id)})
            return render_template('ticket.html', ticket=ticket)
    else:
        first_name = request.form['first_name']
        last_name = request.form['last_name']
        premium = True if 'premium' in request.form else False
        conference = request.form['conference']

         # replace_one

        

        return redirect(url_for('home'))

@app.route('/registrations/delete/<registration_id>')
def delete_registration(registration_id):
    
    # delete_one
    

    return redirect(url_for('registrations'))