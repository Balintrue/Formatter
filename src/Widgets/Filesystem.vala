/*-
 * Copyright (c) 2017-2017 Kirill Romanov <djaler1@gmail.com>
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU Lesser General Public License as published by
 * the Free Software Foundation, either version 2 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 *
 * Authored by: Kirill Romanov <djaler1@gmail.com>
 */

namespace Formatter {
    public enum Filesystems {
        EXT4,
        FAT32,
        NTFS,
        EXFAT;

        public string get_name() {
            switch (this) {
                case EXT4:
                    return "ext4";

                case FAT32:
                    return "FAT32";

                case NTFS:
                    return "NTFS";

                case EXFAT:
                    return "exFAT";

                default:
                    assert_not_reached();
            }
        }

        public static Filesystems[] get_all() {
            return { FAT32, EXFAT, EXT4, NTFS };
        }
    }

    public class Filesystem : Gtk.FlowBoxChild  {
        Gtk.Grid content;
        Gtk.Label title;

        public Filesystems filesystem { get; private set; }

        construct {
            content = new Gtk.Grid ();
            content.row_spacing = 12;
            content.valign = Gtk.Align.CENTER;
            this.add (content);
        }

        public Filesystem (Filesystems filesystem) {
            this.filesystem = filesystem;

            title = new Gtk.Label (filesystem.get_name ());
            title.margin_top = 6;
            title.margin_bottom = 6;
            title.margin_right = 12;
            title.margin_left = 12;
            content.attach (title, 0, 0, 1, 1);
        }
    }
}
