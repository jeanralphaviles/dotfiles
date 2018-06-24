#!/usr/bin/env python3

import json
import subprocess
import sys
import time

i3_cmd = 'i3-msg -t get_tree'

deactivate_map = {
    'cinnamon-screen': [['cinnamon-screensaver-command', '--deactivate']],
    'xautolock': [['xautolock', '-disable'], ['xautolock', '-enable']]
}

def get_layout():
    get_tree = subprocess.Popen(i3_cmd.split(), stdout=subprocess.PIPE)
    stdout = get_tree.communicate()[0].decode('utf-8')
    try:
        tree = json.loads(stdout)
    except ValueError:
        tree = {}
    return tree

def any_fullscreen_window(node):
    if node['window']:
        return node['fullscreen_mode'] == 1
    return any(any_fullscreen_window(n) for n in node.get('nodes', ''))

def deactivate_blank():
    ps = subprocess.Popen(['ps', '-e', 'co', 'cmd'], stdout=subprocess.PIPE)
    stdout = ps.communicate()[0].decode('utf-8')
    running_processes = set(stdout.split('\n'))

    for process in deactivate_map:
        if process in running_processes:
            for cmd in deactivate_map[process]:
                subprocess.run(cmd)
                print(cmd)

if __name__ == '__main__':
    delay = int(sys.argv[-1])
    while True:
        if any_fullscreen_window(get_layout()):
            deactivate_blank()
        time.sleep(delay)
