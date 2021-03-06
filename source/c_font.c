/*
 * $Id: c_font.c $
 */
/*
 * ooHG source code:
 * C font functions
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


#define _WIN32_IE      0x0500
#define HB_OS_WIN_USED
#define _WIN32_WINNT   0x0400
#include <shlobj.h>

#include <windows.h>
#include <commctrl.h>
#include "hbapi.h"
#include "oohg.h"

/*--------------------------------------------------------------------------------------------------------------------------------*/
HFONT PrepareFont( char *FontName, int FontSize, int Weight, int Italic, int Underline, int StrikeOut, int Escapement, int Charset, int Width, int Orientation, int Advanced )
{
   HDC hDC = GetDC( HWND_DESKTOP );
   int cyp = GetDeviceCaps( hDC, LOGPIXELSY );

   int nEscapement = Escapement;                             // Angle between the escapement vector and the x-axis
   int nOrientation;
   if( Advanced )
   {
      SetGraphicsMode( hDC, GM_ADVANCED );
      nOrientation = Orientation;                             // Angle between character's base line and the x-axis
   }
   else
   {
      SetGraphicsMode( hDC, GM_COMPATIBLE );
      nOrientation = Escapement;                              // Angle between character's base line and the x-axis
   }
   ReleaseDC( HWND_DESKTOP, hDC );

   int     nHeight           = 0 - ( FontSize * cyp ) / 72;
   int     nWidth            = Width;                         // Width of characters in the requested font
   int     nWeight           = Weight;                        // Bold
   DWORD   dwItalic          = (DWORD) Italic;
   DWORD   dwUnderline       = (DWORD) Underline;
   DWORD   dwStrikeOut       = (DWORD) StrikeOut;
   DWORD   dwCharSet         = (DWORD) Charset;
   DWORD   dwOutputPrecision = (DWORD) OUT_TT_PRECIS;
   DWORD   dwClipPrecision   = (DWORD) CLIP_DEFAULT_PRECIS;
   DWORD   dwQuality         = (DWORD) DEFAULT_QUALITY;
   DWORD   dwPitchAndFamily  = (DWORD) FF_DONTCARE;
   LPCTSTR lpszFace          = (LPCTSTR) FontName;

   return CreateFont( nHeight, nWidth, nEscapement, nOrientation, nWeight, dwItalic, dwUnderline, dwStrikeOut,
      dwCharSet, dwOutputPrecision, dwClipPrecision, dwQuality, dwPitchAndFamily, lpszFace );
}

/*--------------------------------------------------------------------------------------------------------------------------------*/
HB_FUNC( INITFONT )   // ( cFontName, nFontSize, lBold, lItalic, lUnderline, lStrikeout, nAngle, nCharset, nWidth, nOrientation, lAdvanced )
{
   int bold        = hb_parl( 3 ) ? FW_BOLD : FW_NORMAL;
   int italic      = hb_parl( 4 ) ? 1 : 0;
   int underline   = hb_parl( 5 ) ? 1 : 0;
   int strikeout   = hb_parl( 6 ) ? 1 : 0;
   int angle       = ( HB_ISNUM( 7 ) ? hb_parni( 7 ) : 0 );
   int charset     = ( HB_ISNUM( 8 ) ? hb_parni( 8 ) : DEFAULT_CHARSET );
   int width       = ( HB_ISNUM( 9 ) ? hb_parni( 9 ) : 0 );
   int orientation = ( HB_ISNUM( 10 ) ? hb_parni( 10 ) : 0 );
   int advanced    = hb_parl( 11 ) ? 1 : 0;

   HFONT font = PrepareFont( (char *) hb_parc( 1 ), hb_parni( 2 ), bold, italic, underline, strikeout, angle, charset, width, orientation, advanced );
   HB_RETNL( (LONG_PTR) font );
}

/*--------------------------------------------------------------------------------------------------------------------------------*/
HB_FUNC( _SETFONT )   // ( hWnd, cFontName, nFontSize, lBold, lItalic, lUnderline, lStrikeout, nAngle, nCharset, nWidth, nOrientation, lAdvanced )
{
   int bold        = hb_parl( 4 ) ? FW_BOLD : FW_NORMAL;
   int italic      = hb_parl( 5 ) ? 1 : 0;
   int underline   = hb_parl( 6 ) ? 1 : 0;
   int strikeout   = hb_parl( 7 ) ? 1 : 0;
   int angle       = ( HB_ISNUM( 8 ) ? hb_parni( 8 ) : 0 );
   int charset     = ( HB_ISNUM( 9 ) ? hb_parni( 9 ) : DEFAULT_CHARSET );
   int width       = ( HB_ISNUM( 10 ) ? hb_parni( 10 ) : 0 );
   int orientation = ( HB_ISNUM( 11 ) ? hb_parni( 11 ) : 0 );
   int advanced    = hb_parl( 12 ) ? 1 : 0;

   HFONT font = PrepareFont( (char *) hb_parc( 2 ), hb_parni( 3 ), bold, italic, underline, strikeout, angle, charset, width, orientation, advanced );
   SendMessage( HWNDparam( 1 ), (UINT) WM_SETFONT, (WPARAM) font, MAKELPARAM( TRUE, 0 ) );
   HB_RETNL( (LONG_PTR) font );
}

/*--------------------------------------------------------------------------------------------------------------------------------*/
HB_FUNC( GETSYSTEMFONT )   // No parameters
{
   LOGFONT lfDlgFont;
   NONCLIENTMETRICS ncm;
   OSVERSIONINFO osvi;
   CHAR *szFName;
   int iHeight;

   getwinver( &osvi );
   if( osvi.dwMajorVersion >= 5 )
   {
      ncm.cbSize = sizeof( ncm );

      SystemParametersInfo( SPI_GETNONCLIENTMETRICS, ncm.cbSize, &ncm, 0 );

      lfDlgFont = ncm.lfMessageFont;

      szFName = lfDlgFont.lfFaceName;
      iHeight = 21 + lfDlgFont.lfHeight;
   }
   else
   {
      szFName = "MS Sans Serif";
      iHeight = 21 + 8;
   }

   hb_reta( 2 );
   HB_STORC( szFName, -1, 1 );
   HB_STORNI( iHeight, -1, 2 );
}
