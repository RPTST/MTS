#!/usr/bin/env python3
"""
Demonstration example for GitHub Project at
https://github.com/IngoMeyer441/simple-term-menu

This code only works in python3. Install per your OS

    sudo pip3 install simple-term-menu

"""
import time
import subprocess
import os

from simple_term_menu import TerminalMenu

os.getcwd()
cwd = os.getcwd()

def main():
    main_menu_title = "  Main Menu\n"
    main_menu_items = ["Utils Menu", "Apps Menu", "Other Menu", "Quit"]
    main_menu_cursor = "> "
    main_menu_cursor_style = ("fg_red", "bold")
    main_menu_style = ("bg_red", "fg_yellow")
    main_menu_exit = False

    main_menu = TerminalMenu(
        menu_entries=main_menu_items,
        title=main_menu_title,
        menu_cursor=main_menu_cursor,
        menu_cursor_style=main_menu_cursor_style,
        menu_highlight_style=main_menu_style,
        cycle_cursor=True,
        clear_screen=True,
    )

    utils_menu_title = "  Utils Menu\n"
    utils_menu_items = ["Terminal Utils Install", "Volken Install", "Back to Main Menu"]
    utils_menu_back = False
    utils_menu = TerminalMenu(
        utils_menu_items,
        title=utils_menu_title,
        menu_cursor=main_menu_cursor,
        menu_cursor_style=main_menu_cursor_style,
        menu_highlight_style=main_menu_style,
        cycle_cursor=True,
        clear_screen=True,
    )

    apps_menu_title = "  Apps Menu\n"
    apps_menu_items = ["Fancy Shell Install 64-bit only", "test1 Install", "Back to Main Menu"]
    apps_menu_back = False
    apps_menu = TerminalMenu(
        apps_menu_items,
        title=apps_menu_title,
        menu_cursor=main_menu_cursor,
        menu_cursor_style=main_menu_cursor_style,
        menu_highlight_style=main_menu_style,
        cycle_cursor=True,
        clear_screen=True,
    )


    other_menu_title = "  Other Menu\n"
    other_menu_items = ["test1 Install", "test2 Install", "Back to Main Menu"]
    other_menu_back = False
    other_menu = TerminalMenu(
        other_menu_items,
        title=other_menu_title,
        menu_cursor=main_menu_cursor,
        menu_cursor_style=main_menu_cursor_style,
        menu_highlight_style=main_menu_style,
        cycle_cursor=True,
        clear_screen=True,
    )

    while not main_menu_exit:
        main_sel = main_menu.show()

        if main_sel == 0:
            while not utils_menu_back:
                utils_sel = utils_menu.show()
                if utils_sel == 0:
                    print("Terminal Utils Install Selected")
                    subprocess.run(['bash','utils.sh'])
                    time.sleep(5)
                elif utils_sel == 1:
                    print("Volken Install Selected")
                    subprocess.run(['bash','volken.sh'])
                    time.sleep(5)
                elif utils_sel == 2:
                    utils_menu_back = True
                    print("Back Selected")
            utils_menu_back = False
        elif main_sel == 1:
            while not apps_menu_back:
                apps_sel = apps_menu.show()
                if apps_sel == 0:
                    print("Fancy Shell Install Selected")
                    subprocess.run(['bash','fancy.sh'])
                    time.sleep(5)
                elif apps_sel == 1:
                    print("test1 Install Selected")
                    time.sleep(5)
                elif apps_sel == 2:
                    apps_menu_back = True
                    print("Back Selected")
            apps_menu_back = False
        elif main_sel == 2:
            while not other_menu_back:
                other_sel = other_menu.show()
                if other_sel == 0:
                    print("test1 Install Selected")
                    subprocess.run(['bash','test11.sh'])
                    time.sleep(5)
                elif other_sel == 1:
                    print("test2 Install Selected")
                    time.sleep(5)
                elif other_sel == 2:
                    other_menu_back = True
                    print("Back Selected")
            other_menu_back = False
        elif main_sel == 3:
            main_menu_exit = True
            print("Quit Selected")


if __name__ == "__main__":
    main()
