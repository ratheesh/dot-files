# /usr/bin/env python
# Copyright (C) 2015  Ratheesh S<ratheeshreddy@gmail.com>

# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License
# as published by the Free Software Foundation; either version 2
# of the License, or (at your option) any later version.

# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.

# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA
# 02110-1301, USA.

import os

db_file = "/home/ratheesh/.fasd"


def fasd_clean():
    purged_items = 0

    try:
        f = open(db_file, "r+")
    except IOError:
        print 'ERROR: No File found: %s' % db_file
        exit(1)

    d = f.readlines()
    f.close()

    try:
        f = open(db_file, "w+")
    except IOError:
        print 'ERROR: No File found: %s' % db_file
        exit(1)

    print "Cleaning fasd database ..."
    for i in d:
        path, sep, misc = i.partition('|')
        if os.path.exists(path):
            f.write(i)
        else:
            print 'Removing %s' % path
            purged_items += 1       # increment purged items
            f.close()

    if purged_items == 0:
        print "fasd database is clean!"
    else:
        print "---------------------------------------"
        print "No. of Purged Items: %d" % purged_items

if __name__ == '__main__':
    fasd_clean()
# End of File
