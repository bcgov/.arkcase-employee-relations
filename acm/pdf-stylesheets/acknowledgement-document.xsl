<?xml version="1.0" encoding="UTF-8"?>
<!-- ===================================================================== -->
<!-- XSL-FO stylesheet to generate Work Order print manifest in PDF format -->
<!-- ===================================================================== -->
<xsl:stylesheet version="2.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format"
                exclude-result-prefixes="fo">
    <xsl:output method="xml" version="1.0" omit-xml-declaration="no"
                indent="yes"/>
    <xsl:param name="requestID"/>
    <xsl:param name="topic"/>
    <xsl:param name="requestorName"/>
	<xsl:param name="requestorAddress"/>
    <xsl:param name="requestorEmailAddress"/>
    <xsl:param name="requestorOrganization"/>
    <xsl:param name="requestorOrganizationAddress"/>
    <xsl:param name="receivedDate"/>
    <!-- ======================== -->
    <!-- root element: acknowledgement -->
    <!-- ======================== -->
    <xsl:template match="acknowledgement">
        <fo:root xmlns:fo="http://www.w3.org/1999/XSL/Format">
            <fo:layout-master-set>
                <fo:simple-page-master master-name="letter"
                                       page-height="11.0in" page-width="8.5in" margin-top="0.2in"
                                       margin-bottom="0.2in" margin-left="0.2in" margin-right="0.2in">
                    <fo:region-body margin-top="2.475in" margin-bottom="0.50in"/>
                    <fo:region-before/>
                    <fo:region-after/>
                </fo:simple-page-master>
            </fo:layout-master-set>


        </fo:root>
    </xsl:template>
</xsl:stylesheet>
