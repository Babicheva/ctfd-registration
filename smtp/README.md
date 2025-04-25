### Install `msmtp`

```shell
$ sudo apt install -y msmtp
$ msmtp --version
msmtp version 1.8.16
```

### Set up `msmtp` configuration

```shell
cp ~/.msmtprc.example ~/.msmtprc
chmod 600 ~/.msmtprc
```

Redact passowrd.

### Test `msmtp`

```shell
echo -e "Subject: Test from hiplet msmtp client\n\nHello from msmtp!" | msmtp recipient@example.com
```
