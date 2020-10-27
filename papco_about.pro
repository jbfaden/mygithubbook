pro papco_about_event, event
   widget_control, event.id, get_uvalue=uval
   if ( uval eq 'quit' ) then begin
   	 widget_control, event.top, /destroy
   endif
end

pro papco_about, event
  ; ysize=250
  ; xsize=300
  ; base= widget_base( title='About Papco', xsize=xsize, ysize=ysize  )
  ; xx= 10

   release= papco_version( /release_tag )

   os= !version.os
   if ( os eq 'Win32' ) then begin
       if ( papco_is_windows_xp() ) then begin
          os= os + '(Windows XP)'
       endif else begin
          os= os + '(not Windows XP)'
       endelse
   endif

   if ( not papco_wget_exe_check( version=wgetVers ) ) then begin
      wgetVers= 'no wget'
   endif

   text= [ 'PAPCO version 12', '', $
    'PAPCO is a free IDL package to combine graphical data products', $
    'from a variety of data sources through software modules.',$
    'It is written and maintained by Jeremy Faden and ', $
    'Reiner Friedel.', $
    '','For more information, check the papco home page at', $
    'http://www.papco.org', $
    'for online Manual and downloadble latest version.', $
    '','Comments and questions can be directed to', $
    'faden@cottagesystems.com and rfriedel@lanl.gov, or', $
    'papco@googlegroups.com', '', $
        'papco_base:', $
        '  '+getenv('PAPCO_BASE'), $
   	'release: '+release, $
   	'IDL release: '+!version.release, $
   	'operating system: '+os, $
        'os_family: '+!version.os_family, $
   	'wget version: '+wgetVers ]

   ;x= widget_text( base, value=text, /align_left, yoffset=3, xoffset=3, ysize=10, xsize=45 );


   ;x= widget_button( base, value='Okay', uvalue='quit', yoffset= ysize-30, xoffset=xsize-60, xsize=50, ysize=25 )

   x= widget_message( text, /info )

   ;widget_control, base, /realize
   ;xmanager, 'papco_about', base
end
