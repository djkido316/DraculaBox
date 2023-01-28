#!/usr/bin/perl

# obmenu-generator - schema file

=for comment

    item:      add an item inside the menu               {item => ["command", "label", "icon"]},
    cat:       add a category inside the menu             {cat => ["name", "label", "icon"]},
    sep:       horizontal line separator                  {sep => undef}, {sep => "label"},
    pipe:      a pipe menu entry                         {pipe => ["command", "label", "icon"]},
    file:      include the content of an XML file        {file => "/path/to/file.xml"},
    raw:       any XML data supported by Openbox          {raw => q(...)},
    beg:       begin of a category                        {beg => ["name", "icon"]},
    end:       end of a category                          {end => undef},
    obgenmenu: generic menu settings                {obgenmenu => ["label", "icon"]},
    exit:      default "Exit" action                     {exit => ["label", "icon"]},

=cut

# NOTE:
#    * Keys and values are case sensitive. Keep all keys lowercase.
#    * ICON can be a either a direct path to an icon or a valid icon name
#    * Category names are case insensitive. (X-XFCE and x_xfce are equivalent)

require "$ENV{HOME}/.config/obmenu-generator/config.pl";

## Text editor
my $editor = $CONFIG->{editor};

our $SCHEMA = [

    #          COMMAND                 LABEL              ICON

{item => ['gmrun',             'Command',  'system-run']},
{sep},
{sep => undef},
{item => ['google-chrome-stable', 'Chrome',  'google-chrome']},
{sep},
{item => ['thunar',              'Files',           'nemo']},
{sep},
{item => ['st',                  'Terminal',     'utilities-terminal']},
{sep},       
{item => ['nitrogen',             'Nitrogen',  'applications-setting']},
{sep},       
{item => ['arandr',                  'Display',     'display']},
{sep},
{sep => undef},

{beg =>  ['Exit', 'system-shut-down']},
{sep},
{item => ["openbox --exit", 'Logout',   'gnome-logout']},
{sep},
{item => ["systemctl -i reboot",    'Reboot',          'un-reboot']},
{sep},
{item => ["systemctl -i poweroff",  'Shutdown',        'system-shut-down']},
{sep},
{end => undef},


]
