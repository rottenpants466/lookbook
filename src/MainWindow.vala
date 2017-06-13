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
                title: _("LookBook"),
                height_request: 600,
                width_request: 800);
    }

    construct {
        var address_book_new = new IconView ("address-book-new", "The icon used for the action to create a new address book.");

        var actions_view = new Gtk.Stack ();
        actions_view.add_titled (address_book_new, "address-book-new", "address-book-new");

        var actions_list = new Gtk.StackSidebar ();
        actions_list.stack = actions_view;
        actions_list.vexpand = true;
        actions_list.get_style_context ().remove_class ("sidebar");

        var actions = new Gtk.Grid ();
        actions.add (actions_list);
        actions.add (actions_view);

        var apps = new Gtk.Grid ();

        var categories = new Gtk.Stack ();
        categories.add_titled (actions, "actions", "Actions");
        categories.add_titled (apps, "apps", "Apps");

        var categories_sidebar = new Gtk.StackSidebar ();
        categories_sidebar.stack = categories;
        categories_sidebar.vexpand = true;

        var grid = new Gtk.Grid ();
        grid.add (categories_sidebar);
        grid.add (categories);

        add (grid);
        show_all ();
    }
}
