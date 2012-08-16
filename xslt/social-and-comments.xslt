<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"> 

   <!-- This is template purely for testing against Cascade Index Blocks -->
    <xsl:template match="system-index-block">
        <xsl:apply-templates select="calling-page/system-page" mode="addthis" />
    </xsl:template>
    
    <!-- Creating the AddThis code from the page's metadata -->
    <xsl:template match="system-page" mode="addthis">
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
            <xsl:value-of select="display-name" />
            <xsl:text disable-output-escaping="yes"><![CDATA[',
                description: ']]></xsl:text>
            <xsl:value-of select="summary" />
            <xsl:text disable-output-escaping="yes"><![CDATA['
                }
            ]]></xsl:text>
            // <xsl:text>#END-CODE</xsl:text></xsl:comment>
            // [/cascade:cdata]
        </script>
        <script type="text/javascript" src="http://s7.addthis.com/js/250/addthis_widget.js#pubid=ra-4d8a095f17af53f9"></script>
    </xsl:template>

    <xsl:template match="system-page" mode="disqus">

    </xsl:template>
    
</xsl:stylesheet>

