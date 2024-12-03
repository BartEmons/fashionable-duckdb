# Instructions to run 

NOTE: put csv file in seeds folder. Not best practice but easy setup.

```
git clone https://github.com/BartEmons/fashionable-duckdb
cd fashionable-duckdb
python3 -m venv venv
source venv/bin/activate
python3 -m pip install --upgrade pip
python3 -m pip install -r requirements.txt
source venv/bin/activate
dbt run 
```

# Analytics queries 