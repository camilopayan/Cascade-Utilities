<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" exclude-result-prefixes="fiu" version="1.0" xmlns:fiu="fiu" xmlns:xalan="http://xml.apache.org/xalan">
  
  <!--
  ICal Data URI Creator for Cascade.
  
  Written by: Camilo Payan
  
  Create an ical data uri for links.
  
  Params (all strings):
    -name
      Name of the event
    -start
      Start date. Expects the form of "MM-DD-YYYY" because that's what comes 
      from the Calendar chooser in Cascade Data Definitions.
    -end
      End date. Expects the form of "MM-DD-YYYY" because that's what comes 
      from the Calendar chooser in Cascade Data Definitions.
    -email
      Email address of sender.
    -organizer
      Organizer name
    -description
      Description of the event.
    -domain
      Domain for the uuid
    -id
      Cascade Page ID or some other unique identifier.
  
  Usage:
    Import statement:
    <xsl:import href="site://Path/To/Formats/ical-data-uri-creator.xslt" />
    Where XPath is used:
      <xsl:value-of select="fiu:createICalURI([...])" />
    Inline
      <a href="{fiu:createICalURI([...])}">Example</a>
  -->
        <xalan:component functions="createICalURI pad" prefix="fiu">
            <xalan:script lang="javascript">
                function pad(n){ 
                    return (n&lt;10) ? "0"+n : n;
                }

                function createICalURI(name, start, end, email, organizer, description, domain, id){

                    Date.prototype.toICalString = function(){
                      return this.getUTCFullYear() +
                        pad( this.getUTCMonth() + 1 ) +
                        pad( this.getUTCDate() ) +
                        'T' + pad( this.getUTCHours() ) +
                        pad( this.getUTCMinutes() ) +
                        pad( this.getUTCSeconds() ) +
                        'Z';
                    };                
                
                    dtstamp = new Date();
                    
                    //For some reason, the dates weren't being recognized and
                    //turned into proper Date objects, so here's a workaround, 
                    //splitting the dates on the dashes, and using another Date
                    //constructor.
                    dtsarr = start.split('-');
                    dtearr = end.split('-');                    
                    dtstart = new Date(dtsarr[2], dtsarr[1], dtsarr[0]);
                    dtend = new Date(dtearr[2], dtearr[1], dtearr[0]);
                    uuid = dtstart.toICalString() + "-" + dtend.toICalString() + "-" + id + "@" + domain;

                    //Start the ical
                    var icalsample = "BEGIN:VCALENDAR\r\n"+
                    "VERSION:2.0\r\n"+
                    "PRODID:-\/\/mycompany.com\/myproduct\/\/NONSGML v1.0\/\/EN\r\n"+
                    "BEGIN:VEVENT\r\n"+
                    "UID:" + uuid + "\r\n"+
                    "DTSTAMP:" + dtstamp.toICalString() + "\r\n"+
                    "ORGANIZER;CN=" + organizer + ":mailto:" + email + "\r\n"+
                    "DTSTART:" + dtstart.toICalString() + "\r\n"+
                    "DTEND:" + dtend.toICalString() + "\r\n"+
                    "SUMMARY:" + name + "\r\n"+
                    "DESCRIPTION:" + description + "\r\n"+
                    "END:VEVENT\r\n"+
                    "END:VCALENDAR\r\n";
                    
                    var uriContent = "data:text/calendar," + encodeURIComponent(icalsample);
                    return uriContent;
                }
            </xalan:script>
        </xalan:component>

    </xsl:stylesheet>
