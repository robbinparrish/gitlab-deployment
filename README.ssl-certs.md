## SSL Certificate generation for GitLab server.

### Generate Private Key.
```bash
openssl genrsa -out gitlab.mydomain.com.key 4096
```

### Generate CSR.
```bash
openssl req -new -key gitlab.mydomain.com.key -out gitlab.mydomain.com.csr
```

### Now use this CSR file to buy the SSL certificates from CA Or create self-signed.
```bash
openssl x509 -in  gitlab.mydomain.com.csr -out  gitlab.mydomain.com.crt -req -signkey  gitlab.mydomain.com.key -days 365
```

### Once done copy these certifcates to certs directory ( `configs/certs` ) before running container.

