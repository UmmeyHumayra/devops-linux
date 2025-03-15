# jq 
jq allows to filter, extract, transform, and format JSON (JavaScript Object Notation) data with ease. 

## Learning Goal
* Parse and extract specific data from JSON file
* Filter and transform JSON data using `jq`
* Format and prettify JSON output

## Installing jq
```
sudo apt-get update
sudo apt-get install jq
```
## Using jq for JSON parsing
Create a file name `data.json` containing the following: 
```
{
    "company": {
        "name": "Poridhi",
        "address": {
            "street": "123 Tech Lane", 
            "city": "Dhaka",
            "state": "Dhaka",
            "postal_code": "1200"
        }, 
        "employees": [
            {
                "id": 1, 
                "name": "emp1", 
                "position": "Junior Software Engineer", 
                "contact": {
                    "email": "emp1@poridhi.com", 
                    "phone": "01234563020"
                }
            }, 
            {
                "id": 2, 
                "name": "emp2", 
                "position": "Data Scientist", 
                "contact": {
                    "email": "emp2@poridhi.com", 
                    "phone": "01234563121"
                }
            }
        ]
    }
}
```
## Task 1: Extracting Specific Fields
Extract the company name: 
```
cat data.json | jq '.company.name'
```
The `.company.name` filter selects and returns the value of the `name` field inside the `company` object. Without `jq` you would need to manually search through the JSON file or use complex `grep` and `awk` commands, making it harder to extract structured data.
few more examples: 
```
ummey@linux-for-devops % cat data.json| jq '.company.address'          
{
  "street": "123 Tech Lane",
  "city": "Dhaka",
  "state": "Dhaka",
  "postal_code": "1200"
}
```
```
ummey@linux-for-devops % cat data.json| jq '.company.employees[0]'
{
  "id": 1,
  "name": "emp1",
  "position": "Junior Software Engineer",
  "contact": {
    "email": "emp1@poridhi.com",
    "phone": "01234563020"
  }
}
```
```
ummey@linux-for-devops % cat data.json| jq '.company.employees[1]'
{
  "id": 2,
  "name": "emp2",
  "position": "Data Scientist",
  "contact": {
    "email": "emp2@poridhi.com",
    "phone": "01234563121"
  }
}
```
```
ummey@linux-for-devops % cat data.json| jq '.company.employees[1].contact' 
{
  "email": "emp2@poridhi.com",
  "phone": "01234563121"
}
```
```
ummey@linux-for-devops % cat data.json| jq '.company.employees[1].contact.email'
"emp2@poridhi.com"
```
## Task 2: Listing All Employee Names
```
ummey@linux-for-devops % cat data.json| jq '.company.employees[].name'         
"emp1"
"emp2"

ummey@linux-for-devops % cat data.json| jq '.company.employees[].contact.email' 
"emp1@poridhi.com"
"emp2@poridhi.com"
```
```
ummey@linux-for-devops % cat data.json| jq '.company.employees[].contact'      
{
  "email": "emp1@poridhi.com",
  "phone": "01234563020"
}
{
  "email": "emp2@poridhi.com",
  "phone": "01234563121"
}
ummey@linux-for-devops % cat data.json| jq '.company.employees[].contact.phone'
"01234563020"
"01234563121"
```
## Task 3: Extracting Complete Employee Details
```
cat data.json | jq '.company.employees[]'
```
```
ummey@linux-for-devops % cat data.json | jq '.company.employees[]'
{
  "id": 1,
  "name": "emp1",
  "position": "Junior Software Engineer",
  "contact": {
    "email": "emp1@poridhi.com",
    "phone": "01234563020"
  }
}
{
  "id": 2,
  "name": "emp2",
  "position": "Data Scientist",
  "contact": {
    "email": "emp2@poridhi.com",
    "phone": "01234563121"
  }
}
```
## Task 4: Extracting Employee Contact Information
```
cat data.json | jq '.company.employees[].contact'
```
```
ummey@linux-for-devops % cat data.json | jq '.company.employees[].contact'
{
  "email": "emp1@poridhi.com",
  "phone": "01234563020"
}
{
  "email": "emp2@poridhi.com",
  "phone": "01234563121"
}
```
## Task 5: Formatting JSON Output
To pretty-print JSON: 
```
cat data1.json| jq '.'
```
```
ummey@linux-for-devops % cat data1.json 
{"company": {"name": "Poridhi","address": {"street": "123 Tech Lane","city": "Dhaka","state": "Dhaka","postal_code": "1200"},"employees": [{"id": 1,"name": "emp1","position": "Junior Software Engineer","contact": {"email": "emp1@poridhi.com","phone": "01234563020"}},{"id": 2,"name": "emp2","position": "Data Scientist","contact": {"email": "emp2@poridhi.com","phone": "01234563121"}}]}}%                                                    
ummey@linux-for-devops % cat data1.json| jq '.'
{
  "company": {
    "name": "Poridhi",
    "address": {
      "street": "123 Tech Lane",
      "city": "Dhaka",
      "state": "Dhaka",
      "postal_code": "1200"
    },
    "employees": [
      {
        "id": 1,
        "name": "emp1",
        "position": "Junior Software Engineer",
        "contact": {
          "email": "emp1@poridhi.com",
          "phone": "01234563020"
        }
      },
      {
        "id": 2,
        "name": "emp2",
        "position": "Data Scientist",
        "contact": {
          "email": "emp2@poridhi.com",
          "phone": "01234563121"
        }
      }
    ]
  }
}
ummey@linux-for-devops %
```
Without `jq` JSON would be displayed as a single unformatted line, making it difficult to read. 
## Task 6: Filtering Data
Finding employees with a specific position (e.g., Junior Software Engineer): 
```
cat data.json | jq '.company.employees[] | select(.position == "Junior Software Engineer")'
```
```
ummey@linux-for-devops % cat data.json | jq '.company.employees[] | select(.position=="Junior Software Engineer")'
{
  "id": 1,
  "name": "emp1",
  "position": "Junior Software Engineer",
  "contact": {
    "email": "emp1@poridhi.com",
    "phone": "01234563020"
  }
}
```