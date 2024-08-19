########################################################
# Sample players blueprint of endpoints
# Remove this file if you are not using it in your project
########################################################
from flask import Blueprint, request, jsonify, make_response, current_app
import json
from backend.db_connection import db

players = Blueprint('players', __name__)
"""
# Get all tournament data for 
@customers.route('/players', methods=['GET'])
def get_customers():
    current_app.logger.info('customer_routes.py: GET /customers')
    cursor = db.get_db().cursor()
    cursor.execute('select id, company, last_name,\
        first_name, job_title, business_phone from customers')
    row_headers = [x[0] for x in cursor.description]
    json_data = []
    theData = cursor.fetchall()
    for row in theData:
        json_data.append(dict(zip(row_headers, row)))
    the_response = make_response(jsonify(json_data))
    the_response.status_code = 200
    the_response.mimetype = 'application/json'
    return the_response

@customers.route('/customers', methods=['PUT'])
def update_customer():
    current_app.logger.info('PUT /customers route')
    cust_info = request.json
    # current_app.logger.info(cust_info)
    cust_id = cust_info['id']
    first = cust_info['first_name']
    last = cust_info['last_name']
    company = cust_info['company']

    query = 'UPDATE customers SET first_name = %s, last_name = %s, company = %s where id = %s'
    data = (first, last, company, cust_id)
    cursor = db.get_db().cursor()
    r = cursor.execute(query, data)
    db.get_db().commit()
    return 'customer updated!'
"""
# Get tournament details for a player_id
@players.route('/players/<player_id>', methods=['GET'])
def get_player_tournament(player_id):
    current_app.logger.info('GET /players/<player_id> route')
    cursor = db.get_db().cursor()
    query = "SELECT tournaments.tournament_name\
             FROM players JOIN participation ON players.player_id = participation.player_id\
             JOIN tournaments ON participation.tournament_id = tournaments.tournament_id\
             WHERE players.player_id = " + str(player_id)
    cursor.execute(query)

    json_data = []
    theData = cursor.fetchall()
    the_response = make_response(theData)
    the_response.status_code = 200
    the_response.mimetype = 'application/json'
    return the_response