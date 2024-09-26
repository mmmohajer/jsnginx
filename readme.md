sudo nano /etc/hosts

fetch('https://api.example.com/data', {
method: 'POST', // Specify the HTTP method
headers: {
'Content-Type': 'application/json' // Important: specify the content type
},
body: JSON.stringify({
name: 'John Doe',
age: 30
}) // Send data as JSON string
})
.then(response => response.json())
.then(data => console.log(data))
.catch(error => console.error('Error:', error));
