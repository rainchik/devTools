# !/usr/bin/env python3.6

import argparse
import paramiko

demo_list = [
    "host1",
    "host2",
    "host3"
]

parser = argparse.ArgumentParser()
parser.add_argument('--username', type=str, help='Username', required=True)
parser.add_argument('--keypath',type=str, help='Path to public key', required=True)
parser.add_argument('--instanslist',type=str, help='List of instances', required=True)
parser.add_argument('--command',type=str, help='Command ', required=True)

args = vars(parser.parse_args())

def ssh_connect(host,command):
    client = paramiko.SSHClient()
    client.set_missing_host_key_policy(paramiko.AutoAddPolicy())
    client.connect(hostname=host, port="22")
    stdin, stdout, stderr = client.exec_command(command)
    data = stdout.read() + stderr.read()
    print(data)
    client.close()




for i in demo_list:
    if args["command"] == "add":
        ssh_connect(demo_list[0],"adduser " + args["username"])

    if args["command"] == "del":
        ssh_connect(demo_list[0], "userdel " + args["username"])