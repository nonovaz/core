/*
 * $Id: i_richeditbox.ch $
 */
/*
 * ooHG source code:
 * Rich Editbox definitions
 *
 * Copyright 2005-2018 Vicente Guerra <vicente@guerra.com.mx>
 * https://oohg.github.io/
 *
 * Portions of this project are based upon Harbour MiniGUI library.
 * Copyright 2002-2005 Roberto Lopez <roblez@ciudad.com.ar>
 *
 * Portions of this project are based upon Harbour GUI framework for Win32.
 * Copyright 2001 Alexander S. Kresin <alex@belacy.belgorod.su>
 * Copyright 2001 Antonio Linares <alinares@fivetech.com>
 *
 * Portions of this project are based upon Harbour Project.
 * Copyright 1999-2018, https://harbour.github.io/
 */
/*
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2, or (at your option)
 * any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this software; see the file LICENSE.txt. If not, write to
 * the Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor,
 * Boston, MA 02110-1335,USA (or download from http://www.gnu.org/licenses/).
 *
 * As a special exception, the ooHG Project gives permission for
 * additional uses of the text contained in its release of ooHG.
 *
 * The exception is that, if you link the ooHG libraries with other
 * files to produce an executable, this does not by itself cause the
 * resulting executable to be covered by the GNU General Public License.
 * Your use of that executable is in no way restricted on account of
 * linking the ooHG library code into it.
 *
 * This exception does not however invalidate any other reasons why
 * the executable file might be covered by the GNU General Public License.
 *
 * This exception applies only to the code released by the ooHG
 * Project under the name ooHG. If you copy code from other
 * ooHG Project or Free Software Foundation releases into a copy of
 * ooHG, as the General Public License permits, the exception does
 * not apply to the code that you add in this way. To avoid misleading
 * anyone as to the status of such modified files, you must delete
 * this exception notice from them.
 *
 * If you write modifications of your own for ooHG, it is your choice
 * whether to permit this exception to apply to your modifications.
 * If you do not wish that, delete this exception notice.
 */


/*---------------------------------------------------------------------------
STANDARD VERSION
---------------------------------------------------------------------------*/
#xcommand @ <row>, <col> RICHEDITBOX <name> ;
      [ OBJ <obj> ] ;
      [ <dummy1: OF, PARENT> <parent> ] ;
      [ WIDTH <w> ] ;
      [ HEIGHT <h> ] ;
      [ FIELD <field> ] ;
      [ FILE <file> ] ;
      [ <plain: PLAINTEXT> ] ;
      [ FILETYPE <type> ] ;
      [ VALUE <value> ] ;
      [ <readonly: READONLY> ] ;
      [ FONT <f> ] ;
      [ SIZE <s> ] ;
      [ <bold: BOLD> ] ;
      [ <italic: ITALIC> ] ;
      [ <underline: UNDERLINE> ] ;
      [ <strikeout: STRIKEOUT> ] ;
      [ TOOLTIP <tooltip> ] ;
      [ BACKCOLOR <backcolor> ] ;
      [ FONTCOLOR <fontcolor> ] ;
      [ MAXLENGTH <maxlength> ] ;
      [ <dummy02: ONGOTFOCUS, ON GOTFOCUS> <gotfocus> ] ;
      [ <dummy03: ONCHANGE, ON CHANGE> <change> ] ;
      [ <dummy04: ONLOSTFOCUS, ON LOSTFOCUS> <lostfocus> ] ;
      [ <dummy05: ONSELECT, ON SELECT, ONSELCHANGE, ON SELCHANGE> <selchange> ] ;
      [ HELPID <helpid> ] ;
      [ <break: BREAK> ] ;
      [ <invisible: INVISIBLE> ] ;
      [ <notabstop: NOTABSTOP> ] ;
      [ <rtl: RTL> ] ;
      [ SUBCLASS <subclass> ] ;
      [ <disabled: DISABLED> ] ;
      [ <nohidesel: NOHIDESEL> ] ;
      [ FOCUSEDPOS <focusedpos> ] ;
      [ <novscroll: NOVSCROLL> ] ;
      [ <nohscroll: NOHSCROLL> ] ;
      [ <dummy06: ONVSCROLL, ON VSCROLL> <vscroll> ] ;
      [ <dummy07: ONHSCROLL, ON HSCROLL> <hscroll> ] ;
      [ INSERTTYPE <nInsType> ] ;
   => ;
      [ <obj> := ] _OOHG_SelectSubClass( TEditRich(), [ <subclass>() ] ): ;
            Define( <(name)>, <(parent)>, <col>, <row>, <w>, <h>, <value>, ;
            <f>, <s>, <tooltip>, <maxlength>, <{gotfocus}>, <{change}>, ;
            <{lostfocus}>, <.readonly.>, <.break.>, <helpid>, <.invisible.>, ;
            <.notabstop.>, <.bold.>, <.italic.>, <.underline.>, <.strikeout.>, ;
            <(field)>, <backcolor>, <.rtl.>, <.disabled.>, <{selchange}>, ;
            <fontcolor>, <.nohidesel.>, <focusedpos>, <.novscroll.>, ;
            <.nohscroll.>, <file>, iif( <.plain.>, 1, <type> ), <{hscroll}>, ;
            <{vscroll}>, <nInsType> )

