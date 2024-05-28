# NanoPaaS

Hosting your own code shouldn't be complicated.

You've developed a small application and now you want to share it with the world.
You have a Linux machine with Docker installed. What's next?

## Server requirements

- Public IP
- A domain pointed to that IP.
- Software: `git`, `docker`
- Firewall ports:

| Port | Protocol | Description |
| ---- | -------- | ----------- |
| 22   | TCP      | SSH         |
| 80   | TCP      | HTTP        |
| 443  | TCP      | HTTPS       |

## Application requirements

- A `Dockerfile` to build your app

## Usage

Fork this repository (optional but recommended) and clone it to your server:

```sh
git clone git@github.com/<MY_USERNAME>/nanopaas
cd nanopaas
```

Initialize your first project:

```sh
./create.sh example-service master
```

Add the service to the compose file (an entry for `example-service` is already present, you just need to update the domain and port):

```sh
vim compose.yaml
```

Add the server to your git remote:

```sh
git remote add deploy git@<MY_SERVER>:</path/to/micropaas/data/source/example-service>
```

Deploy!

```sh
git push deploy
```

## Backup

You can use `rsync` to copy the entire `./data` directory to another server or your local machine, and you should be good to go.
You should also create a cron job on your server to perform this task periodically.

## Trade-offs

It's so simple that it should be sufficient for any hobby project.
However, if you need high availability, more automation, etc., you'll need a bigger gun (e.g. Kubernetes).
