/*
* Copyright (c) 2017 Daniel Foré (http://danielfore.com)
*
* This program is free software; you can redistribute it and/or
* modify it under the terms of the GNU General Public
* License as published by the Free Software Foundation; either
* version 2 of the License, or (at your option) any later version.
*
* This program is distributed in the hope that it will be useful,
* but WITHOUT ANY WARRANTY; without even the implied warranty of
* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
* General Public License for more details.
*
* You should have received a copy of the GNU General Public
* License along with this program; if not, write to the
* Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor,
* Boston, MA 02110-1301 USA
*/

public class MainWindow : Gtk.Window {
    public MainWindow (Gtk.Application application) {
        Object (application: application,
                icon_name: "com.github.danrabbit.lookbook",
                resizable: false,
                title: _("LookBook"),
                height_request: 600,
                width_request: 800);
    }

    construct {
        var actions = new Gtk.Grid ();
        var apps = new Gtk.Grid ();

        var stack = new Gtk.Stack ();
        stack.add_titled (actions, "actions", "Actions");
        stack.add_titled (apps, "apps", "Apps");

        var stack_sidebar = new Gtk.StackSidebar ();
        stack_sidebar.stack = stack;
        stack_sidebar.vexpand = true;

        var grid = new Gtk.Grid ();
        grid.add (stack_sidebar);
        grid.add (stack);

        add (grid);
        show_all ();
    }
}