/*---------------------------------------------------------------------------
SPLITBOX VERSION
---------------------------------------------------------------------------*/

#xcommand RICHEDITBOX <name> ;
      [ OBJ <obj> ] ;
      [ <dummy1: OF, PARENT> <parent> ] ;
      [ WIDTH <w> ] ;
      [ HEIGHT <h> ] ;
      [ FIELD <field> ] ;
      [ FILE <file> ] ;
      [ <plain: PLAINTEXT> ] ;
      [ FILETYPE <type> ] ;
      [ VALUE <value> ] ;
      [ <readonly: READONLY> ] ;
      [ FONT <f> ] ;
      [ SIZE <s> ] ;
      [ <bold: BOLD> ] ;
      [ <italic: ITALIC> ] ;
      [ <underline: UNDERLINE> ] ;
      [ <strikeout: STRIKEOUT> ] ;
      [ TOOLTIP <tooltip> ] ;
      [ BACKCOLOR <backcolor> ] ;
      [ FONTCOLOR <fontcolor> ] ;
      [ MAXLENGTH <maxlength> ] ;
      [ <dummy02: ONGOTFOCUS, ON GOTFOCUS> <gotfocus> ] ;
      [ <dummy03: ONCHANGE, ON CHANGE> <change> ] ;
      [ <dummy04: ONLOSTFOCUS, ON LOSTFOCUS> <lostfocus> ] ;
      [ <dummy05: ONSELECT, ON SELECT, ONSELCHANGE, ON SELCHANGE> <selchange> ] ;
      [ HELPID <helpid> ] ;
      [ <break: BREAK> ] ;
      [ <invisible: INVISIBLE> ] ;
      [ <notabstop: NOTABSTOP> ] ;
      [ <rtl: RTL> ] ;
      [ SUBCLASS <subclass> ] ;
      [ <disabled: DISABLED> ] ;
      [ <nohidesel: NOHIDESEL> ] ;
      [ FOCUSEDPOS <focusedpos> ] ;
      [ <novscroll: NOVSCROLL> ] ;
      [ <nohscroll: NOHSCROLL> ] ;
      [ <dummy06: ONVSCROLL, ON VSCROLL> <vscroll> ] ;
      [ <dummy07: ONHSCROLL, ON HSCROLL> <hscroll> ] ;
      [ INSERTTYPE <nInsType> ] ;
   => ;
      [ <obj> := ] _OOHG_SelectSubClass( TEditRich(), [ <subclass>() ] ): ;
            Define( <(name)>, <(parent)>, , , <w>, <h>, <value>, <f>, <s>, ;
            <tooltip>, <maxlength>, <{gotfocus}>, <{change}>, <{lostfocus}>, ;
            <.readonly.>, <.break.>, <helpid>, <.invisible.>, <.notabstop.>, ;
            <.bold.>, <.italic.>, <.underline.>, <.strikeout.>, <(field)>, ;
            <backcolor>, <.rtl.>, <.disabled.>, <{selchange}>, <fontcolor>, ;
            <.nohidesel.>, <focusedpos>, <.novscroll.>, <.nohscroll.>, <file>, ;
            iif( <.plain.>, 1, <type> ), <{hscroll}>, <{vscroll}>, <nInsType> )
