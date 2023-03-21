# MUV
An API that shows the user the Review\Rating of a movie

# Tool Used
1. Vapor
2. PostgresSQL
3. Postman

# Database Schema
<img width="869" alt="Screenshot%201444-08-29%20at%203 35 20%20PM" src="https://user-images.githubusercontent.com/97975853/226635920-01d87318-d6c4-4c8d-b7b2-23684d9cd730.png">

# REST API
The REST API to the example app is described below.

## Get list of Movies
### Request
    . GET/Movies
    . http://127.0.0.1:8080/Movies

### Response
    . [
    {
        "id": "37298027-9BE6-417A-9144-99B95C8F4D8F",
        "castname": "Lama,Ahamed,Sara",
        "yearm": 2022,
        "title": "Movie1",
        "avg_rate": 8.4499998092651367,
        "description": "Peter Parker was crucial in the evolution of Marvel comics because he was fallible and had recognizable human traits."
    }]
    
## Create a new Movie    
### Request
    . POST/Movies
    . http://127.0.0.1:8080/Movies

### Response
    . [
    {
        "id": "37298027-9BE6-417A-9144-99B95C8F4D8F",
        "castname": "Lama,Ahamed,Sara",
        "yearm": 2022,
        "title": "Movie1",
        "avg_rate": 8.4499998092651367,
        "description": "Peter Parker was crucial in the evolution of Marvel comics because he was fallible and had recognizable human traits."
    }]
    
## Ubdate a specific Movie    
### Request
    . PUT/Movies/id
    . http://127.0.0.1:8080/Movies/37298027-9BE6-417A-9144-99B95C8F4D8

### Response
    . [
    {
        "id": "37298027-9BE6-417A-9144-99B95C8F4D8F",
        "castname": "Lama,Ahamed,Sara",
        "yearm": 2022,
        "title": "Movie1",
        "avg_rate": 8.4499998092651367,
        "description": "Peter Parker was crucial in the evolution of Marvel comics because he was fallible and had recognizable human traits."
    }] 
    
## Delete a specific Movie    
### Request
    . DELETE/Movies/id
    . http://127.0.0.1:8080/Movies/37298027-9BE6-417A-9144-99B95C8F4D8

### Response
    . 204No Content 21 ms 88 B
 
    
