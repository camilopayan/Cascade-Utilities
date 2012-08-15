<xsl:stylesheet version="1.0"
   xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
   xmlns:xalan="http://xml.apache.org/xalan"
   xmlns:vpre="vpre"
   extension-element-prefixes="vpre"
   >

   <xalan:component prefix="vpre" functions="identify_video_site vimeo_id youtube_id">
      <xalan:script lang="javascript">
         function identify_video_site(url){
            var re = /(youtu\.?be|vimeo)/i;
            var match = url.match(re);
            if( !match ){ return "unsupported"; }
            else { match = match[1]; }
            if( match == "youtube" || match == "youtu.be" ){ return "youtube"; }
            else { return "vimeo"; }
         }

         function vimeo_id(url){
            var re = /http:\/\/(www\.)?vimeo.com\/(\d+)($|\/)/;
            return url.match(re)[1];
         }

         function youtube_id(url){
            var re = /.*(?:youtu.be\/|v\/|u\/\w\/|embed\/|watch\?v=)([^#\&amp;\?]*).*/;
            return url.match(re)[1];
         }
      </xalan:script>
   </xalan:component>

   <!-- Hi I'm Testing Code! -->
   <xsl:template match="a" >
      <xsl:call-template name="url-to-embed">
         <xsl:with-param name="url" select="c">
            
         </xsl:with-param>
         
      </xsl:call-template>
   </xsl:template>

   <xsl:template name="url-to-embed" >
      <xsl:param name="url" />
      <xsl:param name="width">560</xsl:param>
      <xsl:param name="height">315</xsl:param>
      <xsl:variable name="site" select="vpre:identify_video_site(string($url))" />
      <xsl:choose>
         <xsl:when test="$site = 'youtube'">
            <iframe width="{$width}" height="{$height}"
               frameborder="0" allowfullscreen="true">
               <xsl:attribute name="src">
                  <xsl:value-of select="concat('http://www.youtube.com/embed/',vpre:youtube_id(string($url)))" />
               </xsl:attribute>
            </iframe>
         </xsl:when>      
         <xsl:when test="$site = 'vimeo'">
            <iframe width="$width" height="$height"
               frameborder="0" allowfullscreen="true">
               <xsl:attribute name="src">
                  <xsl:value-of select="concat('http://player.vimeo.com/video/', vpre:vimeo_id(string($url))) " />
               </xsl:attribute>
            </iframe>
         </xsl:when>      
         <xsl:otherwise>
            <p>This video can not be embedded</p>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>

</xsl:stylesheet>

