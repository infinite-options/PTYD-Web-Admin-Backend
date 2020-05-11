## Automate snapshot API calls

This directory contains files related to calling APIs that update snapshots of PTYD data automatically.

### `connect-to-ec2.sh`

On your local machine, run `./connect-to-ec2.sh` will let you `ssh` into the EC2 instance (a Linux virtual machine) on AWS. The automated script will run here.

You will need a key pair titled `ptyd-0510.pem` in this directory. Please retrieve this from an administrator on the team.

**NOTE**: Your `.pem` file permissions need to be set to read-only for the owner, and no permissions for anyone else. You can add these permissions with `chmod 400 <file>`.

### `auto.py`

This script will run in the background and check once an hour if a particular API needs to be called.

On Mondays from 00:00:00 to 00:59:59 GMT, the UpdatePurchases API from `api/api.py` will be called. This API checks for all meals selected for the most recent week of meals delivered, then updates each subscriber's number of weeks, renewal dates, and amounts due accordingly.

On Thursdays from 00:00:00 to 00:59:59 GMT, the ChargeSubscribers API from `api/api.py` will be called. This API checks for subscriptions to be renewed, charges each subscriber who renews, then updates their number of weeks and renewal dates.

### How to check if `auto.py` is running

1. Upon remotely logging into the EC2 instance, list all screens with `screen -ls`. You should see something like the following:
```
There is a screen on:
	21958.pts-0.ip-172-31-21-33	(Detached)
1 Socket in /var/run/screen/S-ec2-user.
```
If there are no screens running in the background, `auto.py` is not running.

2. Run `screen -r` to resume the running screen session and run `jobs`. You should see something like the following:
```
[ec2-user@ip-172-31-21-33 misc]$ jobs
[1]+  Running                 python3 auto.py &
```
You may also see multiple timestamps printed to the console with the occasional API calls. This is expected behavior of `auto.py` performing its hourly API check.

3. Press `Ctrl-A` then `Ctrl-D` to **detach** this screen while keeping the processes running. This is crucial, because it will let you log out of the remote box while the processes continue running.

### How to start/stop `auto.py` in the EC2's screen session

1. Upon remotely logging into the EC2 instance, resume the screen with `screen -r` (if a detached screen exists) or create a new screen session with `screen`.
2. Navigate to this directory and run `python3 auto.py`.
3. Press `Ctrl-Z` and run `bg` immediately. This will temporarily suspend `auto.py` and then continue running it in the background, allowing you to run shell commands while `auto.py` keeps running.
4. Press `Ctrl-A` then `Ctrl-D` to **detach** this screen while keeping the processes running.
5. To kill `auto.py`, either run `fg` then `Ctrl-C` to foreground and kill the running process, or simply `Ctrl-D` from the screen to exit the screen session.

## Other

### test.py

This is a script that calls snapshot APIs at will with an option to simulate what date it's being called. You can run `python3 test.py` on your local machine and then it will prompt you for a date parameter in the format of YYYYMMDD.

You'll see something like this:

```
--- Monday API ---
Enter date parameter (YYYYMMDD):
```

To simulate calling this API from say, May 11, 2020, type `20200511`. Make sure to type valid Monday dates and Thursday dates for the Monday/Thursday APIs respectively.
