# JSON Server

This is a quick back-up JSON server to serve the data so I can continue testing
the Flutter map API (rate limit hit! woops!) portion.

Thank you and major credit to tomorrow.io!

```
https://api.tomorrow.io/v4/weather/forecast?location=42.3478,-71.0466&apikey={INSERT_YOUR_API_KEY_HERE}
```

https://www.npmjs.com/package/json-server

Usage:
```
# Install NPM app
npm install json-server
# (or npm install work should work as well, since package.json is good-to-go.)

# Ensure db.json is available with the data you want to serve

# Start server:
json-server --watch db.json

# or:
npm start

# Browse / point your [curl/Flutter http request to:]
http://localhost:3000/customendpoint
```

# Misc notes:

Tomorrow.io weather codes:
https://docs.tomorrow.io/reference/data-layers-weather-codes