#!/usr/bin/env python3
from gi import require_version
require_version('Gtk', '4.0')
require_version('Nautilus', '4.0')

from gi.repository import Nautilus, GObject
import os, subprocess

PROCESS_NAMES = ['alacritty', 'code']
APP_NAMES = ['Alacritty', 'Code']

class AlacrittyExtension(Nautilus.MenuProvider, GObject.GObject):
    def __init__(self):
        pass

    def launch_alacritty(self, menu: Nautilus.MenuItem, files):
        path = ''
        args = '--working-directory'

        for file in files:
            file_path = file.get_location().get_path()
            if os.path.isdir(file_path) and os.path.exists(file_path):
                path = file_path

        if path == '':
            return

        subprocess.Popen([PROCESS_NAMES[0], args, path], shell=False)

    def launch_code(self, menu: Nautilus.MenuItem, files):
        paths = ''

        for file in files:
            file_path = file.get_location().get_path()
            paths += f'"{file_path}" '

        subprocess.Popen(f"{PROCESS_NAMES[1]} {paths}", shell=True)

    def get_file_items_menu(self, app_name, callback, files):
        item = Nautilus.MenuItem(
            name=f'{app_name}Open',
            label=f'Open in {app_name}',
            tip=f'Open in {app_name}'
        )
        item.connect('activate', callback, files)
        return item

    def get_background_items_menu(self, app_name, callback, files):
        item = Nautilus.MenuItem(
            name="AlacrittyOpenBackGround",
            label=f'Open in {APP_NAMES[0]}',
            tip=f'Open the current directory in {APP_NAMES[0]}'
        )
        item.connect('activate', self.launch_alacritty, files)
        return item

    def is_file(self, files):
        if(len(files) != 1):
            return False
        return not os.path.isdir(files[0].get_location().get_path())

    def is_directory(self, files):
        if(len(files) != 1):
            return False
        return os.path.isdir(files[0].get_location().get_path())

    def is_files(self, files):
        for file in files:
            file_path = file.get_location().get_path()
            if os.path.isdir(file_path):
                return False
        return True

    def is_directories(self, files):
        for file in files:
            file_path = file.get_location().get_path()
            if not os.path.isdir(file_path):
                return False
        return True

    def get_file_items(self, *args):
        files = args[-1]
        menus = []
        menus.append(self.get_file_items_menu(APP_NAMES[1], self.launch_code, files))
        if(self.is_directory(files)):
            menus.append(self.get_file_items_menu(APP_NAMES[0], self.launch_alacritty, files))
        return menus

    def get_background_items(self, *args):
        files = [args[-1]]
        menus = []
        menus.append(self.get_background_items_menu(APP_NAMES[1], self.launch_code, files))
        if(self.is_directory(files)):
            menus.append(self.get_background_items_menu(APP_NAMES[0], self.launch_alacritty, files))
        return menus