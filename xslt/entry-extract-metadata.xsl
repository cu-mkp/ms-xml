<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs" version="2.0">
    <xsl:output method="text" encoding="UTF-8"/>
    <xsl:param name="fieldSep">
        <xsl:text>	</xsl:text>
    </xsl:param>
    <xsl:param name="tcnFile">
        <xsl:text>../allFolios/xml/all_tcn.xml</xsl:text>
    </xsl:param>
    <xsl:param name="tlFile">
        <xsl:text>../allFolios/xml/all_tl.xml</xsl:text>
    </xsl:param>

    <xsl:template match="/">
        <xsl:text>folio</xsl:text>
        <xsl:value-of select="$fieldSep"/>
        <xsl:text>folio_display</xsl:text>
        <xsl:value-of select="$fieldSep"/>
        <xsl:text>div_id</xsl:text>
        <xsl:value-of select="$fieldSep"/>
        <xsl:text>heading_tc</xsl:text>
        <xsl:value-of select="$fieldSep"/>
        <xsl:text>heading_tcn</xsl:text>
        <xsl:value-of select="$fieldSep"/>
        <xsl:text>heading_tl</xsl:text>
        <xsl:value-of select="$fieldSep"/>
        <xsl:text>categories</xsl:text>
        <xsl:value-of select="$fieldSep"/>
        <xsl:text>margin</xsl:text>
        <xsl:value-of select="$fieldSep"/>
        <xsl:text>has_figures</xsl:text>
        <xsl:value-of select="$fieldSep"/>
        <xsl:text>continued</xsl:text>
        <xsl:value-of select="$fieldSep"/>
        <xsl:text>continues</xsl:text>
        <xsl:value-of select="$fieldSep"/>
        <xsl:text>al</xsl:text>
        <xsl:value-of select="$fieldSep"/>
        <xsl:text>bp</xsl:text>
        <xsl:value-of select="$fieldSep"/>
        <xsl:text>cn</xsl:text>
        <xsl:value-of select="$fieldSep"/>
        <xsl:text>env</xsl:text>
        <xsl:value-of select="$fieldSep"/>
        <xsl:text>m</xsl:text>
        <xsl:value-of select="$fieldSep"/>
        <xsl:text>ms</xsl:text>
        <xsl:value-of select="$fieldSep"/>
        <xsl:text>pa</xsl:text>
        <xsl:value-of select="$fieldSep"/>
        <xsl:text>pl</xsl:text>
        <xsl:value-of select="$fieldSep"/>
        <xsl:text>pn</xsl:text>
        <xsl:value-of select="$fieldSep"/>
        <xsl:text>pro</xsl:text>
        <xsl:value-of select="$fieldSep"/>
        <xsl:text>sn</xsl:text>
        <xsl:value-of select="$fieldSep"/>
        <xsl:text>tl</xsl:text>
        <xsl:value-of select="$fieldSep"/>
        <xsl:text>md</xsl:text>
        <xsl:value-of select="$fieldSep"/>
        <xsl:text>mu</xsl:text>
        <xsl:value-of select="$fieldSep"/>
        <xsl:text>df</xsl:text>
        <xsl:value-of select="$fieldSep"/>
        <xsl:text>wp</xsl:text>
        <xsl:text>&#10;</xsl:text>
        <xsl:apply-templates select="//div[@id][not(@part = 'y')]"/>

    </xsl:template>

    <xsl:template match="div[@id]">
        <xsl:value-of select="ancestor::root/@page"/>
        <xsl:value-of select="$fieldSep"/>
        <xsl:value-of select="concat(number(substring(ancestor::root/@page, 1, 3)), substring(ancestor::root/@page, 4))"/>
        <xsl:value-of select="$fieldSep"/>
        <xsl:value-of select="@id"/>
        <xsl:value-of select="$fieldSep"/>
        <xsl:apply-templates select="child::head"/>
        <xsl:value-of select="$fieldSep"/>
        <xsl:choose>
            <xsl:when test="not(@continues = 'yes')">
        <xsl:apply-templates select="document($tcnFile)//div[@id = current()/@id]/head"/>
        <xsl:value-of select="$fieldSep"/>
        <xsl:apply-templates select="document($tlFile)//div[@id = current()/@id]/head"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:text/>
                <xsl:value-of select="$fieldSep"/>
                <xsl:text/>
            </xsl:otherwise>
             </xsl:choose>
        <xsl:value-of select="$fieldSep"/>
        <xsl:value-of select="normalize-space(@categories)"/>
        <xsl:value-of select="$fieldSep"/>
        <xsl:value-of select="normalize-space(child::margin)"/>
        <xsl:value-of select="$fieldSep"/>
        <xsl:if test=".//figure">
            <xsl:text>CONTAINS FIGURE</xsl:text>
        </xsl:if>
        <xsl:value-of select="$fieldSep"/>
        <xsl:if test="@continued">
            <xsl:text>continued</xsl:text>
        </xsl:if>
        <xsl:value-of select="$fieldSep"/>
        <xsl:if test="@continues">
            <xsl:text>continues</xsl:text>
        </xsl:if>
        <xsl:value-of select="$fieldSep"/>
        <xsl:for-each select="distinct-values(.//al/normalize-space())">
            <xsl:value-of select="."/>
            <xsl:if test="position() != last()">
                <xsl:text>;</xsl:text>
            </xsl:if>
        </xsl:for-each>
        <xsl:value-of select="$fieldSep"/>
        <xsl:for-each select="distinct-values(.//bp/normalize-space())">
            <xsl:value-of select="."/>
            <xsl:if test="position() != last()">
                <xsl:text>;</xsl:text>
            </xsl:if>
        </xsl:for-each>
        <xsl:value-of select="$fieldSep"/>
        <xsl:for-each select="distinct-values(.//cn/normalize-space())">
            <xsl:value-of select="."/>
            <xsl:if test="position() != last()">
                <xsl:text>;</xsl:text>
            </xsl:if>
        </xsl:for-each>
        <xsl:value-of select="$fieldSep"/>
        <xsl:for-each select="distinct-values(.//env/normalize-space())">
            <xsl:value-of select="."/>
            <xsl:if test="position() != last()">
                <xsl:text>;</xsl:text>
            </xsl:if>
        </xsl:for-each>
        <xsl:value-of select="$fieldSep"/>
        <xsl:for-each select="distinct-values(.//m/normalize-space())">
            <xsl:value-of select="."/>
            <xsl:if test="position() != last()">
                <xsl:text>;</xsl:text>
            </xsl:if>
        </xsl:for-each>
        <xsl:value-of select="$fieldSep"/>
        <xsl:for-each select="distinct-values(.//ms/normalize-space())">
            <xsl:value-of select="."/>
            <xsl:if test="position() != last()">
                <xsl:text>;</xsl:text>
            </xsl:if>
        </xsl:for-each>
        <xsl:value-of select="$fieldSep"/>
        <xsl:for-each select="distinct-values(.//pa/normalize-space())">
            <xsl:value-of select="."/>
            <xsl:if test="position() != last()">
                <xsl:text>;</xsl:text>
            </xsl:if>
        </xsl:for-each>
        <xsl:value-of select="$fieldSep"/>
        <xsl:for-each select="distinct-values(.//pl/normalize-space())">
            <xsl:value-of select="."/>
            <xsl:if test="position() != last()">
                <xsl:text>;</xsl:text>
            </xsl:if>
        </xsl:for-each>
        <xsl:value-of select="$fieldSep"/>
        <xsl:for-each select="distinct-values(.//pn/normalize-space())">
            <xsl:value-of select="."/>
            <xsl:if test="position() != last()">
                <xsl:text>;</xsl:text>
            </xsl:if>
        </xsl:for-each>
        <xsl:value-of select="$fieldSep"/>
        <xsl:for-each select="distinct-values(.//pro/normalize-space())">
            <xsl:value-of select="."/>
            <xsl:if test="position() != last()">
                <xsl:text>;</xsl:text>
            </xsl:if>
        </xsl:for-each>
        <xsl:value-of select="$fieldSep"/>
        <xsl:for-each select="distinct-values(.//sn/normalize-space())">
            <xsl:value-of select="."/>
            <xsl:if test="position() != last()">
                <xsl:text>;</xsl:text>
            </xsl:if>
        </xsl:for-each>
        <xsl:value-of select="$fieldSep"/>
        <xsl:for-each select="distinct-values(.//tl/normalize-space())">
            <xsl:value-of select="."/>
            <xsl:if test="position() != last()">
                <xsl:text>;</xsl:text>
            </xsl:if>
        </xsl:for-each>
        <xsl:value-of select="$fieldSep"/>
        <xsl:for-each select="distinct-values(.//md/normalize-space())">
            <xsl:value-of select="."/>
            <xsl:if test="position() != last()">
                <xsl:text>;</xsl:text>
            </xsl:if>
        </xsl:for-each>
        <xsl:value-of select="$fieldSep"/>
        <xsl:for-each select="distinct-values(.//mu/normalize-space())">
            <xsl:value-of select="."/>
            <xsl:if test="position() != last()">
                <xsl:text>;</xsl:text>
            </xsl:if>
        </xsl:for-each>
        <xsl:value-of select="$fieldSep"/>
        <xsl:for-each select="distinct-values(.//df/normalize-space())">
            <xsl:value-of select="."/>
            <xsl:if test="position() != last()">
                <xsl:text>;</xsl:text>
            </xsl:if>
        </xsl:for-each>
        <xsl:value-of select="$fieldSep"/>
        <xsl:for-each select="distinct-values(.//wp/normalize-space())">
            <xsl:value-of select="."/>
            <xsl:if test="position() != last()">
                <xsl:text>;</xsl:text>
            </xsl:if>
        </xsl:for-each>
        <xsl:text>&#10;</xsl:text>
    </xsl:template>
    
    <xsl:template match="head">
        <xsl:value-of select="normalize-space(.)"/>
    </xsl:template>
    
    <xsl:template match="head[child::sup]">
        <xsl:text>[</xsl:text>
            <xsl:value-of select="normalize-space(.)"/>
        <xsl:text>]</xsl:text>
    </xsl:template>

</xsl:stylesheet>
