<?xml version="1.0" encoding="UTF-8"?>
<!-- =================================================== -->
<!-- XSL-FO stylesheet to generate Request in PDF format -->
<!-- =================================================== -->
<xsl:stylesheet version="2.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format"
    exclude-result-prefixes="fo">
    <xsl:output method="xml" version="1.0"
        omit-xml-declaration="no" indent="yes" />

   
    <!-- ======================== -->
    <!-- root element: complaint -->
    <!-- ======================== -->
    <xsl:template match="/">
        <fo:root xmlns:fo="http://www.w3.org/1999/XSL/Format">
            <fo:layout-master-set>
                <fo:simple-page-master
                    master-name="letter" page-height="11.0in"
                    page-width="8.5in" margin-top="0.17in"
                    margin-bottom="0.17in" margin-left="1.0in"
                    margin-right="1.0in">
                    <fo:region-body margin-top="0.5in"
                        margin-bottom="0.5in" />
                </fo:simple-page-master>
            </fo:layout-master-set>

            <fo:page-sequence master-reference="letter">

                <!-- output data goes here -->
                <fo:flow flow-name="xsl-region-body" font-family="Serif">
					<xsl:apply-templates select="complaint"/>
                    <fo:block font-size="16pt" text-align="center" font-weight="bold" space-after="0.25in">
                        Incident Information
                    </fo:block>
                    <fo:block font-size="13pt" text-align="center" space-after="0.75in">
                        <xsl:value-of select="complaint/incidentDate"/>
                    </fo:block>
                    <fo:block font-size="12pt" space-after="0.15in">
                        Initiator: <fo:inline font-weight="bold"><xsl:value-of select="complaint/initiator"/></fo:inline>
                    </fo:block>
					<fo:block font-size="12pt" space-after="0.15in">
                        Complaint Title: <fo:inline font-weight="bold"><xsl:value-of select="complaint/complaintTitle"/></fo:inline>
                    </fo:block>
                    <fo:block font-size="12pt" space-after="0.15in">
                        Incident Category: <fo:inline font-weight="bold"><xsl:value-of select="complaint/complaintType"/></fo:inline>
                    </fo:block>
                    <fo:block font-size="12pt" space-after="0.15in">
                        Complaint Number: <fo:inline font-weight="bold"><xsl:value-of select="complaint/complaintNumber"/></fo:inline>
                    </fo:block>
                    <fo:block font-size="12pt" space-after="0.15in">
                        Priority: <fo:inline font-weight="bold"><xsl:value-of select="complaint/priority"/></fo:inline>
                    </fo:block>
					<fo:block font-size="12pt" space-after="0.15in">
                        Complaint Tag: <fo:inline font-weight="bold"><xsl:value-of select="complaint/complaintTag"/></fo:inline>
                    </fo:block>
					<fo:block font-size="12pt" space-after="0.15in">
                        Frequency: <fo:inline font-weight="bold"><xsl:value-of select="complaint/frequency"/></fo:inline>
                    </fo:block>
                    <fo:block font-size="12pt" space-after="0.15in">
                        Complaint Description: <fo:inline font-weight="bold"><xsl:value-of select="complaint/complaintDescription"/></fo:inline>
                    </fo:block>
					<fo:block font-size="12pt" space-after="0.15in">
								Location: 
								Type: <fo:inline font-weight="bold"><xsl:value-of select="complaint/locationType"/></fo:inline>
								Address: <fo:inline font-weight="bold"><xsl:value-of select="complaint/locationAddress"/></fo:inline>
								City:  <fo:inline font-weight="bold"><xsl:value-of select="complaint/locationCity"/></fo:inline>
								State:  <fo:inline font-weight="bold"><xsl:value-of select="complaint/locationState"/></fo:inline>
								Zip:  <fo:inline font-weight="bold"><xsl:value-of select="complaint/locationZip"/></fo:inline>
								Added by:  <fo:inline font-weight="bold"><xsl:value-of select="complaint/locationAddedBy"/></fo:inline>
	                  </fo:block>
					  <fo:block font-size="12pt" space-after="0.15in">
						  People:
						  <xsl:for-each select="complaint/people">
							  <fo:block font-size="12pt" space-after="0.15in">
								  Person Type:  <fo:inline font-weight="bold"><xsl:value-of select="person/personType"/></fo:inline>
								  Person:  <fo:inline font-weight="bold"><xsl:value-of select="person/personName"/></fo:inline>
							  </fo:block>
						  </xsl:for-each>	
					   </fo:block>
					    <fo:block font-size="12pt" space-after="0.15in">
							Participants:
						  <xsl:for-each select="complaint/participants">
							  <fo:block font-size="12pt" space-after="0.15in">
								  Person Type:  <fo:inline font-weight="bold"><xsl:value-of select="participant/participantType"/></fo:inline>
								  Person: <fo:inline font-weight="bold"><xsl:value-of select="participant/participantName"/></fo:inline>
							  </fo:block>
						  </xsl:for-each>	
					   </fo:block>
                </fo:flow>
            </fo:page-sequence>

        </fo:root>
    </xsl:template>
</xsl:stylesheet>
