<xsl:stylesheet xmlns="http://www.w3.org/1999/xhtml" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version='1.0'>
    <xsl:param name="html.stylesheet">style.css</xsl:param>
    <xsl:param name="itemizedlist.propagates.style">1</xsl:param>
    <xsl:param name="use.id.as.filename">1</xsl:param>
    <xsl:param name="chunker.output.doctype-public">-//W3C//DTD XHTML 1.0 Transitional//EN</xsl:param>
    <xsl:param name="chunker.output.doctype-system">http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd</xsl:param>
    <!-- Parameters for Generating Strict Output. See:
    http://www.sagehill.net/docbookxsl/OtherOutputForms.html#StrictXhtmlValid
    -->
    <xsl:param name="css.decoration">0</xsl:param>
    <xsl:param name="ulink.target"></xsl:param>
    <xsl:param name="use.viewport">0</xsl:param>
    <!-- End of Strict Params -->    
    <xsl:param name="toc.section.depth">10</xsl:param> 
    <xsl:param name="generate.section.toc.level">10</xsl:param>
<xsl:template match="itemizedlist">
    <div xmlns="http://www.w3.org/1999/xhtml" class="{name(.)}">
    <xsl:call-template name="anchor"/>
    <xsl:if test="title">
      <xsl:call-template name="formal.object.heading"/>
    </xsl:if>

    <xsl:apply-templates select="*[not(self::listitem                                    or self::title                                    or self::titleabbrev)]"/>

    <ul>
         <xsl:if test="@role">
             <xsl:attribute name="class">
                 <xsl:value-of select="@role"/>
             </xsl:attribute>
         </xsl:if>


      <xsl:if test="$css.decoration != 0">
        <xsl:attribute name="type">
          <xsl:call-template name="list.itemsymbol"/>
        </xsl:attribute>
      </xsl:if>

      <xsl:if test="@spacing='compact'">
        <xsl:attribute name="compact">
          <xsl:value-of select="@spacing"/>
        </xsl:attribute>
      </xsl:if>
      <xsl:apply-templates select="listitem"/>
    </ul>
  </div>
</xsl:template>

<!-- Insert some AdSense Ads -->
<xsl:template name="user.header.navigation">
    <div class="center">
    <script type="text/javascript">
google_ad_client = "pub-2480595666283917";
google_ad_width = 468;
google_ad_height = 60;
google_ad_format = "468x60_as";
google_ad_type = "text";
google_ad_channel ="";
google_color_border = "336699";
google_color_text = "000000";
google_color_bg = "FFFFFF";
google_color_link = "0000FF";
google_color_url = "008000";
</script>
<script type="text/javascript"
  src="http://pagead2.googlesyndication.com/pagead/show_ads.js">
</script>
    </div>
</xsl:template>
</xsl:stylesheet>
