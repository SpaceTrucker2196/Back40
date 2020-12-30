# Back40

[![Build Status](https://travis-ci.org/SpaceTrucker2196/Back40.svg?branch=main)](https://travis-ci.org/SpaceTrucker2196/Back40)

Swift API Backend built with Vapor and Fluent for Materials and Practices iOS Application.

To open project in x-code, go to the project directory and type:

vapor xcode -y

to run database migrations:
vapor run migrations


#Schema

Practice:

    {
        "id": "3E61A15D-56DA-4C7E-ABA5-D2B9563AA383",
        "timestamp": "2051-12-30T16:53:31Z",
        "notes": "\"apply compost to entire grow\"",
        "name": "Till Beds and Apply Compost",
        "laborEstimate": 0
    }

User:

    {
        "name": "Joe Brassic",
        "username": "joe",
        "id": "2B49AC43-2065-4816-B2EE-1BEA89ED7D63"
    } 
    
Amendment:

    {
        "applicationDate": "2020-12-29T16:56:41Z",
        "id": "EE1C4568-7CC7-4C62-BDE7-F277C031A488",
        "notes": "\"Mineralized Micronutrient\"",
        "material": "\"Azomite\"",
        "laborHours": 0,
        "timestamp": "2051-12-30T16:56:41Z",
        "name": "\"Azomite\"",
        "materialIndex": ""
    }
 
Grow:
 
    {
        "zip": "54222",
        "title": "\"Beets\"",
        "drivingDirections": "\"2nd Mailbox on the left\"",
        "propertyOwner": "\"Jim Briar\"",
        "cultivar": "\"Beta vulgaris\"",
        "expectedHarvestDate": "2051-12-30T16:57:54Z",
        "managerPhone": "\"405-444-4444\"",
        "city": "\"Farmville\"",
        "name": "\"Beet Field\"",
        "size": 1,
        "id": "E6F71313-9FC6-40BA-94A3-A38BF6BE2874",
        "propertyType": "\"lease\"",
        "growType": "\"Field\"",
        "plantedDate": "2051-12-30T16:57:54Z",
        "timestamp": "2051-12-30T16:57:54Z",
        "harvestDate": "2051-12-30T16:57:54Z",
        "county": "\"Swifton\"",
        "notes": "\"check irrigation each week\"",
        "locationName": "\"Briar Rabbit Farms\"",
        "manager": "\"Bob Green\"",
        "address": "\"N Highway 42",
        "propertyOwnerPhone": "\"404-555-5541\""
    }
    
Work:
    
    {
    "id": "0EF28478-3BD9-4154-A2F4-9C9705603E08",
    "notes": "\"Till with disc\"",
    "laborHours": 1,
    "practice": "\"No Till Culitivation\"",
    "timestamp": "2051-12-30T17:11:32Z",
    "name": "\"Till\"",
    "practiceIndex": "\"index\""
    }
   
Material: 
     
    {
    "notes": "\"Mineralized Micronutrients\"",
    "id": "3D02416A-1190-439E-A924-14B7B460288A",
    "name": "\"Azomite\""
    }


