import random
import json
import datetime
import sys

CONTINENTS = {
    'North America': [
        'New York City, NY',
        'San Francisco, CA',
        'Austin, TX',
        'Montreal, Quebec'
    ],
    'South America': [
        'Sao Paulo, Brazil',
        'Lima, Peru', 
        'Bogota, Colombia',
        'Rio de Janeiro, Brazil'
    ],
    'Europe': [
        'London, England',
        'Berlin, Germany',
        'Madrid, Spain',
        'Rome, Italy'
    ],
    'Asia': [
        'Shanghai, China',
        'Delhi, India',
        'Tokyo, Japan',
        'Seoul, South Korea'
    ],
    'Australia': [
        'Sydney, New South Wales',
        'Melbourne, Victoria',
        'Brisbane, Queensland',
        'Perth, Western Australia'
    ],
    'Africa': [
        'Cairo, Egypt',
        'Johannesburg, South Africa',
        'Nairobi, Kenya',
        'Casablanca, Morocco'
    ]
}

SEASONS = {
    'Winter': [1, 2, 3],
    'Spring': [4, 5, 6],
    'Summer': [7, 8, 9],
    'Fall': [10, 11, 12]
}

TOPICS = [
    'Python'
    'C#',
    'TypeScript',
    'Swift',
    'Kotlin',
    'Java',
    'Dart',
    'Go',
    'SQL',
    'Rust'
]

def generate_conference():
    continent = random.choice(list(CONTINENTS.keys()))
    location = random.choice(CONTINENTS[continent])
    topic = random.choice(TOPICS)
    season = random.choice(list(SEASONS.keys()))
    month = random.choice(SEASONS[season])
    date = datetime.datetime(
        random.randint(2021, 2025),
        month,
        random.randint(1, 28),
        0, 0, 0
    )
    ticket_cost = random.randint(4, 41) * 25 # $100-$1000

    return {
        "name": f"{season} {continent} {topic} Conference",
        "date": date.isoformat(),
        "location": location,
        "ticket_cost": ticket_cost
    }

if __name__ == '__main__':
    no_of_conferences = 10

    if len(sys.argv) > 1:
        no_of_conferences = int(sys.argv[1])
    
    f = open('conferences.json', 'w')
    f.write(json.dumps([generate_conference() for _ in range(no_of_conferences)]))
    f.close()

