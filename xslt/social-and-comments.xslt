<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"> 
    <xsl:template match="system-page" mode="addthis">
        <div class="addthis_toolbox addthis_default_style addthis_32x32_style">
            <xsl:attribute name="addthis:title">
                <xsl:value-of select="display-name" />
            </xsl:attribute>
            <xsl:attribute name="addthis:description">
                <xsl:value-of select="summary" />
            </xsl:attribute>
            <a class="addthis_button_facebook"></a>
            <a class="addthis_button_twitter"></a>
            <a class="addthis_button_preferred_3"></a>
            <a class="addthis_button_preferred_4"></a>
            <a class="addthis_button_compact"></a>
            <a class="addthis_counter addthis_bubble_style"></a>
        </div>
        <script type="text/javascript"><![CDATA[var addthis_config = {"data_track_addressbar":true};]]></script>
        <script type="text/javascript" src="http://s7.addthis.com/js/250/addthis_widget.js#pubid=ra-4d8a095f17af53f9"></script>


    </xsl:template>

    <xsl:template match="system-page" mode="disqus">

    </xsl:template>
    
</xsl:stylesheet>

