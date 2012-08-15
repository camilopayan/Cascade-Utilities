<xsl:stylesheet version="1.0"
   xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
   xmlns:xalan="http://xml.apache.org/xalan"
   xmlns:vpre="vpre"
   extension-element-prefixes="vpre"
   >

   <xalan:component prefix="vpre" functions="identify_video_site" elements="make_vimeo_embed make_youtube_embed">
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
         }

         function youtube_id(url){
            var re = /.*(?:youtu.be\/|v\/|u\/\w\/|embed\/|watch\?v=)([^#\&\?]*).*/;
            return url.match(re)[1];
         }
      </xalan:script>
   </xalan:component>

</xsl:stylesheet>

