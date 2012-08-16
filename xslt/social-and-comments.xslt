<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"> 

   <!-- This is template purely for testing against Cascade Index Blocks -->
    <xsl:template match="system-index-block">
        <xsl:call-template name="addthis">
           <xsl:with-param name="page" select="calling-page/system-page"></xsl:with-param>
        </xsl:call-template>
        <xsl:call-template name="disqus">
           <xsl:with-param name="page" select="calling-page/system-page"></xsl:with-param>
        </xsl:call-template>
        
    </xsl:template>
    
    <!-- Creating the AddThis code from the page's metadata -->
    <xsl:template name="addthis">
       <xsl:with-param name="page"></xsl:with-param>
        <div class="addthis_toolbox addthis_default_style addthis_32x32_style">
            <a class="addthis_button_facebook"></a>
            <a class="addthis_button_twitter"></a>
            <a class="addthis_button_preferred_3"></a>
            <a class="addthis_button_preferred_4"></a>
            <a class="addthis_button_compact"></a>
            <a class="addthis_counter addthis_bubble_style"></a>
        </div>
        <script type="text/javascript">
            // [cascade:cdata]
            // <xsl:comment><xsl:text>#START-CODE</xsl:text>
            <xsl:text disable-output-escaping="yes"><![CDATA[
                var addthis_config = {"data_track_addressbar":true};
                var addthis_share = {
                    title: ']]></xsl:text>
                 <xsl:value-of select="$page/display-name" />
            <xsl:text disable-output-escaping="yes"><![CDATA[',
                description: ']]></xsl:text>
             <xsl:value-of select="$page/summary" />
            <xsl:text disable-output-escaping="yes"><![CDATA['
                }
            ]]></xsl:text>
            // <xsl:text>#END-CODE</xsl:text></xsl:comment>
            // [/cascade:cdata]
        </script>
        <script type="text/javascript" src="http://s7.addthis.com/js/250/addthis_widget.js#pubid=ra-4d8a095f17af53f9"></script>
    </xsl:template>

    <!-- Creating Disqus code from page metadata -->
    <xsl:template name="disqus">
       <xsl:with-param name="page"></xsl:with-param>
       <div id="disqus_thread"></div>
        <script type="text/javascript">
            // [cascade:cdata]
            // <xsl:comment><xsl:text>#START-CODE</xsl:text>
                  
               <xsl:text disable-output-escaping="yes"><![CDATA[
                  var disqus_shortname = 'worldsahead';
                  var disqus_developer = 1;
                  ]]></xsl:text>

               <xsl:text disable-output-escaping="yes"><![CDATA[var disqus_title = ']]></xsl:text>
                  <xsl:value-of select="$page/display-name" />
                  <xsl:text disable-output-escaping="yes"><![CDATA[';
                     ]]></xsl:text>

               <xsl:text disable-output-escaping="yes"><![CDATA[var disqus_identifier = ']]></xsl:text>
                  <xsl:value-of select="$page/@id" />
                  <xsl:text disable-output-escaping="yes"><![CDATA[';
                     ]]></xsl:text>

                  <xsl:text disable-output-escaping="yes"><![CDATA[
                  (function() {
                     var dsq = document.createElement('script'); dsq.type = 'text/javascript'; dsq.async = true;
                     dsq.src = 'http://' + disqus_shortname + '.disqus.com/embed.js';
                     (document.getElementsByTagName('head')[0] || document.getElementsByTagName('body')[0]).appendChild(dsq);
                  })();
                  ]]>
                  </xsl:text>
            // <xsl:text>#END-CODE</xsl:text></xsl:comment>
            // [/cascade:cdata]
        </script>
        <noscript>Please enable JavaScript to view the <a href="http://disqus.com/?ref_noscript">comments powered by Disqus.</a></noscript>
        <a href="http://disqus.com" class="dsq-brlink">comments powered by <span class="logo-disqus">Disqus</span></a>
   </xsl:template>
   
</xsl:stylesheet>

