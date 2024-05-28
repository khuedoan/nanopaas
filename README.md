# NanoPaaS

Self-hosting your own code shouldn't be complicated if you don't need advanced features.

You've developed a small application and now you want to share it with the world.
You have a Linux machine with Docker installed. What's next?

## Server requirements

- A server with public IP (most cloud providers offer a free tier with a small server)
- A domain pointed to that IP (see below if you just need a free one for development)
- SSH access
- Software: `git`, `docker`
- Firewall ports:

| Port | Protocol | Description |
| ---- | -------- | ----------- |
| 22   | TCP      | SSH         |
| 80   | TCP      | HTTP        |
| 443  | TCP      | HTTPS       |

## Application requirements

- Written in one of the supported languages: Go, Java, Node.js, PHP, Python, Ruby, Scala

## Usage

1. Fork this repository (optional but recommended) and clone it to your server:

```sh
git clone git@github.com/<MY_USERNAME>/nanopaas
cd nanopaas
```

2. Initialize your first project:

```sh
#           name            branch
./create.sh example-service master
```

3. Add the service to the compose file (an entry for `example-service` is already present, you just need to update the domain and port):

```sh
vim compose.yaml
```

4. Go back to you application repo and add the server to your git remote:

```sh
git remote add deploy git@<MY_SERVER>:</path/to/micropaas/data/source/example-service>
```

5. Deploy!

```sh
git push deploy
```

Wanna deploy another app? Just repeat steps 2 to 5 :)

## Backup

You can use `rsync` to copy the entire `./data` directory to another server or your local machine, and you should be good to go.
You should also create a cron job on your server to perform this task periodically.

## FAQ

**What's the catch?**

If you need advanced features such as high availability, more automation, or canary deployment, you'll need a bigger gun (e.g., Kubernetes).

**Where can I get a free domain?**

[duckdns.org](https://www.duckdns.org), [nip.io](https://nip.io), [sslip.io](https://sslip.io), etc.
