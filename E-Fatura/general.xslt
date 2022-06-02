<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:cac="urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2"
    xmlns:cbc="urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2"
    xmlns:ccts="urn:un:unece:uncefact:documentation:2"
    xmlns:clm54217="urn:un:unece:uncefact:codelist:specification:54217:2001"
    xmlns:clm5639="urn:un:unece:uncefact:codelist:specification:5639:1988"
    xmlns:clm66411="urn:un:unece:uncefact:codelist:specification:66411:2001"
    xmlns:clmIANAMIMEMediaType="urn:un:unece:uncefact:codelist:specification:IANAMIMEMediaType:2003"
    xmlns:fn="http://www.w3.org/2005/xpath-functions" xmlns:link="http://www.xbrl.org/2003/linkbase"
    xmlns:n1="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2"
    xmlns:qdt="urn:oasis:names:specification:ubl:schema:xsd:QualifiedDatatypes-2"
    xmlns:udt="urn:un:unece:uncefact:data:specification:UnqualifiedDataTypesSchemaModule:2"
    xmlns:xbrldi="http://xbrl.org/2006/xbrldi" xmlns:xbrli="http://www.xbrl.org/2003/instance"
    xmlns:xdt="http://www.w3.org/2005/xpath-datatypes" xmlns:xlink="http://www.w3.org/1999/xlink"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsd="http://www.w3.org/2001/XMLSchema"
    xmlns:lcl="http://www.efatura.gov.tr/local"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    exclude-result-prefixes="cac cbc ccts clm54217 clm5639 clm66411 clmIANAMIMEMediaType fn link n1 qdt udt xbrldi xbrli xdt xlink xs xsd xsi lcl">
    <xsl:character-map name="a"> 
        <xsl:output-character character="&#128;" string=""/>
        <xsl:output-character character="&#129;" string=""/>
        <xsl:output-character character="&#130;" string=""/>
        <xsl:output-character character="&#131;" string=""/>
        <xsl:output-character character="&#132;" string=""/>
        <xsl:output-character character="&#133;" string=""/>
        <xsl:output-character character="&#134;" string=""/>
        <xsl:output-character character="&#135;" string=""/>
        <xsl:output-character character="&#136;" string=""/>
        <xsl:output-character character="&#137;" string=""/>
        <xsl:output-character character="&#138;" string=""/>
        <xsl:output-character character="&#139;" string=""/>
        <xsl:output-character character="&#140;" string=""/>
        <xsl:output-character character="&#141;" string=""/>
        <xsl:output-character character="&#142;" string=""/>
        <xsl:output-character character="&#143;" string=""/>
        <xsl:output-character character="&#144;" string=""/>
        <xsl:output-character character="&#145;" string=""/>
        <xsl:output-character character="&#146;" string=""/>
        <xsl:output-character character="&#147;" string=""/>
        <xsl:output-character character="&#148;" string=""/>
        <xsl:output-character character="&#149;" string=""/>
        <xsl:output-character character="&#150;" string=""/>
        <xsl:output-character character="&#151;" string=""/>
        <xsl:output-character character="&#152;" string=""/>
        <xsl:output-character character="&#153;" string=""/>
        <xsl:output-character character="&#154;" string=""/>
        <xsl:output-character character="&#155;" string=""/>
        <xsl:output-character character="&#156;" string=""/>
        <xsl:output-character character="&#157;" string=""/>
        <xsl:output-character character="&#158;" string=""/>
        <xsl:output-character character="&#159;" string=""/>
    </xsl:character-map>
    <xsl:decimal-format name="european" decimal-separator="," grouping-separator="." NaN=""/>
    <xsl:output version="4.0" method="html" indent="no" encoding="UTF-8"
        doctype-public="-//W3C//DTD HTML 4.01 Transitional//EN"
        doctype-system="http://www.w3.org/TR/html4/loose.dtd" use-character-maps="a"/>
    <xsl:param name="SV_OutputFormat" select="'HTML'"/>
    <xsl:variable name="XML" select="/"/>   
    
    <xsl:template match="/">
        <html>
            <head>
                <style type="text/css">
                    body {
                        background-color: #FFFFFF;
                        font-family: 'Tahoma', "Times New Roman", Times, serif;
                        font-size: 11px;
                        color: #666666;
                    }
                    h1, h2 {
                        padding-bottom: 3px;
                        padding-top: 3px;
                        margin-bottom: 5px;
                        text-transform: uppercase;
                        font-family: Arial, Helvetica, sans-serif;
                    }
                    h1 {
                        font-size: 1.4em;
                        text-transform:none;
                    }
                    h2 {
                        font-size: 1em;
                        color: brown;
                    }
                    h3 {
                        font-size: 1em;
                        color: #333333;
                        text-align: justify;
                        margin: 0;
                        padding: 0;
                    }
                    h4 {
                        font-size: 1.1em;
                        font-style: bold;
                        font-family: Arial, Helvetica, sans-serif;
                        color: #000000;
                        margin: 0;
                        padding: 0;
                    }
                    hr {
                        height:2px;
                        color: #000000;
                        background-color: #000000;
                        border-bottom: 1px solid #000000;
                    }
                    p, ul, ol {
                        margin-top: 1.5em;
                    }
                    ul, ol {
                        margin-left: 3em;
                    }
                    blockquote {
                        margin-left: 3em;
                        margin-right: 3em;
                        font-style: italic;
                    }
                    a {
                        text-decoration: none;
                        color: #70A300;
                    }
                    a:hover {
                        border: none;
                        color: #70A300;
                    }
                    #despatchTable {
                        border-collapse:collapse;
                        font-size:11px;
                        float:right;
                        border-color:gray;
                    }
                    #ettnTable {
                        border-collapse:collapse;
                        font-size:11px;
                        border-color:gray;
                    }
                    #customerPartyTable {
                        border-width: 0px;
                        border-spacing:;
                        border-style: inset;
                        border-color: gray;
                        border-collapse: collapse;
                        background-color:
                    }
                    #customerIDTable {
                        border-width: 2px;
                        border-spacing:;
                        border-style: inset;
                        border-color: gray;
                        border-collapse: collapse;
                        background-color:
                    }
                    #customerIDTableTd {
                        border-width: 2px;
                        border-spacing:;
                        border-style: inset;
                        border-color: gray;
                        border-collapse: collapse;
                        background-color:
                    }
                    #lineTable {
                        border-width:2px;
                        border-spacing:;
                        border-style: inset;
                        border-color: black;
                        border-collapse: collapse;
                        background-color:;
                    }
                    td.lineTableTd {
                        border-width: 1px;
                        padding: 1px;
                        border-style: inset;
                        border-color: black;
                        background-color: white;
                    }
                    tr.lineTableTr {
                        border-width: 1px;
                        padding: 0px;
                        border-style: inset;
                        border-color: black;
                        background-color: white;
                        -moz-border-radius:;
                    }
                    #lineTableDummyTd {
                        border-width: 1px;
                        border-color:white;
                        padding: 1px;
                        border-style: inset;
                        border-color: black;
                        background-color: white;
                    }
                    td.lineTableBudgetTd {
                        border-width: 2px;
                        border-spacing:0px;
                        padding: 1px;
                        border-style: inset;
                        border-color: black;
                        background-color: white;
                        -moz-border-radius:;
                    }
                    #notesTable {
                        border-width: 2px;
                        border-spacing:;
                        border-style: inset;
                        border-color: black;
                        border-collapse: collapse;
                        background-color:
                    }
                    #notesTableTd {
                        border-width: 0px;
                        border-spacing:;
                        border-style: inset;
                        border-color: black;
                        border-collapse: collapse;
                        background-color:
                    }
                    table {
                        border-spacing:0px;
                    }
                    #budgetContainerTable {
                        border-width: 0px;
                        border-spacing: 0px;
                        border-style: inset;
                        border-color: black;
                        border-collapse: collapse;
                        background-color:;
                    }
                    td {
                        border-color:gray;
                    }</style>
                <title>e-Fatura</title>
            </head>
            <body
                style="margin-left=0.6in; margin-right=0.6in; margin-top=0.79in; margin-bottom=0.79in">
                <xsl:for-each select="$XML">
                    <table style="border-color:blue; " border="0" cellspacing="0px" width="800"
                        cellpadding="0px">
                        <tbody>
                            <tr valign="top">
                                <td width="40%">
                                    <br/>
                                    <hr/>
                                    <table align="center" border="0" width="100%">
                                        <tbody>
                                            <tr align="left">
                                                <xsl:for-each select="n1:Invoice/cac:AccountingSupplierParty/cac:Party">
                                                    <td align="left">
                                                    <xsl:if test="cac:PartyName">
                                                    <xsl:value-of select="cac:PartyName/cbc:Name"/>
                                                    <br/>
                                                    </xsl:if>
                                                    <xsl:for-each select="cac:Person">
                                                        <xsl:for-each select="cbc:Title">
                                                        <xsl:apply-templates/>
                                                        <xsl:text>&#160;</xsl:text>
                                                        </xsl:for-each>
                                                        <xsl:for-each select="cbc:FirstName">
                                                        <xsl:apply-templates/>
                                                        <xsl:text>&#160;</xsl:text>
                                                        </xsl:for-each>
                                                        <xsl:for-each select="cbc:MiddleName">
                                                        <xsl:apply-templates/>
                                                        <xsl:text>&#160;</xsl:text>
                                                        </xsl:for-each>
                                                        <xsl:for-each select="cbc:FamilyName">
                                                        <xsl:apply-templates/>
                                                        <xsl:text>&#160;</xsl:text>
                                                        </xsl:for-each>
                                                        <xsl:for-each select="cbc:NameSuffix">
                                                        <xsl:apply-templates/>
                                                        </xsl:for-each>
                                                    </xsl:for-each>
                                                    </td>
                                                </xsl:for-each>
                                            </tr>
                                            <tr align="left">
                                                <xsl:for-each select="n1:Invoice/cac:AccountingSupplierParty/cac:Party">
                                                <td align="left">
                                                <xsl:for-each select="cac:PostalAddress">
                                                    <xsl:for-each select="cbc:StreetName">
                                                    <xsl:apply-templates/>
                                                    <xsl:text>&#160;</xsl:text>
                                                    </xsl:for-each>
                                                    <xsl:for-each select="cbc:BuildingName">
                                                    <xsl:apply-templates/>
                                                    </xsl:for-each>
                                                    <xsl:if test="cbc:BuildingNumber">
                                                    <xsl:text> No:</xsl:text>
                                                    <xsl:for-each select="cbc:BuildingNumber">
                                                    <xsl:apply-templates/>
                                                    </xsl:for-each>
                                                    <xsl:text>&#160;</xsl:text>
                                                    </xsl:if>
                                                    <br/>
                                                    <xsl:for-each select="cbc:PostalZone">
                                                    <xsl:apply-templates/>
                                                    <xsl:text>&#160;</xsl:text>
                                                    </xsl:for-each>
                                                    <xsl:for-each select="cbc:CitySubdivisionName">
                                                    <xsl:apply-templates/>
                                                    </xsl:for-each>
                                                    <xsl:text>/ </xsl:text>
                                                    <xsl:for-each select="cbc:CityName">
                                                    <xsl:apply-templates/>
                                                    <xsl:text>&#160;</xsl:text>
                                                    </xsl:for-each>
                                                </xsl:for-each>
                                                </td>
                                                </xsl:for-each>
                                            </tr>
                                            <xsl:if
                                                test="//n1:Invoice/cac:AccountingSupplierParty/cac:Party/cac:Contact/cbc:Telephone or //n1:Invoice/cac:AccountingSupplierParty/cac:Party/cac:Contact/cbc:Telefax">
                                                <tr align="left">
                                                    <xsl:for-each select="n1:Invoice/cac:AccountingSupplierParty/cac:Party">                                                        
                                                        <td align="left">
                                                        <xsl:for-each select="cac:Contact">
                                                        <xsl:if test="cbc:Telephone">
                                                        <xsl:text>Tel: </xsl:text>
                                                        <xsl:for-each select="cbc:Telephone">
                                                        <xsl:apply-templates/>
                                                        </xsl:for-each>
                                                        </xsl:if>
                                                        <xsl:if test="cbc:Telefax">
                                                        <xsl:text> Fax: </xsl:text>
                                                        <xsl:for-each select="cbc:Telefax">
                                                        <xsl:apply-templates/>
                                                        </xsl:for-each>
                                                        </xsl:if>
                                                        <xsl:text>&#160;</xsl:text>
                                                        </xsl:for-each>
                                                        </td>
                                                    </xsl:for-each>
                                                </tr>
                                            </xsl:if>
                                            <xsl:for-each
                                                select="//n1:Invoice/cac:AccountingSupplierParty/cac:Party/cbc:WebsiteURI">
                                                <tr align="left">
                                                <td>
                                                <xsl:text>Web Sitesi: </xsl:text>
                                                <xsl:value-of select="."/>
                                                </td>
                                                </tr>
                                            </xsl:for-each>
                                            <xsl:for-each
                                                select="//n1:Invoice/cac:AccountingSupplierParty/cac:Party/cac:Contact/cbc:ElectronicMail">
                                                <tr align="left">
                                                <td>
                                                <xsl:text>E-Posta: </xsl:text>
                                                <xsl:value-of select="."/>
                                                </td>
                                                </tr>
                                            </xsl:for-each>
                                            <tr align="left">
                                                <xsl:for-each select="n1:Invoice/cac:AccountingSupplierParty/cac:Party">                                                                                                            
                                                    <td align="left">
                                                    <xsl:text>Vergi Dairesi: </xsl:text>
                                                    <xsl:for-each select="cac:PartyTaxScheme">
                                                    <xsl:for-each select="cac:TaxScheme">
                                                    <xsl:for-each select="cbc:Name">
                                                    <xsl:apply-templates/>
                                                    </xsl:for-each>
                                                    </xsl:for-each>
                                                    <xsl:text>&#160; </xsl:text>
                                                    </xsl:for-each>
                                                    </td>
                                                </xsl:for-each>
                                            </tr>
                                            <xsl:for-each
                                                select="//n1:Invoice/cac:AccountingSupplierParty/cac:Party/cac:PartyIdentification">
                                                <tr align="left">
                                                <td>
                                                <xsl:value-of select="cbc:ID/@schemeID"/>
                                                <xsl:text>: </xsl:text>
                                                <xsl:value-of select="cbc:ID"/>
                                                </td>
                                                </tr>
                                            </xsl:for-each>
                                        </tbody>
                                    </table>
                                    <hr/>
                                </td>
                                <td width="20%" align="center" valign="middle">
                                    <br/>
                                    <br/>
                                    <img style="width:91px;" align="middle" alt="E-Fatura Logo"
                                        src="data:image/jpeg;base64,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"/>
                                    <h1 align="center">
                                        <span style="font-weight:bold; ">
                                            <xsl:text>e-FATURA</xsl:text>
                                        </span>
                                    </h1>
                                </td>
                                <td width="40%"/>
                            </tr>
                            <tr style="height:118px; " valign="top">
                                <td width="40%" align="right" valign="bottom">
                                    <table id="customerPartyTable" align="left" border="0">
                                        <tbody>
                                            <tr style="height:71px; ">
                                                <td>
                                                <hr/>
                                                <table align="center" border="0">
                                                <tbody>
                                                <tr>
                                                <xsl:for-each select="n1:Invoice/cac:AccountingCustomerParty/cac:Party">
                                                    <td style="width:469px; " align="left">
                                                        <span style="font-weight:bold; ">
                                                            <xsl:text>SAYIN</xsl:text>
                                                        </span>
                                                    </td>
                                                </xsl:for-each>                                                 
                                                </tr>
                                                <tr>
                                                    <xsl:choose>
                                                        <xsl:when test="n1:Invoice/cac:BuyerCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID[@schemeID='PARTYTYPE' and text()='TAXFREE']">
                                                            <xsl:for-each select="n1:Invoice/cac:BuyerCustomerParty/cac:Party">
                                                                <xsl:call-template name="Party_Title">
                                                                    <xsl:with-param name="PartyType">TAXFREE</xsl:with-param>
                                                                </xsl:call-template>
                                                            </xsl:for-each>                                                         
                                                        </xsl:when>
                                                        <xsl:when test="n1:Invoice/cac:BuyerCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID[@schemeID='PARTYTYPE' and starts-with(text(), 'EXPORT')]">
                                                            <xsl:for-each select="n1:Invoice/cac:BuyerCustomerParty/cac:Party">
                                                                <xsl:call-template name="Party_Title">
                                                                    <xsl:with-param name="PartyType">EXPORT</xsl:with-param>
                                                                </xsl:call-template>
                                                            </xsl:for-each>                                                         
                                                        </xsl:when>
                                                        <xsl:otherwise>
                                                            <xsl:for-each select="n1:Invoice/cac:AccountingCustomerParty/cac:Party">
                                                                <xsl:call-template name="Party_Title">
                                                                    <xsl:with-param name="PartyType">OTHER</xsl:with-param>
                                                                </xsl:call-template>
                                                            </xsl:for-each>                                                         
                                                        </xsl:otherwise>
                                                    </xsl:choose>                                                   
                                                </tr>
                                                    <xsl:choose>
                                                        <xsl:when test="n1:Invoice/cac:BuyerCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID[@schemeID='PARTYTYPE' and text()='TAXFREE']">
                                                                <xsl:for-each select="n1:Invoice/cac:BuyerCustomerParty/cac:Party">
                                                                    <tr>
                                                                        <xsl:call-template name="Party_Adress">
                                                                            <xsl:with-param name="PartyType">TAXFREE</xsl:with-param>
                                                                        </xsl:call-template>
                                                                    </tr>
                                                                    <xsl:call-template name="Party_Other">
                                                                        <xsl:with-param name="PartyType">TAXFREE</xsl:with-param>
                                                                    </xsl:call-template>
                                                                </xsl:for-each>                                                         
                                                        </xsl:when>
                                                        <xsl:when test="n1:Invoice/cac:BuyerCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID[@schemeID='PARTYTYPE' and starts-with(text(), 'EXPORT')]">
                                                            <xsl:for-each select="n1:Invoice/cac:BuyerCustomerParty/cac:Party">
                                                                <tr>
                                                                    <xsl:call-template name="Party_Adress">
                                                                        <xsl:with-param name="PartyType">EXPORT</xsl:with-param>
                                                                    </xsl:call-template>
                                                                </tr>
                                                                <xsl:call-template name="Party_Other">
                                                                    <xsl:with-param name="PartyType">EXPORT</xsl:with-param>
                                                                </xsl:call-template>
                                                            </xsl:for-each>                                                         
                                                        </xsl:when>
                                                        <xsl:otherwise>
                                                            <xsl:for-each select="n1:Invoice/cac:AccountingCustomerParty/cac:Party">
                                                                <tr>
                                                                    <xsl:call-template name="Party_Adress">
                                                                        <xsl:with-param name="PartyType">OTHER</xsl:with-param>                                                                 
                                                                    </xsl:call-template>
                                                                </tr>
                                                                <xsl:call-template name="Party_Other">
                                                                    <xsl:with-param name="PartyType">OTHER</xsl:with-param>
                                                                </xsl:call-template>
                                                            </xsl:for-each>
                                                        </xsl:otherwise>
                                                    </xsl:choose>                                                                                                       
                                                </tbody>
                                                </table>
                                                <hr/>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                    <br/>
                                </td>
                                <td width="60%" align="center" valign="bottom" colspan="2">
                                    <table border="1" id="despatchTable">
                                        <tbody>
                                            <tr>
                                                <td style="width:105px;" align="left">
                                                <span style="font-weight:bold; ">
                                                <xsl:text>Özelleştirme No:</xsl:text>
                                                </span>
                                                </td>
                                                <td style="width:110px;" align="left">
                                                    <xsl:for-each select="n1:Invoice/cbc:CustomizationID">
                                                        <xsl:apply-templates/>
                                                    </xsl:for-each>
                                                </td>
                                            </tr>
                                            <tr style="height:13px; ">
                                                <td align="left">
                                                <span style="font-weight:bold; ">
                                                <xsl:text>Senaryo:</xsl:text>
                                                </span>
                                                </td>
                                                <td align="left">
                                                    <xsl:for-each select="n1:Invoice/cbc:ProfileID">
                                                        <xsl:apply-templates/>
                                                    </xsl:for-each>
                                                </td>
                                            </tr>
                                            <tr style="height:13px; ">
                                                <td align="left">
                                                <span style="font-weight:bold; ">
                                                <xsl:text>Fatura Tipi:</xsl:text>
                                                </span>
                                                </td>
                                                <td align="left">
                                                    <xsl:for-each select="n1:Invoice/cbc:InvoiceTypeCode">
                                                        <xsl:apply-templates/>
                                                    </xsl:for-each>
                                                </td>
                                            </tr>
                                            <tr style="height:13px; ">
                                                <td align="left">
                                                <span style="font-weight:bold; ">
                                                <xsl:text>Fatura No:</xsl:text>
                                                </span>
                                                </td>
                                                <td align="left">
                                                    <xsl:for-each select="n1:Invoice/cbc:ID">
                                                        <xsl:apply-templates/>
                                                    </xsl:for-each>
                                                </td>
                                            </tr>
                                            <tr style="height:13px; ">
                                                <td align="left">
                                                <span style="font-weight:bold; ">
                                                <xsl:text>Fatura Tarihi:</xsl:text>
                                                </span>
                                                </td>
                                                <td align="left">
                                                    <xsl:for-each select="n1:Invoice/cbc:IssueDate">
                                                        <xsl:apply-templates select="."/>
                                                    </xsl:for-each>
                                                </td>
                                            </tr>
                                            <xsl:for-each select="n1:Invoice/cac:DespatchDocumentReference">
                                                <tr style="height:13px; ">
                                                    <td align="left">
                                                        <span style="font-weight:bold; ">
                                                            <xsl:text>İrsaliye No:</xsl:text>
                                                        </span>
                                                        <xsl:text>&#160;</xsl:text>
                                                    </td>
                                                    <td align="left">
                                                        <xsl:value-of select="cbc:ID"/>
                                                    </td>
                                                </tr>
                                                <tr style="height:13px; ">
                                                    <td align="left">
                                                        <span style="font-weight:bold; ">
                                                            <xsl:text>İrsaliye Tarihi:</xsl:text>
                                                        </span>
                                                    </td>
                                                    <td align="left">
                                                        <xsl:for-each select="cbc:IssueDate">
                                                            <xsl:apply-templates select="."/>
                                                        </xsl:for-each>
                                                    </td>
                                                </tr>
                                            </xsl:for-each>
                                            <xsl:if test="//n1:Invoice/cac:OrderReference">
                                                <tr style="height:13px">
                                                    <td align="left">
                                                        <span style="font-weight:bold; ">
                                                            <xsl:text>Sipariş No:</xsl:text>
                                                        </span>
                                                    </td>
                                                    <td align="left">
                                                        <xsl:for-each select="n1:Invoice/cac:OrderReference/cbc:ID">
                                                            <xsl:apply-templates/>
                                                        </xsl:for-each>
                                                    </td>
                                                </tr>
                                            </xsl:if>
                                            <xsl:if test="//n1:Invoice/cac:OrderReference/cbc:IssueDate">
                                                <tr style="height:13px">
                                                    <td align="left">
                                                        <span style="font-weight:bold; ">
                                                        <xsl:text>Sipariş Tarihi:</xsl:text>
                                                        </span>
                                                    </td>
                                                    <td align="left">
                                                        <xsl:for-each select="n1:Invoice/cac:OrderReference/cbc:IssueDate">
                                                            <xsl:apply-templates select="."/>
                                                        </xsl:for-each>
                                                    </td>
                                                </tr>
                                            </xsl:if>
                                            <xsl:for-each select="n1:Invoice/cac:TaxRepresentativeParty/cac:PartyIdentification/cbc:ID[@schemeID='ARACIKURUMVKN']"> 
                                                <tr>
                                                    <td style="width:105px;" align="left">
                                                        <span style="font-weight:bold; ">
                                                            <xsl:text>Aracı Kurum VKN:</xsl:text>
                                                        </span>
                                                    </td>
                                                    <td style="width:110px;" align="left">
                                                        <xsl:value-of select="."/>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="width:105px;" align="left">
                                                        <span style="font-weight:bold; ">
                                                            <xsl:text>Aracı Kurum Unvan:</xsl:text>
                                                        </span>
                                                    </td>
                                                    <td style="width:110px;" align="left">
                                                        <xsl:value-of select="../../cac:PartyName/cbc:Name"/>
                                                    </td>
                                                </tr>
                                            </xsl:for-each>                                         
                                        </tbody>
                                    </table>
                                </td>
                            </tr>
                            <tr align="left">
                                <td align="left" valign="top" id="ettnTable">
                                    <span style="font-weight:bold; ">
                                        <xsl:text>ETTN:&#160;</xsl:text>
                                    </span>
                                    <xsl:for-each select="n1:Invoice/cbc:UUID">
                                        <xsl:apply-templates/>
                                    </xsl:for-each>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                    <div id="lineTableAligner">
                        <span>
                            <xsl:text>&#160;</xsl:text>
                        </span>
                    </div>
                    <table border="1" id="lineTable" width="800">
                        <tbody>
                            <tr class="lineTableTr">
                                <td class="lineTableTd" style="width:3%" align="center">
                                    <span style="font-weight:bold;">
                                        <xsl:text>Sıra No</xsl:text>
                                    </span>
                                </td>
                                <td class="lineTableTd" style="width:20%" align="center">
                                    <span style="font-weight:bold;">
                                        <xsl:text>Mal Hizmet</xsl:text>
                                    </span>
                                </td>
                                <td class="lineTableTd" style="width:7.4%" align="center">
                                    <span style="font-weight:bold;">
                                        <xsl:text>Miktar</xsl:text>
                                    </span>
                                </td>
                                <td class="lineTableTd" style="width:9%" align="center">
                                    <span style="font-weight:bold;">
                                        <xsl:text>Birim Fiyat</xsl:text>
                                    </span>
                                </td>

                                <td class="lineTableTd" style="width:7%" align="center">
                                    <span style="font-weight:bold;">
                                        <xsl:text>İskonto/ Arttırım Oranı</xsl:text>
                                    </span>
                                </td>
                                <td class="lineTableTd" style="width:9%" align="center">
                                    <span style="font-weight:bold;">
                                        <xsl:text>İskonto/ Arttırım Tutarı</xsl:text>
                                    </span>
                                </td>
                                <td class="lineTableTd" style="width:9%" align="center">
                                    <span style="font-weight:bold;">
                                        <xsl:text>İskonto/ Arttırım Nedeni</xsl:text>
                                    </span>
                                </td>

                                <td class="lineTableTd" style="width:7%" align="center">
                                    <span style="font-weight:bold;">
                                        <xsl:text>KDV Oranı</xsl:text>
                                    </span>
                                </td>
                                <td class="lineTableTd" style="width:10%" align="center">
                                    <span style="font-weight:bold;">
                                        <xsl:text>KDV Tutarı</xsl:text>
                                    </span>
                                </td>
                                <td class="lineTableTd" style="width:17%; " align="center">
                                    <span style="font-weight:bold;">
                                        <xsl:text>Diğer Vergiler</xsl:text>
                                    </span>
                                </td>
                                <td class="lineTableTd" style="width:10.6%" align="center">
                                    <span style="font-weight:bold;">
                                        <xsl:text>Mal Hizmet Tutarı</xsl:text>
                                    </span>
                                </td>
                                <xsl:if test="//n1:Invoice/cbc:ProfileID='IHRACAT' or //n1:Invoice/cbc:ProfileID='OZELFATURA'">
                                    <td class="lineTableTd" style="width:10.6%" align="center">
                                        <span style="font-weight:bold;">
                                            <xsl:text>Teslim Şartı</xsl:text>
                                        </span>
                                    </td>                                   
                                    <td class="lineTableTd" style="width:10.6%" align="center">
                                        <span style="font-weight:bold;">
                                            <xsl:text>Eşya Kap Cinsi</xsl:text>
                                        </span>
                                    </td>                                   
                                    <td class="lineTableTd" style="width:10.6%" align="center">
                                        <span style="font-weight:bold;">
                                            <xsl:text>Kap No</xsl:text>
                                        </span>
                                    </td>                                   
                                    <td class="lineTableTd" style="width:10.6%" align="center">
                                        <span style="font-weight:bold;">
                                            <xsl:text>Kap Adet</xsl:text>
                                        </span>
                                    </td>                                   
                                    <td class="lineTableTd" style="width:10.6%" align="center">
                                        <span style="font-weight:bold;">
                                            <xsl:text>Teslim/Bedel Ödeme Yeri</xsl:text>
                                        </span>
                                    </td>                                   
                                    <td class="lineTableTd" style="width:10.6%" align="center">
                                        <span style="font-weight:bold;">
                                            <xsl:text>Gönderilme Şekli</xsl:text>
                                        </span>
                                    </td>                                   
                                    <td class="lineTableTd" style="width:10.6%" align="center">
                                        <span style="font-weight:bold;">
                                            <xsl:text>GTİP</xsl:text>
                                        </span>
                                    </td>
                                    <td class="lineTableTd" style="width:10.6%" align="center">
                                        <span style="font-weight:bold;">
                                            <xsl:text>Byn. Edilen Kıymet Değeri</xsl:text>
                                        </span>
                                    </td>                                       
                                </xsl:if>
                            </tr>
                            <xsl:if test="count(//n1:Invoice/cac:InvoiceLine) &gt;= 20">
                                <xsl:for-each select="//n1:Invoice/cac:InvoiceLine">
                                    <xsl:apply-templates select="."/>
                                </xsl:for-each>
                            </xsl:if>
                            <xsl:if test="count(//n1:Invoice/cac:InvoiceLine) &lt; 20">
                                <xsl:choose>
                                    <xsl:when test="//n1:Invoice/cac:InvoiceLine[1]">
                                        <xsl:apply-templates
                                            select="//n1:Invoice/cac:InvoiceLine[1]"/>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <xsl:apply-templates select="//n1:Invoice"/>
                                    </xsl:otherwise>
                                </xsl:choose>
                                <xsl:choose>
                                    <xsl:when test="//n1:Invoice/cac:InvoiceLine[2]">
                                        <xsl:apply-templates
                                            select="//n1:Invoice/cac:InvoiceLine[2]"/>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <xsl:apply-templates select="//n1:Invoice"/>
                                    </xsl:otherwise>
                                </xsl:choose>
                                <xsl:choose>
                                    <xsl:when test="//n1:Invoice/cac:InvoiceLine[3]">
                                        <xsl:apply-templates
                                            select="//n1:Invoice/cac:InvoiceLine[3]"/>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <xsl:apply-templates select="//n1:Invoice"/>
                                    </xsl:otherwise>
                                </xsl:choose>
                                <xsl:choose>
                                    <xsl:when test="//n1:Invoice/cac:InvoiceLine[4]">
                                        <xsl:apply-templates
                                            select="//n1:Invoice/cac:InvoiceLine[4]"/>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <xsl:apply-templates select="//n1:Invoice"/>
                                    </xsl:otherwise>
                                </xsl:choose>
                                <xsl:choose>
                                    <xsl:when test="//n1:Invoice/cac:InvoiceLine[5]">
                                        <xsl:apply-templates
                                            select="//n1:Invoice/cac:InvoiceLine[5]"/>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <xsl:apply-templates select="//n1:Invoice"/>
                                    </xsl:otherwise>
                                </xsl:choose>
                                <xsl:choose>
                                    <xsl:when test="//n1:Invoice/cac:InvoiceLine[6]">
                                        <xsl:apply-templates
                                            select="//n1:Invoice/cac:InvoiceLine[6]"/>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <xsl:apply-templates select="//n1:Invoice"/>
                                    </xsl:otherwise>
                                </xsl:choose>
                                <xsl:choose>
                                    <xsl:when test="//n1:Invoice/cac:InvoiceLine[7]">
                                        <xsl:apply-templates
                                            select="//n1:Invoice/cac:InvoiceLine[7]"/>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <xsl:apply-templates select="//n1:Invoice"/>
                                    </xsl:otherwise>
                                </xsl:choose>
                                <xsl:choose>
                                    <xsl:when test="//n1:Invoice/cac:InvoiceLine[8]">
                                        <xsl:apply-templates
                                            select="//n1:Invoice/cac:InvoiceLine[8]"/>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <xsl:apply-templates select="//n1:Invoice"/>
                                    </xsl:otherwise>
                                </xsl:choose>
                                <xsl:choose>
                                    <xsl:when test="//n1:Invoice/cac:InvoiceLine[9]">
                                        <xsl:apply-templates
                                            select="//n1:Invoice/cac:InvoiceLine[9]"/>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <xsl:apply-templates select="//n1:Invoice"/>
                                    </xsl:otherwise>
                                </xsl:choose>
                                <xsl:choose>
                                    <xsl:when test="//n1:Invoice/cac:InvoiceLine[10]">
                                        <xsl:apply-templates
                                            select="//n1:Invoice/cac:InvoiceLine[10]"/>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <xsl:apply-templates select="//n1:Invoice"/>
                                    </xsl:otherwise>
                                </xsl:choose>
                                <xsl:choose>
                                    <xsl:when test="//n1:Invoice/cac:InvoiceLine[11]">
                                        <xsl:apply-templates
                                            select="//n1:Invoice/cac:InvoiceLine[11]"/>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <xsl:apply-templates select="//n1:Invoice"/>
                                    </xsl:otherwise>
                                </xsl:choose>
                                <xsl:choose>
                                    <xsl:when test="//n1:Invoice/cac:InvoiceLine[12]">
                                        <xsl:apply-templates
                                            select="//n1:Invoice/cac:InvoiceLine[12]"/>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <xsl:apply-templates select="//n1:Invoice"/>
                                    </xsl:otherwise>
                                </xsl:choose>
                                <xsl:choose>
                                    <xsl:when test="//n1:Invoice/cac:InvoiceLine[13]">
                                        <xsl:apply-templates
                                            select="//n1:Invoice/cac:InvoiceLine[13]"/>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <xsl:apply-templates select="//n1:Invoice"/>
                                    </xsl:otherwise>
                                </xsl:choose>
                                <xsl:choose>
                                    <xsl:when test="//n1:Invoice/cac:InvoiceLine[14]">
                                        <xsl:apply-templates
                                            select="//n1:Invoice/cac:InvoiceLine[14]"/>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <xsl:apply-templates select="//n1:Invoice"/>
                                    </xsl:otherwise>
                                </xsl:choose>
                                <xsl:choose>
                                    <xsl:when test="//n1:Invoice/cac:InvoiceLine[15]">
                                        <xsl:apply-templates
                                            select="//n1:Invoice/cac:InvoiceLine[15]"/>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <xsl:apply-templates select="//n1:Invoice"/>
                                    </xsl:otherwise>
                                </xsl:choose>
                                <xsl:choose>
                                    <xsl:when test="//n1:Invoice/cac:InvoiceLine[16]">
                                        <xsl:apply-templates
                                            select="//n1:Invoice/cac:InvoiceLine[16]"/>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <xsl:apply-templates select="//n1:Invoice"/>
                                    </xsl:otherwise>
                                </xsl:choose>
                                <xsl:choose>
                                    <xsl:when test="//n1:Invoice/cac:InvoiceLine[17]">
                                        <xsl:apply-templates
                                            select="//n1:Invoice/cac:InvoiceLine[17]"/>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <xsl:apply-templates select="//n1:Invoice"/>
                                    </xsl:otherwise>
                                </xsl:choose>
                                <xsl:choose>
                                    <xsl:when test="//n1:Invoice/cac:InvoiceLine[18]">
                                        <xsl:apply-templates
                                            select="//n1:Invoice/cac:InvoiceLine[18]"/>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <xsl:apply-templates select="//n1:Invoice"/>
                                    </xsl:otherwise>
                                </xsl:choose>
                                <xsl:choose>
                                    <xsl:when test="//n1:Invoice/cac:InvoiceLine[19]">
                                        <xsl:apply-templates
                                            select="//n1:Invoice/cac:InvoiceLine[19]"/>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <xsl:apply-templates select="//n1:Invoice"/>
                                    </xsl:otherwise>
                                </xsl:choose>
                                <xsl:choose>
                                    <xsl:when test="//n1:Invoice/cac:InvoiceLine[20]">
                                        <xsl:apply-templates
                                            select="//n1:Invoice/cac:InvoiceLine[20]"/>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <xsl:apply-templates select="//n1:Invoice"/>
                                    </xsl:otherwise>
                                </xsl:choose>
                            </xsl:if>
                        </tbody>
                    </table>
                </xsl:for-each>
                <table id="budgetContainerTable" width="800px">
                    <tr align="right">
                        <td/>
                        <td class="lineTableBudgetTd" align="right" width="200px">
                            <span style="font-weight:bold; ">
                                <xsl:text>Mal Hizmet Toplam Tutarı</xsl:text>
                            </span>
                        </td>
                        <td class="lineTableBudgetTd" style="width:81px; " align="right">
                            <xsl:for-each select="n1:Invoice/cac:LegalMonetaryTotal/cbc:LineExtensionAmount">
                                <xsl:call-template name="Curr_Type"/>
                            </xsl:for-each>
                        </td>
                    </tr>
                    <xsl:for-each select="n1:Invoice/cac:TaxTotal/cac:TaxSubtotal">
                        <xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:TaxTypeCode = '4171'">
                            <tr align="right">
                                <td/>
                                <td class="lineTableBudgetTd" align="right" width="200px">
                                    <span style="font-weight:bold; ">
                                        <xsl:text>Teslim Bedeli</xsl:text>
                                    </span>
                                </td>
                                <td class="lineTableBudgetTd" style="width:81px; " align="right">
                                    <xsl:for-each select="//n1:Invoice/cac:LegalMonetaryTotal/cbc:LineExtensionAmount">
                                        <xsl:call-template name="Curr_Type"/>
                                    </xsl:for-each>
                                </td>
                            </tr>
                        </xsl:if>
                    </xsl:for-each>
                    <tr align="right">
                        <td/>
                        <xsl:choose>
                            <xsl:when test="//n1:Invoice/cac:AllowanceCharge/cbc:ChargeIndicator='true'">
                                <td class="lineTableBudgetTd" align="right" width="200px">
                                    <span style="font-weight:bold; ">
                                        <xsl:text>Toplam Arttırım - </xsl:text>
                                        <xsl:for-each select="n1:Invoice/cac:AllowanceCharge/cbc:AllowanceChargeReason">
                                            <xsl:apply-templates/>
                                        </xsl:for-each>
                                    </span>
                                </td>
                            </xsl:when>
                            <xsl:otherwise>
                                <td class="lineTableBudgetTd" align="right" width="200px">
                                    <span style="font-weight:bold; ">
                                        <xsl:text>Toplam İskonto</xsl:text>
                                    </span>
                                </td>                               
                            </xsl:otherwise>
                        </xsl:choose>
                        <td class="lineTableBudgetTd" style="width:81px; " align="right">
                            <xsl:for-each select="n1:Invoice/cac:LegalMonetaryTotal/cbc:AllowanceTotalAmount">
                                <xsl:call-template name="Curr_Type"/>
                            </xsl:for-each>
                        </td>
                    </tr>
                    <xsl:for-each select="n1:Invoice/cac:TaxTotal/cac:TaxSubtotal">
                        <tr align="right">
                            <td/>
                            <td class="lineTableBudgetTd" width="211px" align="right">
                                <span style="font-weight:bold; ">
                                    <xsl:text>Hesaplanan </xsl:text>
                                    <xsl:value-of select="cac:TaxCategory/cac:TaxScheme/cbc:Name"/>
                                    <xsl:if test="../../cbc:InvoiceTypeCode!='OZELMATRAH'">
                                        <xsl:text>(%</xsl:text>
                                        <xsl:value-of select="cbc:Percent"/>
                                        <xsl:text>)</xsl:text>
                                    </xsl:if>
                                </span>
                            </td>
                            <td class="lineTableBudgetTd" style="width:82px; " align="right">
                                <xsl:if test="../../cbc:InvoiceTypeCode='OZELMATRAH'">
                                    <xsl:text> </xsl:text>
                                    <xsl:text>DAHİLDİR</xsl:text>
                                </xsl:if>
                                <xsl:if test="../../cbc:InvoiceTypeCode!='OZELMATRAH'">
                                    <xsl:for-each select="cac:TaxCategory/cac:TaxScheme">
                                        <xsl:text> </xsl:text>
                                        <xsl:value-of
                                            select="format-number(../../cbc:TaxAmount, '###.##0,00', 'european')"/>
                                        <xsl:if test="../../cbc:TaxAmount/@currencyID">
                                            <xsl:text> </xsl:text>
                                            <xsl:if test="../../cbc:TaxAmount/@currencyID = 'TRL' or ../../cbc:TaxAmount/@currencyID = 'TRY'">
                                                <xsl:text>TL</xsl:text>
                                            </xsl:if>
                                            <xsl:if test="../../cbc:TaxAmount/@currencyID != 'TRL' and ../../cbc:TaxAmount/@currencyID != 'TRY'">
                                                <xsl:value-of select="../../cbc:TaxAmount/@currencyID"/>
                                            </xsl:if>
                                        </xsl:if>
                                    </xsl:for-each>
                                </xsl:if>
                            </td>
                        </tr>
                    </xsl:for-each>
                    <xsl:for-each select="n1:Invoice/cac:TaxTotal/cac:TaxSubtotal">
                        <xsl:if test="cac:TaxCategory/cac:TaxScheme/cbc:TaxTypeCode = '4171'">
                            <tr align="right">
                                <td/>
                                <td class="lineTableBudgetTd" align="right" width="200px">
                                    <span style="font-weight:bold; ">
                                        <xsl:text>KDV Matrahı</xsl:text>
                                    </span>
                                </td>
                                <td class="lineTableBudgetTd" style="width:81px; " align="right">
                                    <xsl:value-of
                                            select="format-number(sum(//n1:Invoice/cac:TaxTotal/cac:TaxSubtotal[cac:TaxCategory/cac:TaxScheme/cbc:TaxTypeCode=0015]/cbc:TaxableAmount), '###.##0,00', 'european')"/>                                        
                                    <xsl:if
                                        test="//n1:Invoice/cac:LegalMonetaryTotal/cbc:TaxInclusiveAmount/@currencyID">
                                        <xsl:text> </xsl:text>
                                        <xsl:if
                                            test="//n1:Invoice/cac:LegalMonetaryTotal/cbc:TaxInclusiveAmount/@currencyID = 'TRL' or //n1:Invoice/cac:LegalMonetaryTotal/cbc:TaxInclusiveAmount/@currencyID = 'TRY'">
                                            <xsl:text>TL</xsl:text>
                                        </xsl:if>
                                        <xsl:if
                                            test="//n1:Invoice/cac:LegalMonetaryTotal/cbc:TaxInclusiveAmount/@currencyID != 'TRL' and //n1:Invoice/cac:LegalMonetaryTotal/cbc:TaxInclusiveAmount/@currencyID != 'TRY'">
                                            <xsl:value-of
                                                select="//n1:Invoice/cac:LegalMonetaryTotal/cbc:TaxInclusiveAmount/@currencyID"
                                            />
                                        </xsl:if>
                                    </xsl:if>
                                </td>
                            </tr>
                            <tr align="right">
                                <td/>
                                <td class="lineTableBudgetTd" align="right" width="200px">
                                    <span style="font-weight:bold; ">
                                        <xsl:text>Tevkifat Dahil Toplam Tutar</xsl:text>
                                    </span>
                                </td>
                                <td class="lineTableBudgetTd" style="width:81px; " align="right">
                                    <xsl:for-each select="//n1:Invoice/cac:LegalMonetaryTotal/cbc:TaxInclusiveAmount">
                                        <xsl:call-template name="Curr_Type"/>
                                    </xsl:for-each>
                                </td>
                            </tr>
                            <tr align="right">
                                <td/>
                                <td class="lineTableBudgetTd" align="right" width="200px">
                                    <span style="font-weight:bold; ">
                                        <xsl:text>Tevkifat Hariç Toplam Tutar</xsl:text>
                                    </span>
                                </td>
                                <td class="lineTableBudgetTd" style="width:81px; " align="right">
                                    <xsl:for-each select="//n1:Invoice/cac:LegalMonetaryTotal/cbc:PayableAmount">
                                        <xsl:call-template name="Curr_Type"/>
                                    </xsl:for-each>
                                </td>
                            </tr>
                        </xsl:if>                       
                    </xsl:for-each>
                    <xsl:for-each select="n1:Invoice/cac:WithholdingTaxTotal/cac:TaxSubtotal">
                        <tr align="right">
                            <td/>
                            <td class="lineTableBudgetTd" width="211px" align="right">
                                <span style="font-weight:bold; ">
                                    <xsl:text>Hesaplanan KDV Tevkifat</xsl:text>
                                    <xsl:text>(%</xsl:text>
                                    <xsl:value-of select="cbc:Percent"/>
                                    <xsl:text>)</xsl:text>
                                </span>
                            </td>
                            <td class="lineTableBudgetTd" style="width:82px; " align="right">
                                <xsl:for-each select="cac:TaxCategory/cac:TaxScheme">
                                    <xsl:text> </xsl:text>
                                    <xsl:value-of
                                        select="format-number(../../cbc:TaxAmount, '###.##0,00', 'european')"/>
                                    <xsl:if test="../../cbc:TaxAmount/@currencyID">
                                        <xsl:text> </xsl:text>
                                        <xsl:if test="../../cbc:TaxAmount/@currencyID = 'TRL' or ../../cbc:TaxAmount/@currencyID = 'TRY'">
                                            <xsl:text>TL</xsl:text>
                                        </xsl:if>
                                        <xsl:if test="../../cbc:TaxAmount/@currencyID != 'TRL' and ../../cbc:TaxAmount/@currencyID != 'TRY'">
                                            <xsl:value-of select="../../cbc:TaxAmount/@currencyID"/>
                                        </xsl:if>
                                    </xsl:if>
                                </xsl:for-each>
                            </td>
                        </tr>
                    </xsl:for-each>
                    <xsl:if
                        test="sum(n1:Invoice/cac:TaxTotal/cac:TaxSubtotal[cac:TaxCategory/cac:TaxScheme/cbc:TaxTypeCode=9015]/cbc:TaxableAmount)>0">
                        <tr align="right">
                            <td/>
                            <td class="lineTableBudgetTd" width="211px" align="right">
                                <span style="font-weight:bold; ">
                                    <xsl:text>Tevkifata Tabi İşlem Tutarı</xsl:text>
                                </span>
                            </td>
                            <td class="lineTableBudgetTd" style="width:82px; " align="right">
                                <xsl:value-of
                                    select="format-number(sum(n1:Invoice/cac:InvoiceLine[cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme/cbc:TaxTypeCode=9015]/cbc:LineExtensionAmount), '###.##0,00', 'european')"/>
                                <xsl:if test="n1:Invoice/cbc:DocumentCurrencyCode = 'TRL'">
                                    <xsl:text>TL</xsl:text>
                                </xsl:if>
                                <xsl:if test="n1:Invoice/cbc:DocumentCurrencyCode != 'TRL'">
                                    <xsl:value-of select="n1:Invoice/cbc:DocumentCurrencyCode"/>
                                </xsl:if>
                            </td>
                        </tr>
                        <tr align="right">
                            <td/>
                            <td class="lineTableBudgetTd" width="211px" align="right">
                                <span style="font-weight:bold; ">
                                    <xsl:text>Tevkifata Tabi İşlem Üzerinden Hes. KDV</xsl:text>
                                </span>
                            </td>
                            <td class="lineTableBudgetTd" style="width:82px; " align="right">
                                <xsl:value-of
                                    select="format-number(sum(n1:Invoice/cac:TaxTotal/cac:TaxSubtotal[cac:TaxCategory/cac:TaxScheme/cbc:TaxTypeCode=9015]/cbc:TaxableAmount), '###.##0,00', 'european')"/>
                                <xsl:if test="n1:Invoice/cbc:DocumentCurrencyCode = 'TRL'">
                                    <xsl:text>TL</xsl:text>
                                </xsl:if>
                                <xsl:if test="n1:Invoice/cbc:DocumentCurrencyCode != 'TRL'">
                                    <xsl:value-of select="n1:Invoice/cbc:DocumentCurrencyCode"/>
                                </xsl:if>
                            </td>
                        </tr>
                    </xsl:if>                   
                    <xsl:if test = "n1:Invoice/cac:InvoiceLine[cac:WithholdingTaxTotal/cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme]">
                        <tr align="right">
                            <td/>
                            <td class="lineTableBudgetTd" width="211px" align="right">
                                <span style="font-weight:bold; ">
                                    <xsl:text>Tevkifata Tabi İşlem Tutarı</xsl:text>
                                </span>
                            </td>
                            <td class="lineTableBudgetTd" style="width:82px; " align="right">
                                <xsl:if test = "n1:Invoice/cac:InvoiceLine[cac:WithholdingTaxTotal/cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme]">
                                    <xsl:value-of
                                        select="format-number(sum(n1:Invoice/cac:InvoiceLine[cac:WithholdingTaxTotal/cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme]/cbc:LineExtensionAmount), '###.##0,00', 'european')"/>
                                </xsl:if>
                                <xsl:if test = "//n1:Invoice/cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme/cbc:TaxTypeCode=&apos;9015&apos;">
                                    <xsl:value-of
                                        select="format-number(sum(n1:Invoice/cac:InvoiceLine[cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme/cbc:TaxTypeCode=9015]/cbc:LineExtensionAmount), '###.##0,00', 'european')"/>
                                </xsl:if>                               
                                <xsl:if test="n1:Invoice/cbc:DocumentCurrencyCode = 'TRL' or n1:Invoice/cbc:DocumentCurrencyCode = 'TRY'">
                                    <xsl:text>TL</xsl:text>
                                </xsl:if>
                                <xsl:if test="n1:Invoice/cbc:DocumentCurrencyCode != 'TRL' and n1:Invoice/cbc:DocumentCurrencyCode != 'TRY'">
                                    <xsl:value-of select="n1:Invoice/cbc:DocumentCurrencyCode"/>
                                </xsl:if>
                            </td>
                        </tr>
                        <tr align="right">
                            <td/>
                            <td class="lineTableBudgetTd" width="211px" align="right">
                                <span style="font-weight:bold; ">
                                    <xsl:text>Tevkifata Tabi İşlem Üzerinden Hes. KDV</xsl:text>
                                </span>
                            </td>
                            <td class="lineTableBudgetTd" style="width:82px; " align="right">
                                <xsl:if test = "n1:Invoice/cac:InvoiceLine[cac:WithholdingTaxTotal/cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme]">
                                    <xsl:value-of
                                        select="format-number(sum(n1:Invoice/cac:WithholdingTaxTotal/cac:TaxSubtotal[cac:TaxCategory/cac:TaxScheme]/cbc:TaxableAmount), '###.##0,00', 'european')"/>
                                </xsl:if>
                                <xsl:if test = "//n1:Invoice/cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme/cbc:TaxTypeCode=&apos;9015&apos;">
                                    <xsl:value-of
                                        select="format-number(sum(n1:Invoice/cac:TaxTotal/cac:TaxSubtotal[cac:TaxCategory/cac:TaxScheme/cbc:TaxTypeCode=9015]/cbc:TaxableAmount), '###.##0,00', 'european')"/>
                                </xsl:if>
                                <xsl:if test="n1:Invoice/cbc:DocumentCurrencyCode = 'TRL' or n1:Invoice/cbc:DocumentCurrencyCode = 'TRY'">
                                    <xsl:text>TL</xsl:text>
                                </xsl:if>
                                <xsl:if test="n1:Invoice/cbc:DocumentCurrencyCode != 'TRL' and n1:Invoice/cbc:DocumentCurrencyCode != 'TRY'">
                                    <xsl:value-of select="n1:Invoice/cbc:DocumentCurrencyCode"/>
                                </xsl:if>
                            </td>
                        </tr>
                    </xsl:if>
                    <tr align="right">
                        <td/>
                        <td class="lineTableBudgetTd" width="200px" align="right">
                            <span style="font-weight:bold; ">
                                <xsl:text>Vergiler Dahil Toplam Tutar</xsl:text>
                            </span>
                        </td>
                        <td class="lineTableBudgetTd" style="width:82px; " align="right">
                            <xsl:for-each select="n1:Invoice/cac:LegalMonetaryTotal/cbc:TaxInclusiveAmount">
                                <xsl:call-template name="Curr_Type"/>
                            </xsl:for-each>
                        </td>
                    </tr>
                    <tr align="right">
                        <td/>
                        <td class="lineTableBudgetTd" width="200px" align="right">
                            <span style="font-weight:bold; ">
                                <xsl:text>Ödenecek Tutar</xsl:text>
                            </span>
                        </td>
                        <td class="lineTableBudgetTd" style="width:82px; " align="right">
                            <xsl:for-each select="n1:Invoice/cac:LegalMonetaryTotal/cbc:PayableAmount">
                                <xsl:call-template name="Curr_Type"/>
                            </xsl:for-each>
                        </td>
                    </tr>
                    <xsl:for-each select="n1:Invoice/cac:Delivery/cac:Shipment/cbc:DeclaredCustomsValueAmount">
                        <tr align="right">                      
                            <td/>
                            <td class="lineTableBudgetTd" width="200px" align="right">
                                <span style="font-weight:bold; ">
                                    <xsl:text>Toplam Byn. Edl. Kıymet Değeri</xsl:text>
                                </span>
                            </td>
                            <td class="lineTableBudgetTd" style="width:82px; " align="right">
                                <xsl:call-template name="Curr_Type"/>
                            </td>
                        </tr>
                    </xsl:for-each>
                    <xsl:for-each select="n1:Invoice/cac:TaxTotal/cac:TaxSubtotal">
                        <xsl:if test="//n1:Invoice/cbc:DocumentCurrencyCode != 'TRY' and //n1:Invoice/cbc:DocumentCurrencyCode != 'TRL'">
                            <tr align="right">
                                <td/>
                                <td class="lineTableBudgetTd" align="right" width="200px">
                                    <span style="font-weight:bold; ">
                                        <xsl:text>Hesaplanan </xsl:text>
                                        <xsl:value-of select="cac:TaxCategory/cac:TaxScheme/cbc:Name"/>
                                        <xsl:text>(%</xsl:text>
                                        <xsl:value-of select="cbc:Percent"/>
                                        <xsl:text>) (TL)</xsl:text>
                                    </span>
                                </td>
                                <td class="lineTableBudgetTd" style="width:81px; " align="right">
                                    <span>
                                        <xsl:value-of
                                            select="format-number(cbc:TaxAmount * //n1:Invoice/cac:PricingExchangeRate/cbc:CalculationRate, '###.##0,00', 'european')"/>
                                        <xsl:text> TL</xsl:text>
                                    </span>
                                </td>
                            </tr>
                        </xsl:if>
                    </xsl:for-each>                 
                    <xsl:if
                        test="//n1:Invoice/cac:LegalMonetaryTotal/cbc:LineExtensionAmount/@currencyID != 'TRL' and //n1:Invoice/cac:LegalMonetaryTotal/cbc:LineExtensionAmount/@currencyID != 'TRY'">
                        <tr align="right">
                            <td/>
                            <td class="lineTableBudgetTd" align="right" width="200px">
                                <span style="font-weight:bold; ">
                                    <xsl:text>Mal Hizmet Toplam Tutarı(TL)</xsl:text>
                                </span>
                            </td>
                            <td class="lineTableBudgetTd" style="width:81px; " align="right">
                                <xsl:value-of
                                    select="format-number(//n1:Invoice/cac:LegalMonetaryTotal/cbc:LineExtensionAmount * //n1:Invoice/cac:PricingExchangeRate/cbc:CalculationRate, '###.##0,00', 'european')"/>
                                <xsl:text> TL</xsl:text>
                            </td>
                        </tr>
                        <tr align="right">
                            <td/>
                            <td class="lineTableBudgetTd" width="200px" align="right">
                                <span style="font-weight:bold; ">
                                    <xsl:text>Vergiler Dahil Toplam Tutar(TL)</xsl:text>
                                </span>
                            </td>
                            <td class="lineTableBudgetTd" style="width:82px; " align="right">
                                <xsl:value-of
                                    select="format-number(//n1:Invoice/cac:LegalMonetaryTotal/cbc:TaxInclusiveAmount * //n1:Invoice/cac:PricingExchangeRate/cbc:CalculationRate, '###.##0,00', 'european')"/>
                                <xsl:text> TL</xsl:text>
                            </td>
                        </tr>
                        <tr align="right">
                            <td/>
                            <td class="lineTableBudgetTd" width="200px" align="right">
                                <span style="font-weight:bold; ">
                                    <xsl:text>Ödenecek Tutar(TL)</xsl:text>
                                </span>
                            </td>
                            <td class="lineTableBudgetTd" style="width:82px; " align="right">
                                <xsl:value-of
                                    select="format-number(//n1:Invoice/cac:LegalMonetaryTotal/cbc:PayableAmount * //n1:Invoice/cac:PricingExchangeRate/cbc:CalculationRate, '###.##0,00', 'european')"/>
                                <xsl:text> TL</xsl:text>
                            </td>
                        </tr>
                    </xsl:if>
                </table>
                <br/>
                <xsl:if test="//n1:Invoice/cac:BillingReference/cac:InvoiceDocumentReference/cbc:DocumentTypeCode[text()='İADE' or text()='IADE']">
                    <table id="lineTable" width="800">
                        <thead>
                            <tr>
                                <td align="left"><span style="font-weight:bold; " align="center">&#160;&#160;&#160;&#160;&#160;İadeye Konu Olan Faturalar</span></td>                           
                            </tr>
                        </thead>                    
                        <tbody>
                            <tr align="left" class="lineTableTr">                           
                                <td class="lineTableTd">
                                    <span style="font-weight:bold; " align="center">&#160;&#160;&#160;&#160;&#160;Fatura No</span>
                                </td>
                                <td class="lineTableTd"><span style="font-weight:bold; " align="center">&#160;&#160;&#160;&#160;&#160;Tarih</span></td>
                            </tr>
                            <xsl:for-each select="//n1:Invoice/cac:BillingReference/cac:InvoiceDocumentReference/cbc:DocumentTypeCode[text()='İADE' or text()='IADE']">
                                <tr align="left" class="lineTableTr">
                                    <td class="lineTableTd">&#160;&#160;&#160;&#160;&#160;
                                        <xsl:value-of select="../cbc:ID"/> 
                                    </td>
                                    <td class="lineTableTd">&#160;&#160;&#160;&#160;&#160;
                                        <xsl:for-each select="../cbc:IssueDate">
                                            <xsl:apply-templates select="."/>
                                        </xsl:for-each> 
                                    </td>
                                </tr>
                            </xsl:for-each>
                        </tbody>
                    </table>
                </xsl:if>
                <br/>
                <xsl:if test="//n1:Invoice/cac:BillingReference/cac:AdditionalDocumentReference/cbc:DocumentTypeCode='OKCBF'">
                    <table border="1" id="lineTable" width="800">
                        <thead>
                            <tr>
                                <th colspan="6">ÖKC Bilgileri</th>
                            </tr>
                        </thead>                            
                        <tbody>
                            <tr id="okcbfHeadTr" style="font-weight:bold;">
                                <td style="width:20%">
                                    <xsl:text>Fiş Numarası</xsl:text>
                                </td>
                                <td style="width:10%" align="center">
                                    <xsl:text>Fiş Tarihi</xsl:text>
                                </td>
                                <td style="width:10%" align="center">
                                    <xsl:text>Fiş Saati</xsl:text>
                                </td>
                                <td style="width:40%" align="center">
                                    <xsl:text>Fiş Tipi</xsl:text>
                                </td>
                                <td style="width:10%" align="center">
                                    <xsl:text>Z Rapor No</xsl:text>
                                </td>
                                <td style="width:10%" align="center">
                                    <xsl:text>ÖKC Seri No</xsl:text>
                                </td>
                            </tr>                       
                        </tbody>
                        <xsl:for-each select="//n1:Invoice/cac:BillingReference/cac:AdditionalDocumentReference/cbc:DocumentTypeCode[text()='OKCBF']">
                            <tr>
                                <td style="width:20%">
                                    <xsl:value-of select="../cbc:ID"/>
                                </td>
                                <td style="width:10%" align="center">
                                    <xsl:value-of select="../cbc:IssueDate"/>
                                </td>
                                <td style="width:10%" align="center">
                                    <xsl:value-of select="substring(../cac:ValidityPeriod/cbc:StartTime,1,5)"/>
                                </td>
                                <td style="width:40%" align="center">
                                    <xsl:choose>
                                        <xsl:when test="../cbc:DocumentDescription='AVANS'">
                                            <xsl:text>Ön Tahsilat(Avans) Bilgi Fişi</xsl:text>
                                        </xsl:when>
                                        <xsl:when test="../cbc:DocumentDescription='YEMEK_FIS'">
                                            <xsl:text>Yemek Fişi/Kartı ile Yapılan Tahsilat Bilgi Fişi</xsl:text>
                                        </xsl:when>
                                        <xsl:when test="../cbc:DocumentDescription='E-FATURA'">
                                            <xsl:text>E-Fatura Bilgi Fişi</xsl:text>
                                        </xsl:when>
                                        <xsl:when test="../cbc:DocumentDescription='E-FATURA_IRSALIYE'">
                                            <xsl:text>İrsaliye Yerine Geçen E-Fatura Bilgi Fişi</xsl:text>
                                        </xsl:when>
                                        <xsl:when test="../cbc:DocumentDescription='E-ARSIV'">
                                            <xsl:text>E-Arşiv Bilgi Fişi</xsl:text>
                                        </xsl:when>
                                        <xsl:when test="../cbc:DocumentDescription='E-ARSIV_IRSALIYE'">
                                            <xsl:text>İrsaliye Yerine Geçen E-Arşiv Bilgi Fişi</xsl:text>
                                        </xsl:when>
                                        <xsl:when test="../cbc:DocumentDescription='FATURA'">
                                            <xsl:text>Faturalı Satış Bilgi Fişi</xsl:text>
                                        </xsl:when>
                                        <xsl:when test="../cbc:DocumentDescription='OTOPARK'">
                                            <xsl:text>Otopark Giriş Bilgi Fişi</xsl:text>
                                        </xsl:when>
                                        <xsl:when test="../cbc:DocumentDescription='FATURA_TAHSILAT'">
                                            <xsl:text>Fatura Tahsilat Bilgi Fişi</xsl:text>
                                        </xsl:when>
                                        <xsl:when test="../cbc:DocumentDescription='FATURA_TAHSILAT_KOMISYONLU'">
                                            <xsl:text>Komisyonlu Fatura Tahsilat Bilgi Fişi</xsl:text>
                                        </xsl:when>
                                        <xsl:otherwise>
                                            <xsl:text> </xsl:text>
                                        </xsl:otherwise>
                                    </xsl:choose>
                                </td>
                                <td style="width:10%" align="center">
                                    <xsl:value-of select="../cac:Attachment/cac:ExternalReference/cbc:URI"/>
                                </td>
                                <td style="width:10%" align="center">
                                    <xsl:value-of select="../cac:IssuerParty/cbc:EndpointID"/>
                                </td>
                            </tr>                                                   
                        </xsl:for-each>
                    </table>
                    <br/>
                </xsl:if>               
                <table id="notesTable" width="800" align="left">
                    <tbody>
                        <tr align="left">
                            <td id="notesTableTd" height="100">
                                <xsl:for-each select="//n1:Invoice/cac:TaxTotal/cac:TaxSubtotal">
                                    <xsl:if test="(cac:TaxCategory/cac:TaxScheme/cbc:TaxTypeCode='0015' or ../../cbc:InvoiceTypeCode='OZELMATRAH') and cac:TaxCategory/cbc:TaxExemptionReason">                                 
                                        <b>&#160;&#160;&#160;&#160;&#160; Vergi İstisna Muafiyet Sebebi: </b>
                                        <xsl:value-of select="cac:TaxCategory/cbc:TaxExemptionReasonCode"/>
                                        <xsl:text>-</xsl:text>
                                        <xsl:value-of select="cac:TaxCategory/cbc:TaxExemptionReason"/>
                                        <br/>
                                    </xsl:if>
                                    <xsl:if test="starts-with(cac:TaxCategory/cac:TaxScheme/cbc:TaxTypeCode,'007') and cac:TaxCategory/cbc:TaxExemptionReason">                                 
                                        <b>&#160;&#160;&#160;&#160;&#160; ÖTV İstisna Muafiyet Sebebi: </b>
                                        <xsl:value-of select="cac:TaxCategory/cbc:TaxExemptionReasonCode"/>
                                        <xsl:text>-</xsl:text>
                                        <xsl:value-of select="cac:TaxCategory/cbc:TaxExemptionReason"/>
                                        <br/>
                                    </xsl:if>
                                </xsl:for-each>
                                <xsl:for-each select="//n1:Invoice/cac:WithholdingTaxTotal/cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme">
                                    <b>&#160;&#160;&#160;&#160;&#160; Tevkifat Sebebi: </b>
                                    <xsl:value-of select="cbc:TaxTypeCode"/>
                                    <xsl:text>-</xsl:text>
                                    <xsl:value-of select="cbc:Name"/>
                                    <br/>
                                </xsl:for-each>
                                <xsl:for-each select="//n1:Invoice/cbc:Note">
                                    <b>&#160;&#160;&#160;&#160;&#160; Not: </b>
                                    <xsl:value-of select="."/>  
                                    <br/>
                                </xsl:for-each>                                 
                                <xsl:if test="//n1:Invoice/cac:PaymentMeans/cbc:InstructionNote">
                                    <b>&#160;&#160;&#160;&#160;&#160; Ödeme Notu: </b>
                                    <xsl:value-of
                                        select="//n1:Invoice/cac:PaymentMeans/cbc:InstructionNote"/>
                                    <br/>
                                </xsl:if>
                                <xsl:if
                                    test="//n1:Invoice/cac:PaymentMeans/cac:PayeeFinancialAccount/cbc:PaymentNote">
                                    <b>&#160;&#160;&#160;&#160;&#160; Hesap Açıklaması: </b>
                                    <xsl:value-of
                                        select="//n1:Invoice/cac:PaymentMeans/cac:PayeeFinancialAccount/cbc:PaymentNote"/>
                                    <br/>
                                </xsl:if>
                                <xsl:if test="//n1:Invoice/cac:PaymentTerms/cbc:Note">
                                    <b>&#160;&#160;&#160;&#160;&#160; Ödeme Koşulu: </b>
                                    <xsl:value-of select="//n1:Invoice/cac:PaymentTerms/cbc:Note"/>
                                    <br/>
                                </xsl:if>
                                <xsl:if test="//n1:Invoice/cac:BuyerCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID[@schemeID='PARTYTYPE']='TAXFREE' and //n1:Invoice/cac:TaxRepresentativeParty/cac:PartyTaxScheme/cbc:ExemptionReasonCode">
                                    <br/>
                                    <b>&#160;&#160;&#160;&#160;&#160; VAT OFF - NO CASH REFUND </b>
                                </xsl:if>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </body>
        </html>
    </xsl:template>
    <xsl:template match="//n1:Invoice/cac:InvoiceLine">
        <tr class="lineTableTr">
            <td class="lineTableTd">
                <xsl:text>&#160;</xsl:text>
                <xsl:value-of select="./cbc:ID"/>
            </td>
            <td class="lineTableTd">
                <xsl:text>&#160;</xsl:text>
                <xsl:value-of select="./cac:Item/cbc:Name"/>
            </td>
            <td class="lineTableTd" align="right">
                <xsl:text>&#160;</xsl:text>
                <xsl:value-of
                    select="format-number(./cbc:InvoicedQuantity, '###.###,####', 'european')"/>
                <xsl:if test="./cbc:InvoicedQuantity/@unitCode">
                    <xsl:for-each select="./cbc:InvoicedQuantity">
                        <xsl:text> </xsl:text>
                        <xsl:choose>
                            <xsl:when test="@unitCode  = 'TNE'">
                                <xsl:text>ton</xsl:text>
                            </xsl:when>
                            <xsl:when test="@unitCode  = 'BX'">
                                <xsl:text>Kutu</xsl:text>
                            </xsl:when>
                            <xsl:when test="@unitCode  = 'LTR'">
                                <xsl:text>lt</xsl:text>
                            </xsl:when>
                            <xsl:when test="@unitCode  = 'C62'">
                                <xsl:text>Adet</xsl:text>
                            </xsl:when>
                            <xsl:when test="@unitCode  = 'KGM'">
                                <xsl:text>kg</xsl:text>
                            </xsl:when>
                            <xsl:when test="@unitCode  = 'KJO'">
                                <xsl:text>kJ</xsl:text>
                            </xsl:when>
                            <xsl:when test="@unitCode  = 'GRM'">
                                <xsl:text>g</xsl:text>
                            </xsl:when>
                            <xsl:when test="@unitCode  = 'MGM'">
                                <xsl:text>mg</xsl:text>
                            </xsl:when>
                            <xsl:when test="@unitCode  = 'NT'">
                                <xsl:text>Net Ton</xsl:text>
                            </xsl:when>
                            <xsl:when test="@unitCode  = 'GT'">
                                <xsl:text>Gross Ton</xsl:text>
                            </xsl:when>
                            <xsl:when test="@unitCode  = 'MTR'">
                                <xsl:text>m</xsl:text>
                            </xsl:when>
                            <xsl:when test="@unitCode  = 'MMT'">
                                <xsl:text>mm</xsl:text>
                            </xsl:when>
                            <xsl:when test="@unitCode  = 'KTM'">
                                <xsl:text>km</xsl:text>
                            </xsl:when>
                            <xsl:when test="@unitCode  = 'MLT'">
                                <xsl:text>ml</xsl:text>
                            </xsl:when>
                            <xsl:when test="@unitCode  = 'MMQ'">
                                <xsl:text>mm3</xsl:text>
                            </xsl:when>
                            <xsl:when test="@unitCode  = 'CLT'">
                                <xsl:text>cl</xsl:text>
                            </xsl:when>
                            <xsl:when test="@unitCode  = 'CMK'">
                                <xsl:text>cm2</xsl:text>
                            </xsl:when>
                            <xsl:when test="@unitCode  = 'CMQ'">
                                <xsl:text>cm3</xsl:text>
                            </xsl:when>
                            <xsl:when test="@unitCode  = 'CMT'">
                                <xsl:text>cm</xsl:text>
                            </xsl:when>
                            <xsl:when test="@unitCode  = 'MTK'">
                                <xsl:text>m2</xsl:text>
                            </xsl:when>
                            <xsl:when test="@unitCode  = 'MTQ'">
                                <xsl:text>m3</xsl:text>
                            </xsl:when>
                            <xsl:when test="@unitCode  = 'DAY'">
                                <xsl:text> Gün</xsl:text>
                            </xsl:when>
                            <xsl:when test="@unitCode  = 'MON'">
                                <xsl:text> Ay</xsl:text>
                            </xsl:when>
                            <xsl:when test="@unitCode  = 'PA'">
                                <xsl:text> Paket</xsl:text>
                            </xsl:when>
                            <xsl:when test="@unitCode  = 'KWH'">
                                <xsl:text> KWH</xsl:text>
                            </xsl:when>
                            <xsl:when test="@unitCode  = 'ANN'">
                                <xsl:text> Yıl</xsl:text>
                            </xsl:when>
                            <xsl:when test="@unitCode  = 'HUR'">
                                <xsl:text> Saat</xsl:text>
                            </xsl:when>
                            <xsl:when test="@unitCode  = 'D61'">
                                <xsl:text> Dakika</xsl:text>
                            </xsl:when>
                            <xsl:when test="@unitCode  = 'D62'">
                                <xsl:text> Saniye</xsl:text>
                            </xsl:when>
                            <xsl:when test="@unitCode  = 'CCT'">
                                <xsl:text> Ton baş.taşıma kap.</xsl:text>
                            </xsl:when>
                            <xsl:when test="@unitCode  = 'D30'">
                                <xsl:text> Brüt kalori</xsl:text>
                            </xsl:when>
                            <xsl:when test="@unitCode  = 'D40'">
                                <xsl:text> 1000 lt</xsl:text>
                            </xsl:when>
                            <xsl:when test="@unitCode  = 'LPA'">
                                <xsl:text> saf alkol lt</xsl:text>
                            </xsl:when>
                            <xsl:when test="@unitCode  = 'B32'">
                                <xsl:text> kg.m2</xsl:text>
                            </xsl:when>
                            <xsl:when test="@unitCode  = 'NCL'">
                                <xsl:text> hücre adet</xsl:text>
                            </xsl:when>
                            <xsl:when test="@unitCode  = 'PR'">
                                <xsl:text> Çift</xsl:text>
                            </xsl:when>
                            <xsl:when test="@unitCode  = 'R9'">
                                <xsl:text> 1000 m3</xsl:text>
                            </xsl:when>
                            <xsl:when test="@unitCode  = 'SET'">
                                <xsl:text> Set</xsl:text>
                            </xsl:when>
                            <xsl:when test="@unitCode  = 'T3'">
                                <xsl:text> 1000 adet</xsl:text>
                            </xsl:when>                         
                        </xsl:choose>
                    </xsl:for-each>
                </xsl:if>
            </td>
            <td class="lineTableTd" align="right">
                <xsl:text>&#160;</xsl:text>
                <xsl:value-of
                    select="format-number(./cac:Price/cbc:PriceAmount, '###.##0,########', 'european')"/>
                <xsl:if test="./cac:Price/cbc:PriceAmount/@currencyID">
                    <xsl:text> </xsl:text>
                    <xsl:if test="./cac:Price/cbc:PriceAmount/@currencyID = &quot;TRL&quot; or ./cac:Price/cbc:PriceAmount/@currencyID = &quot;TRY&quot;">
                        <xsl:text>TL</xsl:text>
                    </xsl:if>
                    <xsl:if test="./cac:Price/cbc:PriceAmount/@currencyID != &quot;TRL&quot; and ./cac:Price/cbc:PriceAmount/@currencyID != &quot;TRY&quot;">
                        <xsl:value-of select="./cac:Price/cbc:PriceAmount/@currencyID"/>
                    </xsl:if>
                </xsl:if>
            </td>
            <td class="lineTableTd" align="right">
                <xsl:text>&#160;</xsl:text>
                <xsl:for-each select="./cac:AllowanceCharge/cbc:MultiplierFactorNumeric">
                    <xsl:text> %</xsl:text>
                    <xsl:value-of select="format-number(. * 100, '###.##0,00', 'european')"/>
                </xsl:for-each>
            </td>
            <td class="lineTableTd" align="right">
                <xsl:text>&#160;</xsl:text>
                <xsl:for-each select="cac:AllowanceCharge/cbc:Amount">
                    <xsl:call-template name="Curr_Type"/>
                </xsl:for-each>
            </td>
            

            <td class="lineTableTd" align="right">
                <xsl:text>&#160;</xsl:text>
                <xsl:for-each select="cac:AllowanceCharge/cbc:AllowanceChargeReason">

                    <xsl:choose>
                        <xsl:when test="../cbc:ChargeIndicator='true'">
                            <xsl:text>Arttırım - </xsl:text>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:text>İskonto - </xsl:text>
                        </xsl:otherwise>
                    </xsl:choose>
                    <xsl:apply-templates/>
                </xsl:for-each>             
            </td>

        
            <td class="lineTableTd" align="right">
                <xsl:text>&#160;</xsl:text>
                <xsl:for-each select="./cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme">
                    <xsl:if test="cbc:TaxTypeCode='0015' ">
                        <xsl:text> </xsl:text>
                        <xsl:if test="../../cbc:Percent">
                            <xsl:text> %</xsl:text>
                            <xsl:value-of select="format-number(../../cbc:Percent, '###.##0,00', 'european')"/>
                        </xsl:if>
                    </xsl:if>
                </xsl:for-each>
            </td>
            <td class="lineTableTd" align="right">
                <xsl:text>&#160;</xsl:text>
                <xsl:for-each
                    select="./cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme">
                    <xsl:if test="cbc:TaxTypeCode='0015' ">
                        <xsl:text> </xsl:text>
                        <xsl:for-each select="../../cbc:TaxAmount">
                            <xsl:call-template name="Curr_Type"/>
                        </xsl:for-each>
                    </xsl:if>
                </xsl:for-each>
            </td>
            <td class="lineTableTd" style="font-size: xx-small" align="right">
                <xsl:text>&#160;</xsl:text>
                <xsl:for-each
                    select="./cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme">
                    <xsl:if test="cbc:TaxTypeCode!='0015' ">
                        <xsl:text> </xsl:text>
                        <xsl:value-of select="cbc:Name"/>
                        <xsl:if test="../../cbc:Percent">
                            <xsl:text> (%</xsl:text>
                            <xsl:value-of
                                select="format-number(../../cbc:Percent, '###.##0,00', 'european')"/>
                            <xsl:text>)=</xsl:text>
                        </xsl:if>                   
                        <xsl:for-each select="../../cbc:TaxAmount">
                            <xsl:call-template name="Curr_Type"/>
                        </xsl:for-each>
                    </xsl:if>
                </xsl:for-each>
                <xsl:for-each
                    select="./cac:WithholdingTaxTotal/cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme">
                    <xsl:text>KDV TEVKİFAT </xsl:text>
                    <xsl:if test="../../cbc:Percent">
                        <xsl:text> (%</xsl:text>
                        <xsl:value-of
                            select="format-number(../../cbc:Percent, '###.##0,00', 'european')"/>
                        <xsl:text>)=</xsl:text>
                    </xsl:if>
                    <xsl:for-each select="../../cbc:TaxAmount">
                        <xsl:call-template name="Curr_Type"/>
                        <xsl:text>&#10;</xsl:text>
                    </xsl:for-each>
                </xsl:for-each>
            </td>
            <td class="lineTableTd" align="right">
                <xsl:text>&#160;</xsl:text>
                <xsl:for-each select="cbc:LineExtensionAmount">
                    <xsl:call-template name="Curr_Type"/>
                </xsl:for-each>
            </td>
            <xsl:if test="//n1:Invoice/cbc:ProfileID='IHRACAT' or //n1:Invoice/cbc:ProfileID='OZELFATURA'">
                <td class="lineTableTd" align="right">
                    <xsl:text>&#160;</xsl:text>
                    <xsl:for-each select="cac:Delivery/cac:DeliveryTerms/cbc:ID[@schemeID='INCOTERMS']">
                        <xsl:text>&#160;</xsl:text>
                        <xsl:apply-templates/>
                    </xsl:for-each>
                </td>
                <td class="lineTableTd" align="right">
                    <xsl:text>&#160;</xsl:text>
                    <xsl:for-each select="cac:Delivery/cac:Shipment/cac:TransportHandlingUnit/cac:ActualPackage/cbc:PackagingTypeCode">
                        <xsl:text>&#160;</xsl:text>
                        <xsl:call-template name="Packaging">
                            <xsl:with-param name="PackagingType">
                                <xsl:value-of select="."/>
                            </xsl:with-param>
                        </xsl:call-template>
                    </xsl:for-each>
                </td>
                <td class="lineTableTd" align="right">
                    <xsl:text>&#160;</xsl:text>
                    <xsl:for-each select="cac:Delivery/cac:Shipment/cac:TransportHandlingUnit/cac:ActualPackage/cbc:ID">
                        <xsl:text>&#160;</xsl:text>
                        <xsl:apply-templates/>
                    </xsl:for-each>
                </td>
                <td class="lineTableTd" align="right">
                    <xsl:text>&#160;</xsl:text>
                    <xsl:for-each select="cac:Delivery/cac:Shipment/cac:TransportHandlingUnit/cac:ActualPackage/cbc:Quantity">
                        <xsl:text>&#160;</xsl:text>
                        <xsl:apply-templates/>
                    </xsl:for-each>
                </td>
                <td class="lineTableTd" align="right">
                    <xsl:text>&#160;</xsl:text>
                    <xsl:for-each select="cac:Delivery/cac:DeliveryAddress">
                        <xsl:text>&#160;</xsl:text>
                        <xsl:apply-templates/>
                    </xsl:for-each>
                </td>
                <td class="lineTableTd" align="right">
                    <xsl:text>&#160;</xsl:text>
                    <xsl:for-each select="cac:Delivery/cac:Shipment/cac:ShipmentStage/cbc:TransportModeCode">
                        <xsl:text>&#160;</xsl:text>
                        <xsl:call-template name="TransportMode">
                            <xsl:with-param name="TransportModeType">
                                <xsl:value-of select="."/>
                            </xsl:with-param>
                        </xsl:call-template>
                    </xsl:for-each>
                </td>
                <td class="lineTableTd" align="right">
                    <xsl:text>&#160;</xsl:text>
                    <xsl:for-each select="cac:Delivery/cac:Shipment/cac:GoodsItem/cbc:RequiredCustomsID">
                        <xsl:text>&#160;</xsl:text>
                        <xsl:apply-templates/>
                    </xsl:for-each>
                </td>               
                <td class="lineTableTd" align="right">
                    <xsl:text>&#160;</xsl:text>
                    <xsl:for-each select="cac:Delivery/cac:Shipment/cbc:DeclaredCustomsValueAmount">
                        <xsl:call-template name="Curr_Type"/>
                    </xsl:for-each>
                </td>
            </xsl:if>           
        </tr>
    </xsl:template>
    <xsl:template match="//cbc:IssueDate">
        <xsl:value-of select="substring(.,9,2)"/>-<xsl:value-of select="substring(.,6,2)"/>-<xsl:value-of select="substring(.,1,4)"/>
    </xsl:template>
    <xsl:template match="//n1:Invoice">
        <tr class="lineTableTr">
            <td class="lineTableTd">
                <xsl:text>&#160;</xsl:text>
            </td>
            <td class="lineTableTd">
                <xsl:text>&#160;</xsl:text>
            </td>
            <td class="lineTableTd" align="right">
                <xsl:text>&#160;</xsl:text>
            </td>
            <td class="lineTableTd" align="right">
                <xsl:text>&#160;</xsl:text>
            </td>
            <td class="lineTableTd" align="right">
                <xsl:text>&#160;</xsl:text>
            </td>
            <td class="lineTableTd" align="right">
                <xsl:text>&#160;</xsl:text>
            </td>
            <td class="lineTableTd" align="right">
                <xsl:text>&#160;</xsl:text>
            </td>
            <td class="lineTableTd" align="right">
                <xsl:text>&#160;</xsl:text>
            </td>
            <td class="lineTableTd" align="right">
                <xsl:text>&#160;</xsl:text>
            </td>
            <td class="lineTableTd" align="right">
                <xsl:text>&#160;</xsl:text>
            </td>
            <td class="lineTableTd" align="right">
                <xsl:text>&#160;</xsl:text>
            </td>
            <xsl:if test="//n1:Invoice/cbc:ProfileID='IHRACAT' or //n1:Invoice/cbc:ProfileID='OZELFATURA'">
                <td class="lineTableTd" align="right">
                    <xsl:text>&#160;</xsl:text>
                </td>
                <td class="lineTableTd" align="right">
                    <xsl:text>&#160;</xsl:text>
                </td>
                <td class="lineTableTd" align="right">
                    <xsl:text>&#160;</xsl:text>
                </td>
                <td class="lineTableTd" align="right">
                    <xsl:text>&#160;</xsl:text>
                </td>
                <td class="lineTableTd" align="right">
                    <xsl:text>&#160;</xsl:text>
                </td>
                <td class="lineTableTd" align="right">
                    <xsl:text>&#160;</xsl:text>
                </td>
                <td class="lineTableTd" align="right">
                    <xsl:text>&#160;</xsl:text>
                </td>
                <td class="lineTableTd" align="right">
                    <xsl:text>&#160;</xsl:text>
                </td>               
            </xsl:if>           
        </tr>
    </xsl:template>
    <xsl:template name="Party_Title" >
        <xsl:param name="PartyType" />
        <td style="width:469px; " align="left">
            <xsl:if test="cac:PartyName">
                <xsl:value-of select="cac:PartyName/cbc:Name"/>
                <br/>
            </xsl:if>
            <xsl:if test="cac:PartyLegalEntity">                                                
                <xsl:text>Vergi No:</xsl:text>
                <xsl:value-of select="cac:PartyLegalEntity/cbc:CompanyID"/>
                <br/>
            </xsl:if>
            <xsl:for-each select="cac:Person">
                <xsl:for-each select="cbc:Title">
                    <xsl:apply-templates/>
                    <xsl:text>&#160;</xsl:text>
                </xsl:for-each>
                <xsl:for-each select="cbc:FirstName">
                    <xsl:apply-templates/>
                    <xsl:text>&#160;</xsl:text>
                </xsl:for-each>
                <xsl:for-each select="cbc:MiddleName">
                    <xsl:apply-templates/>
                    <xsl:text>&#160; </xsl:text>
                </xsl:for-each>
                <xsl:for-each select="cbc:FamilyName">
                    <xsl:apply-templates/>
                    <xsl:text>&#160;</xsl:text>
                </xsl:for-each>
                <xsl:for-each select="cbc:NameSuffix">
                    <xsl:apply-templates/>
                </xsl:for-each>
                <xsl:if test="$PartyType='TAXFREE'">
                    <br/>
                    <xsl:text>Pasaport No: </xsl:text>
                    <xsl:value-of select="cac:IdentityDocumentReference/cbc:ID"/>
                    <br/>
                    <xsl:text>Ülkesi: </xsl:text>
                    <xsl:for-each select="cbc:NationalityID">
                        <xsl:call-template name="Country">
                            <xsl:with-param name="CountryType"><xsl:value-of select="."/></xsl:with-param>
                        </xsl:call-template>
                    </xsl:for-each>
                </xsl:if>
            </xsl:for-each>
        </td>       
    </xsl:template>
    <xsl:template name="Party_Adress" >
        <xsl:param name="PartyType" />
        <td style="width:469px; " align="left">
            <xsl:for-each select="cac:PostalAddress">
                <xsl:for-each select="cbc:StreetName">
                    <xsl:apply-templates/>
                    <xsl:text>&#160;</xsl:text>
                </xsl:for-each>
                <xsl:for-each select="cbc:BuildingName">
                    <xsl:apply-templates/>
                </xsl:for-each>
                <xsl:for-each select="cbc:BuildingNumber">
                    <xsl:text> No:</xsl:text>
                    <xsl:apply-templates/>
                    <xsl:text>&#160;</xsl:text>
                </xsl:for-each>
                <br/>
                <xsl:for-each select="cbc:Room">
                    <xsl:text>Kapı No:</xsl:text>
                    <xsl:apply-templates/>
                    <xsl:text>&#160;</xsl:text>
                </xsl:for-each>
                <br/>
                <xsl:for-each select="cbc:PostalZone">
                    <xsl:apply-templates/>
                    <xsl:text>&#160;</xsl:text>
                </xsl:for-each>
                <xsl:for-each select="cbc:CitySubdivisionName">
                    <xsl:apply-templates/>
                    <xsl:text>/ </xsl:text>
                </xsl:for-each>
                <xsl:for-each select="cbc:CityName">
                    <xsl:apply-templates/>
                    <xsl:text>&#160;</xsl:text>
                </xsl:for-each>
                <xsl:if test="$PartyType!='OTHER'">
                    <br/>
                    <xsl:value-of select="cac:Country/cbc:Name"/>
                    <br/>
                </xsl:if>
            </xsl:for-each>
        </td>
    </xsl:template>
    <xsl:template name="TransportMode">
        <xsl:param name="TransportModeType" />
        <xsl:choose>
            <xsl:when test="$TransportModeType=1">Denizyolu</xsl:when>
            <xsl:when test="$TransportModeType=2">Demiryolu</xsl:when>
            <xsl:when test="$TransportModeType=3">Karayolu</xsl:when>
            <xsl:when test="$TransportModeType=4">Havayolu</xsl:when>
            <xsl:when test="$TransportModeType=5">Posta</xsl:when>
            <xsl:when test="$TransportModeType=6">Çok araçlı</xsl:when>
            <xsl:when test="$TransportModeType=7">Sabit taşıma tesisleri</xsl:when>
            <xsl:when test="$TransportModeType=8">İç su taşımacılığı</xsl:when>         
            <xsl:otherwise><xsl:value-of select="$TransportModeType"/></xsl:otherwise>
        </xsl:choose>       
    </xsl:template>
    <xsl:template name="Packaging">
        <xsl:param name="PackagingType" />
        <xsl:choose>
            <xsl:when test="$PackagingType='1A'">Çelik bidon</xsl:when>
            <xsl:when test="$PackagingType='1B'">Alüminyum bidon</xsl:when>
            <xsl:when test="$PackagingType='1D'">Kontraplak bidon</xsl:when>
            <xsl:when test="$PackagingType='1F'">Esnek ambalaj kutu</xsl:when>
            <xsl:when test="$PackagingType='1G'">Elyaflı silindir</xsl:when>
            <xsl:when test="$PackagingType='1W'">Ahşap silindir</xsl:when>
            <xsl:when test="$PackagingType='2C'">Ahşap varil</xsl:when>
            <xsl:when test="$PackagingType='3A'">Beş galonluk çelik bidon</xsl:when>
            <xsl:when test="$PackagingType='3H'">Beş galonluk plastik bidon</xsl:when>
            <xsl:when test="$PackagingType='43'">Torba, süper boy</xsl:when>
            <xsl:when test="$PackagingType='44'">Çoklu torba</xsl:when>
            <xsl:when test="$PackagingType='4A'">Çelik kutu</xsl:when>
            <xsl:when test="$PackagingType='4B'">Alüminyum kutu</xsl:when>
            <xsl:when test="$PackagingType='4C'">Doğal ahşap kutu</xsl:when>
            <xsl:when test="$PackagingType='4D'">Kontraplak kutu</xsl:when>
            <xsl:when test="$PackagingType='4F'">Yeniden üretilmiş ahşap kutu</xsl:when>
            <xsl:when test="$PackagingType='4G'">Elyaf tahta kutu</xsl:when>
            <xsl:when test="$PackagingType='4H'">Plastik kutu</xsl:when>
            <xsl:when test="$PackagingType='5H'">Plastik dokuma torba</xsl:when>
            <xsl:when test="$PackagingType='5L'">Kumaş torba</xsl:when>
            <xsl:when test="$PackagingType='5M'">Kağıt torba</xsl:when>
            <xsl:when test="$PackagingType='6H'">Kompozit ambalaj, plastik kap</xsl:when>
            <xsl:when test="$PackagingType='6P'">Kompozit ambalaj, cam kutu</xsl:when>
            <xsl:when test="$PackagingType='7A'">Araba kabı</xsl:when>
            <xsl:when test="$PackagingType='7B'">Ahşap kasa</xsl:when>
            <xsl:when test="$PackagingType='8A'">Ahşap palet</xsl:when>
            <xsl:when test="$PackagingType='8B'">Ahşap kasa</xsl:when>
            <xsl:when test="$PackagingType='8C'">Ahşap paketi</xsl:when>
            <xsl:when test="$PackagingType='AA'">Ortaboy sert plastik dolum konteynerı</xsl:when>
            <xsl:when test="$PackagingType='AB'">Elyaf kap</xsl:when>
            <xsl:when test="$PackagingType='AC'">Kağıt kap</xsl:when>
            <xsl:when test="$PackagingType='AD'">Ahşap kap</xsl:when>
            <xsl:when test="$PackagingType='AE'">Aerosol</xsl:when>
            <xsl:when test="$PackagingType='AF'">Palet, modüler, yaka 80cms * 60cms</xsl:when>
            <xsl:when test="$PackagingType='AG'">Sarılmış palet</xsl:when>
            <xsl:when test="$PackagingType='AH'">Palet, 100 cms * 110 cms</xsl:when>
            <xsl:when test="$PackagingType='AI'">Çift çeneli kepçe</xsl:when>
            <xsl:when test="$PackagingType='AJ'">Koni</xsl:when>
            <xsl:when test="$PackagingType='AL'">Top</xsl:when>
            <xsl:when test="$PackagingType='AM'">Korumasız ampul</xsl:when>
            <xsl:when test="$PackagingType='AP'">Korumalı ampül</xsl:when>
            <xsl:when test="$PackagingType='AT'">Püskürteç</xsl:when>
            <xsl:when test="$PackagingType='AV'">Kapsül</xsl:when>
            <xsl:when test="$PackagingType='B4'">Kemer</xsl:when>
            <xsl:when test="$PackagingType='BA'">Varil</xsl:when>
            <xsl:when test="$PackagingType='BB'">Bobin</xsl:when>
            <xsl:when test="$PackagingType='BC'">Şişe kasası/rafı</xsl:when>
            <xsl:when test="$PackagingType='BD'">Tahta</xsl:when>
            <xsl:when test="$PackagingType='BE'">Bohça</xsl:when>
            <xsl:when test="$PackagingType='BF'">Balon, korunmasız</xsl:when>
            <xsl:when test="$PackagingType='BG'">Torba</xsl:when>
            <xsl:when test="$PackagingType='BH'">Demet</xsl:when>
            <xsl:when test="$PackagingType='BI'">Çöp kutusu</xsl:when>
            <xsl:when test="$PackagingType='BJ'">Kova</xsl:when>
            <xsl:when test="$PackagingType='BK'">Sepet</xsl:when>
            <xsl:when test="$PackagingType='BL'">Sıkıştırılmış balya</xsl:when>
            <xsl:when test="$PackagingType='BM'">Kase</xsl:when>
            <xsl:when test="$PackagingType='BN'">Sıkıştırılmamış balya</xsl:when>
            <xsl:when test="$PackagingType='BO'">Şişe, korunmasız, silindirik</xsl:when>
            <xsl:when test="$PackagingType='BP'">Balon, korunmasız</xsl:when>
            <xsl:when test="$PackagingType='BQ'">Şişe, korunmuş, silindirik</xsl:when>
            <xsl:when test="$PackagingType='BR'">Çubuk</xsl:when>
            <xsl:when test="$PackagingType='BS'">Şişe, korunmasız, soğanbiçim</xsl:when>
            <xsl:when test="$PackagingType='BT'">Sürgü</xsl:when>
            <xsl:when test="$PackagingType='BU'">İzmarit</xsl:when>
            <xsl:when test="$PackagingType='BV'">Şişe, korunmuş, soğanbiçim</xsl:when>
            <xsl:when test="$PackagingType='BW'">Sıvılar için kutu</xsl:when>
            <xsl:when test="$PackagingType='BX'">Kutu</xsl:when>
            <xsl:when test="$PackagingType='BY'">Tahta, paket halinde/demet</xsl:when>
            <xsl:when test="$PackagingType='BZ'">Çıbuklar, paket halinde/demet</xsl:when>
            <xsl:when test="$PackagingType='CA'">Dikdörtgen teneke</xsl:when>
            <xsl:when test="$PackagingType='CB'">Bira kasası</xsl:when>
            <xsl:when test="$PackagingType='CC'">Yayık</xsl:when>
            <xsl:when test="$PackagingType='CD'">Teneke ibrik</xsl:when>
            <xsl:when test="$PackagingType='CE'">Balık sepeti</xsl:when>
            <xsl:when test="$PackagingType='CF'">Sandık</xsl:when>
            <xsl:when test="$PackagingType='CG'">Kafes</xsl:when>
            <xsl:when test="$PackagingType='CH'">Sandık</xsl:when>
            <xsl:when test="$PackagingType='CI'">Teneke kutu</xsl:when>
            <xsl:when test="$PackagingType='CJ'">Tabut</xsl:when>
            <xsl:when test="$PackagingType='CK'">Fıçı</xsl:when>
            <xsl:when test="$PackagingType='CL'">Bobin</xsl:when>
            <xsl:when test="$PackagingType='CM'">Kart</xsl:when>
            <xsl:when test="$PackagingType='CN'">Konteyner</xsl:when>
            <xsl:when test="$PackagingType='CO'">Damacana, korumasız</xsl:when>
            <xsl:when test="$PackagingType='CP'">Damacana, korumalı</xsl:when>
            <xsl:when test="$PackagingType='CQ'">Kartuş</xsl:when>
            <xsl:when test="$PackagingType='CR'">Kasa</xsl:when>
            <xsl:when test="$PackagingType='CS'">Kutu</xsl:when>
            <xsl:when test="$PackagingType='CT'">Karton kutu</xsl:when>
            <xsl:when test="$PackagingType='CU'">Fincan</xsl:when>
            <xsl:when test="$PackagingType='CV'">Kapak</xsl:when>
            <xsl:when test="$PackagingType='CW'">Rulo kafes</xsl:when>
            <xsl:when test="$PackagingType='CX'">Silindirik teneke</xsl:when>
            <xsl:when test="$PackagingType='CY'">Silindir</xsl:when>
            <xsl:when test="$PackagingType='CZ'">Tuval</xsl:when>
            <xsl:when test="$PackagingType='DA'">Kasa, çok tabakalı, plastik</xsl:when>
            <xsl:when test="$PackagingType='DB'">Kasa, çok tabakalı, ahşap</xsl:when>
            <xsl:when test="$PackagingType='DC'">Kasa, çok tabakalı, karton</xsl:when>
            <xsl:when test="$PackagingType='DI'">Demir varil</xsl:when>
            <xsl:when test="$PackagingType='DJ'">Damacana</xsl:when>
            <xsl:when test="$PackagingType='DK'">Karton kasa</xsl:when>
            <xsl:when test="$PackagingType='DL'">Plastik dökme kasa</xsl:when>
            <xsl:when test="$PackagingType='DM'">Ahşap dökme kasa</xsl:when>
            <xsl:when test="$PackagingType='DN'">Sebil/dağıtıcı</xsl:when>
            <xsl:when test="$PackagingType='DP'">Damacana, korumalı</xsl:when>
            <xsl:when test="$PackagingType='DR'">Bidon</xsl:when>
            <xsl:when test="$PackagingType='DS'">Üst kapaksız plastik tepsi, tek tabaka</xsl:when>
            <xsl:when test="$PackagingType='DT'">Üst kapaksız ahşap tepsi, tek tabaka</xsl:when>
            <xsl:when test="$PackagingType='DU'">Üst kapaksız polistiren tepsi, tek tabaka</xsl:when>
            <xsl:when test="$PackagingType='DV'">Üst kapaksız karton tepsi, tek tabaka</xsl:when>
            <xsl:when test="$PackagingType='DW'">Üst kapaksız plastik tepsi, çift tabaka</xsl:when>
            <xsl:when test="$PackagingType='DX'"></xsl:when>
            <xsl:when test="$PackagingType='DY'">Üst kapaksız karton tepsi, çift tabaka</xsl:when>
            <xsl:when test="$PackagingType='EC'">Plastik torba</xsl:when>
            <xsl:when test="$PackagingType='ED'">Kasa, palet tabanı ile</xsl:when>
            <xsl:when test="$PackagingType='EE'">Ahşap kasa, palet tabanı ile</xsl:when>
            <xsl:when test="$PackagingType='EF'">Karton kasa, palet tabanı ile</xsl:when>
            <xsl:when test="$PackagingType='EG'">Plastik kasa, palet tabanı ile</xsl:when>
            <xsl:when test="$PackagingType='EH'">Metal kasa, palet tabanı ile</xsl:when>
            <xsl:when test="$PackagingType='EI'">İzotermik kasa</xsl:when>
            <xsl:when test="$PackagingType='EN'">Zarf</xsl:when>
            <xsl:when test="$PackagingType='FB'">Plastik esnek torba</xsl:when>
            <xsl:when test="$PackagingType='FC'">Meyve kasası</xsl:when>
            <xsl:when test="$PackagingType='FD'">Çerçeveli kasa</xsl:when>
            <xsl:when test="$PackagingType='FE'">Plastik esnek depo</xsl:when>
            <xsl:when test="$PackagingType='FI'">Küçük fıçı</xsl:when>
            <xsl:when test="$PackagingType='FL'">Matara</xsl:when>
            <xsl:when test="$PackagingType='FO'">Küçük sandık</xsl:when>
            <xsl:when test="$PackagingType='FR'">Çerçeve</xsl:when>
            <xsl:when test="$PackagingType='FT'">Streçlenmiş yemek kabı</xsl:when>
            <xsl:when test="$PackagingType='FW'">Yanları üstü açık yük arabası</xsl:when>
            <xsl:when test="$PackagingType='FX'">Esnek torba</xsl:when>
            <xsl:when test="$PackagingType='GB'">Gaz şişesi</xsl:when>
            <xsl:when test="$PackagingType='GI'">Kiriş</xsl:when>
            <xsl:when test="$PackagingType='GL'">Konteyner, galon</xsl:when>
            <xsl:when test="$PackagingType='GR'">Cam kap</xsl:when>
            <xsl:when test="$PackagingType='GY'">Çul</xsl:when>
            <xsl:when test="$PackagingType='GZ'">Kiriş, demet/grup</xsl:when>
            <xsl:when test="$PackagingType='HA'">Saplı plastik sepet</xsl:when>
            <xsl:when test="$PackagingType='HB'">Saplı ahşap sepet</xsl:when>
            <xsl:when test="$PackagingType='HC'">Saplı karton sepet</xsl:when>
            <xsl:when test="$PackagingType='HG'">Büyük fıçı</xsl:when>
            <xsl:when test="$PackagingType='HN'">Askı</xsl:when>
            <xsl:when test="$PackagingType='HR'">Kapaklı sepet</xsl:when>
            <xsl:when test="$PackagingType='IA'">Ahşap sergi paketi</xsl:when>
            <xsl:when test="$PackagingType='IB'">Karton sergi paketi</xsl:when>
            <xsl:when test="$PackagingType='IC'">Plastik sergi paketi</xsl:when>
            <xsl:when test="$PackagingType='ID'">Metal sergi paketi</xsl:when>
            <xsl:when test="$PackagingType='IE'">Gösteri paketi</xsl:when>
            <xsl:when test="$PackagingType='IF'">Şeffaf oluklu paket</xsl:when>
            <xsl:when test="$PackagingType='IG'">Kağıt sarılı ambalaj</xsl:when>
            <xsl:when test="$PackagingType='IH'">Plastik bidon</xsl:when>
            <xsl:when test="$PackagingType='IK'">Şişe delikli karton paket</xsl:when>
            <xsl:when test="$PackagingType='IL'">Tepsi, katı, kapaklı istiflenebilir</xsl:when>
            <xsl:when test="$PackagingType='IN'">Külçe</xsl:when>
            <xsl:when test="$PackagingType='IZ'">Paket/grop halde külçe</xsl:when>
            <xsl:when test="$PackagingType='JB'">Jumbo boy torba</xsl:when>
            <xsl:when test="$PackagingType='JC'">Beş galonluk dikdörtgen bidon</xsl:when>
            <xsl:when test="$PackagingType='JG'">Sürahi</xsl:when>
            <xsl:when test="$PackagingType='JR'">Kavanoz</xsl:when>
            <xsl:when test="$PackagingType='JY'">Beş galonluk silindir bidon</xsl:when>
            <xsl:when test="$PackagingType='KI'">Takım</xsl:when>
            <xsl:when test="$PackagingType='LE'">Bagaj</xsl:when>
            <xsl:when test="$PackagingType='LG'">Kütük</xsl:when>
            <xsl:when test="$PackagingType='LT'">Pay</xsl:when>
            <xsl:when test="$PackagingType='LU'">Kulp</xsl:when>
            <xsl:when test="$PackagingType='LV'">Liftvan</xsl:when>
            <xsl:when test="$PackagingType='LZ'">Paket/grup kütükler</xsl:when>
            <xsl:when test="$PackagingType='MA'">Metal kasa</xsl:when>
            <xsl:when test="$PackagingType='MB'">Çoklu çanta</xsl:when>
            <xsl:when test="$PackagingType='MC'">Süt kasasu</xsl:when>
            <xsl:when test="$PackagingType='ME'">Metal konteyner</xsl:when>
            <xsl:when test="$PackagingType='MR'">Metal kap</xsl:when>
            <xsl:when test="$PackagingType='MS'">Çok duvarlı çuval</xsl:when>
            <xsl:when test="$PackagingType='MT'">Mat</xsl:when>
            <xsl:when test="$PackagingType='MW'">Plastik sarılmış kap</xsl:when>
            <xsl:when test="$PackagingType='MX'">Kibrit kutusu</xsl:when>
            <xsl:when test="$PackagingType='NE'">Ambalajsız</xsl:when>
            <xsl:when test="$PackagingType='NF'">Ambalajsız, tek ünite</xsl:when>
            <xsl:when test="$PackagingType='NG'">Ambalajsız, çok ünite</xsl:when>
            <xsl:when test="$PackagingType='NS'">Yuva</xsl:when>
            <xsl:when test="$PackagingType='NT'">Ağ</xsl:when>
            <xsl:when test="$PackagingType='NU'">Plastik ağ tüp</xsl:when>
            <xsl:when test="$PackagingType='NV'">Kumaş ağ tüp</xsl:when>
            <xsl:when test="$PackagingType='OA'">Palet, CHEP 40x60 cm</xsl:when>
            <xsl:when test="$PackagingType='OB'">Palet, CHEP 80x120 cm</xsl:when>
            <xsl:when test="$PackagingType='OC'">Palet, CHEP 100x120 cm</xsl:when>
            <xsl:when test="$PackagingType='OD'">Avustralya standart paleti</xsl:when>
            <xsl:when test="$PackagingType='OE'">Palet,  110x100 cm</xsl:when>
            <xsl:when test="$PackagingType='OF'">Nakliye platformu, belirtilmemiş ağırlık ve bıyut</xsl:when>
            <xsl:when test="$PackagingType='OK'">Blok</xsl:when>
            <xsl:when test="$PackagingType='OT'">Sekiz kenar kutu</xsl:when>
            <xsl:when test="$PackagingType='OU'">Dış konteyner</xsl:when>
            <xsl:when test="$PackagingType='P2'">Tava</xsl:when>
            <xsl:when test="$PackagingType='PA'">Küçük paket</xsl:when>
            <xsl:when test="$PackagingType='PB'">Kombine açık uçlu kutu ve palet</xsl:when>
            <xsl:when test="$PackagingType='PC'">Parsel</xsl:when>
            <xsl:when test="$PackagingType='PD'">Palet, modüler 80 x 100 cm</xsl:when>
            <xsl:when test="$PackagingType='PE'">Palet, modüler 80 x 120 cm</xsl:when>
            <xsl:when test="$PackagingType='PF'">Kalem</xsl:when>
            <xsl:when test="$PackagingType='PG'">Plaka</xsl:when>
            <xsl:when test="$PackagingType='PH'">Sürahi</xsl:when>
            <xsl:when test="$PackagingType='PI'">Boru</xsl:when>
            <xsl:when test="$PackagingType='PJ'">Meyve sepeti</xsl:when>
            <xsl:when test="$PackagingType='PK'">Paket</xsl:when>
            <xsl:when test="$PackagingType='PL'">Gerdel</xsl:when>
            <xsl:when test="$PackagingType='PN'">Kalas</xsl:when>
            <xsl:when test="$PackagingType='PO'">Destek</xsl:when>
            <xsl:when test="$PackagingType='PP'">Parça</xsl:when>
            <xsl:when test="$PackagingType='PR'">Plastik kap</xsl:when>
            <xsl:when test="$PackagingType='PT'">Demlik</xsl:when>
            <xsl:when test="$PackagingType='PU'">Tepsi</xsl:when>
            <xsl:when test="$PackagingType='PV'">Paket/grup boru</xsl:when>
            <xsl:when test="$PackagingType='PX'">Palet</xsl:when>
            <xsl:when test="$PackagingType='PY'">Paket/grup tabak</xsl:when>
            <xsl:when test="$PackagingType='PZ'">Paket/grup kalas</xsl:when>
            <xsl:when test="$PackagingType='QA'">Üstü açılmaz çelik bidon</xsl:when>
            <xsl:when test="$PackagingType='QB'">Üstü açılır çelik bidon</xsl:when>
            <xsl:when test="$PackagingType='QC'">Üstü açılmaz alüminyum bidon</xsl:when>
            <xsl:when test="$PackagingType='QD'">Üstü açılır alüminyum bidon</xsl:when>
            <xsl:when test="$PackagingType='QF'">Üstü açılmaz plastik bidon</xsl:when>
            <xsl:when test="$PackagingType='QG'">Üstü açılır plastik bidon</xsl:when>
            <xsl:when test="$PackagingType='QH'">Ahşap tıkaçlı varil</xsl:when>
            <xsl:when test="$PackagingType='QJ'">Üstü açılır ahşap varil</xsl:when>
            <xsl:when test="$PackagingType='QK'">Üstü açılmaz beş galonluk çelik bidon</xsl:when>
            <xsl:when test="$PackagingType='QL'">Üstü açılır beş galonluk çelik bidon</xsl:when>
            <xsl:when test="$PackagingType='QM'">Üstü açılmaz beş galonluk plastik bidon</xsl:when>
            <xsl:when test="$PackagingType='QN'">Üstü açılır beş galonluk plastik bidon</xsl:when>
            <xsl:when test="$PackagingType='QP'">Doğal ahşap kutu</xsl:when>
            <xsl:when test="$PackagingType='QQ'">Emniyet duvarlı doğal ahşap kutu</xsl:when>
            <xsl:when test="$PackagingType='QR'">Genişletilmiş plastik kutu</xsl:when>
            <xsl:when test="$PackagingType='QS'">Yekpare plastik kutu</xsl:when>
            <xsl:when test="$PackagingType='RD'">Çubuk</xsl:when>
            <xsl:when test="$PackagingType='RG'">Halka</xsl:when>
            <xsl:when test="$PackagingType='RJ'">Raf, elbise askısı</xsl:when>
            <xsl:when test="$PackagingType='RK'">Raf</xsl:when>
            <xsl:when test="$PackagingType='RL'">Makara</xsl:when>
            <xsl:when test="$PackagingType='RO'">Rulo</xsl:when>
            <xsl:when test="$PackagingType='RZ'">Paket/grup çubuk</xsl:when>
            <xsl:when test="$PackagingType='SA'">Çuval</xsl:when>
            <xsl:when test="$PackagingType='SB'">Levha</xsl:when>
            <xsl:when test="$PackagingType='SC'">Sığ kasa</xsl:when>
            <xsl:when test="$PackagingType='SD'">İğ</xsl:when>
            <xsl:when test="$PackagingType='SE'">Deniz sandığı</xsl:when>
            <xsl:when test="$PackagingType='SH'">Kesecik</xsl:when>
            <xsl:when test="$PackagingType='SI'">Kızak</xsl:when>
            <xsl:when test="$PackagingType='SK'">İskelet kasa</xsl:when>
            <xsl:when test="$PackagingType='SL'">Taşıma paleti</xsl:when>
            <xsl:when test="$PackagingType='SM'">Sac</xsl:when>
            <xsl:when test="$PackagingType='SO'">Tel/kablo/iplik makarası</xsl:when>
            <xsl:when test="$PackagingType='SP'">Plastik levha</xsl:when>
            <xsl:when test="$PackagingType='SS'">Çelik kasa</xsl:when>
            <xsl:when test="$PackagingType='ST'">Yaprak</xsl:when>
            <xsl:when test="$PackagingType='SU'">Bavul</xsl:when>
            <xsl:when test="$PackagingType='SV'">Çelik zarf</xsl:when>
            <xsl:when test="$PackagingType='SW'">Vakumlu ambalaj</xsl:when>
            <xsl:when test="$PackagingType='SX'">Set</xsl:when>
            <xsl:when test="$PackagingType='SY'">Kılıf</xsl:when>
            <xsl:when test="$PackagingType='SZ'">Paket/grup yaprak</xsl:when>
            <xsl:when test="$PackagingType='T1'">Tablet</xsl:when>
            <xsl:when test="$PackagingType='TB'">Küvet</xsl:when>
            <xsl:when test="$PackagingType='TC'">Çay sandığı</xsl:when>
            <xsl:when test="$PackagingType='TD'">Sıkılabilir tüp</xsl:when>
            <xsl:when test="$PackagingType='TE'">Lastik</xsl:when>
            <xsl:when test="$PackagingType='TG'">Genel tank konteynerı</xsl:when>
            <xsl:when test="$PackagingType='TI'"></xsl:when>
            <xsl:when test="$PackagingType='TK'">Dikdörtgen tank</xsl:when>
            <xsl:when test="$PackagingType='TN'">Teneke</xsl:when>
            <xsl:when test="$PackagingType='TO'">Şarap fıçısı</xsl:when>
            <xsl:when test="$PackagingType='TR'">Gövde</xsl:when>
            <xsl:when test="$PackagingType='TS'">Bağ</xsl:when>
            <xsl:when test="$PackagingType='TU'">Tüp</xsl:when>
            <xsl:when test="$PackagingType='TV'">Enjektörlü tüp</xsl:when>
            <xsl:when test="$PackagingType='TY'">Silindirik tank</xsl:when>
            <xsl:when test="$PackagingType='TZ'">Paket/grup tüpler</xsl:when>
            <xsl:when test="$PackagingType='UN'">Birim</xsl:when>
            <xsl:when test="$PackagingType='VG'">Dökme gaz</xsl:when>
            <xsl:when test="$PackagingType='VI'">Küçük şişe</xsl:when>
            <xsl:when test="$PackagingType='VL'">Dökme sıvı</xsl:when>
            <xsl:when test="$PackagingType='VO'">Dökme katı</xsl:when>
            <xsl:when test="$PackagingType='VP'">Vakumlu</xsl:when>
            <xsl:when test="$PackagingType='VQ'">Dökme sıvılaştırılmış gaz</xsl:when>
            <xsl:when test="$PackagingType='VN'">Araç</xsl:when>
            <xsl:when test="$PackagingType='VR'">Dökme katı granül</xsl:when>
            <xsl:when test="$PackagingType='VS'">Dökme metal hurda</xsl:when>
            <xsl:when test="$PackagingType='VY'">Dökme ince parçacıklar</xsl:when>
            <xsl:when test="$PackagingType='WA'">Ortaboy dolum konteynerı</xsl:when>
            <xsl:when test="$PackagingType='WB'">Hasırlı şişe</xsl:when>
            <xsl:when test="$PackagingType='WC'">Ortaboy çelik dolum konteynerı</xsl:when>
            <xsl:when test="$PackagingType='WD'">Ortaboy alüminyum dolum konteynerı</xsl:when>
            <xsl:when test="$PackagingType='WF'">Ortaboy metal dolum konteynerı</xsl:when>
            <xsl:when test="$PackagingType='WK'">Sıvılar için ortaboy çelik dolum konteynerı</xsl:when>
            <xsl:when test="$PackagingType='WL'">Sıvılar için ortaboy alümünyum dolum konteynerı</xsl:when>
            <xsl:when test="$PackagingType='WM'">Sıvılar için ortaboy metal dolum konteynerı</xsl:when>
            <xsl:when test="$PackagingType='WN'">Ortaboy iç astarsız örme plastik dolum konteynerı</xsl:when>
            <xsl:when test="$PackagingType='WR'">Ortaboy iç astarlı örme plastik dolum konteynerı</xsl:when>
            <xsl:when test="$PackagingType='WS'">Ortaboy plastik film dolum konteynerı</xsl:when>
            <xsl:when test="$PackagingType='WT'">Ortaboy iç astarsız kumaş plastik dolum konteynerı</xsl:when>
            <xsl:when test="$PackagingType='WU'">Ortaboy iç astarlı doğal ahşap dolum konteynerı</xsl:when>
            <xsl:when test="$PackagingType='WX'">Ortaboy iç astarlı kumaş dolum konteynerı</xsl:when>
            <xsl:when test="$PackagingType='WY'">Ortaboy iç astarlı kontraplak dolum konteynerı</xsl:when>
            <xsl:when test="$PackagingType='WZ'">Ortaboy iç astarlı sunta dolum konteynerı</xsl:when>
            <xsl:when test="$PackagingType='XA'">İç astarsız örme plastik torba</xsl:when>
            <xsl:when test="$PackagingType='XB'">Sızdırmaz örme plastik torba</xsl:when>
            <xsl:when test="$PackagingType='XC'">Su geçirmez örme plastik torba</xsl:when>
            <xsl:when test="$PackagingType='XD'">Plastik film torba</xsl:when>
            <xsl:when test="$PackagingType='XF'">İç astarsız kumaş torba</xsl:when>
            <xsl:when test="$PackagingType='XG'">Sızdırmaz kumaş torba</xsl:when>
            <xsl:when test="$PackagingType='XH'">Su geçirmez kumaş torba</xsl:when>
            <xsl:when test="$PackagingType='XJ'">Çok duvarlı kağıt torba</xsl:when>
            <xsl:when test="$PackagingType='XK'">Su geçirmez çok duvarlı kağıt torba</xsl:when>
            <xsl:when test="$PackagingType='YA'">Kompozit ambalaj, çelik bidon içindeki plastik kap</xsl:when>
            <xsl:when test="$PackagingType='YB'">Kompozit ambalaj, çelik kasa içindeki plastik kap</xsl:when>
            <xsl:when test="$PackagingType='YC'">Kompozit ambalaj, alüminyum bidon içindeki plastik kap</xsl:when>
            <xsl:when test="$PackagingType='YD'">Kompozit ambalaj, alüminyum kasa içindeki plastik kap</xsl:when>
            <xsl:when test="$PackagingType='YF'">Kompozit ambalaj, ahşap kutu içindeki plastik kap</xsl:when>
            <xsl:when test="$PackagingType='YG'">Kompozit ambalaj, kontraplak bidon içindeki plastik kap</xsl:when>
            <xsl:when test="$PackagingType='YH'">Kompozit ambalaj, kontraplak kasa içindeki plastik kap</xsl:when>
            <xsl:when test="$PackagingType='YJ'">Kompozit ambalaj, elyaf bidon içindeki plastik kap</xsl:when>
            <xsl:when test="$PackagingType='YK'">Kompozit ambalaj, elyaf levha kasa içindeki plastik kap</xsl:when>
            <xsl:when test="$PackagingType='YL'">Kompozit ambalaj, plastik bidon içindeki plastik kap</xsl:when>
            <xsl:when test="$PackagingType='YM'">Kompozit ambalaj, yekpare plastik kasa içindeki plastik kap</xsl:when>
            <xsl:when test="$PackagingType='YN'">Kompozit ambalaj, çelik bidon içindeki cam kap</xsl:when>
            <xsl:when test="$PackagingType='YP'">Kompozit ambalaj, elyaf levha kasa içindeki plastik kap</xsl:when>
            <xsl:when test="$PackagingType='YQ'">Kompozit ambalaj, alüminyum bidon içindeki cam kap</xsl:when>
            <xsl:when test="$PackagingType='YR'">Kompozit ambalaj, alüminyum kasa içindeki plastik kap</xsl:when>
            <xsl:when test="$PackagingType='YS'">Kompozit ambalaj, ahşap kasa içindeki cam kap</xsl:when>
            <xsl:when test="$PackagingType='YT'">Kompozit ambalaj, kontraplak bidon içindeki cam kap</xsl:when>
            <xsl:when test="$PackagingType='YV'">Kompozit ambalaj, hasır sepet içindeki cam kap</xsl:when>
            <xsl:when test="$PackagingType='YW'">Kompozit ambalaj, elyaf bidon içindeki cam kap</xsl:when>
            <xsl:when test="$PackagingType='YX'">Kompozit ambalaj, elyaf levha kasa içindeki cam kap</xsl:when>
            <xsl:when test="$PackagingType='YY'">Kompozit ambalaj, genişleyebilir plastik paket içindeki cam kap</xsl:when>
            <xsl:when test="$PackagingType='YZ'">Kompozit ambalaj, yekpare plastik paket içindeki cam kap</xsl:when>
            <xsl:when test="$PackagingType='ZA'">Ortaboy çok duvarlı kağıt dolum konteynerı</xsl:when>
            <xsl:when test="$PackagingType='ZB'">Büyük boy torba</xsl:when>
            <xsl:when test="$PackagingType='ZC'">Ortaboy çok duvarlı su geçirmez kağıt dolum konteynerı</xsl:when>
            <xsl:when test="$PackagingType='ZL'">Ortaboy kompozit yekpare sert plastik dolum konteynerı</xsl:when>
            <xsl:when test="$PackagingType='ZM'">Ortaboy kompozit yekpare esnek plastik dolum konteynerı</xsl:when>
            <xsl:when test="$PackagingType='ZN'">Ortaboy kompozit sıkıştırılmış sert plastik dolum konteynerı</xsl:when>
            <xsl:when test="$PackagingType='ZP'">Ortaboy kompozit sıkıştırılmış esnek plastik dolum konteynerı</xsl:when>
            <xsl:when test="$PackagingType='ZQ'">Sıvılar için ortaboy kompozit sert plastik dolum konteynerı</xsl:when>
            <xsl:when test="$PackagingType='ZR'">Sıvılar için ortaboy kompozit esnek plastik dolum konteynerı</xsl:when>
            <xsl:when test="$PackagingType='ZS'">Ortaboy kompozit dolum konteynerı</xsl:when>
            <xsl:when test="$PackagingType='ZT'">Ortaboy elyaf levha dolum konteynerı</xsl:when>
            <xsl:when test="$PackagingType='ZU'">Ortaboy esnek dolum konteynerı</xsl:when>
            <xsl:when test="$PackagingType='ZW'">Ortaboy doğal ahşap dolum konteynerı</xsl:when>
            <xsl:when test="$PackagingType='ZX'">Ortaboy kontraplak dolum konteynerı</xsl:when>
            <xsl:when test="$PackagingType='ZY'">Ortaboy sunta dolum konteynerı</xsl:when>
            <xsl:otherwise><xsl:value-of select="$PackagingType"/></xsl:otherwise>
        </xsl:choose>       
    </xsl:template>
    <xsl:template name="Country">
        <xsl:param name="CountryType" />
        <xsl:choose>
            <xsl:when test="$CountryType='AF'">Afganistan</xsl:when>
            <xsl:when test="$CountryType='DE'">Almanya</xsl:when>
            <xsl:when test="$CountryType='AD'">Andorra</xsl:when>
            <xsl:when test="$CountryType='AO'">Angola</xsl:when>
            <xsl:when test="$CountryType='AG'">Antigua ve Barbuda</xsl:when>
            <xsl:when test="$CountryType='AR'">Arjantin</xsl:when>
            <xsl:when test="$CountryType='AL'">Arnavutluk</xsl:when>
            <xsl:when test="$CountryType='AW'">Aruba</xsl:when>
            <xsl:when test="$CountryType='AU'">Avustralya</xsl:when>
            <xsl:when test="$CountryType='AT'">Avusturya</xsl:when>
            <xsl:when test="$CountryType='AZ'">Azerbaycan</xsl:when>
            <xsl:when test="$CountryType='BS'">Bahamalar</xsl:when>
            <xsl:when test="$CountryType='BH'">Bahreyn</xsl:when>
            <xsl:when test="$CountryType='BD'">Bangladeş</xsl:when>
            <xsl:when test="$CountryType='BB'">Barbados</xsl:when>
            <xsl:when test="$CountryType='EH'">Batı Sahra (MA)</xsl:when>
            <xsl:when test="$CountryType='BE'">Belçika</xsl:when>
            <xsl:when test="$CountryType='BZ'">Belize</xsl:when>
            <xsl:when test="$CountryType='BJ'">Benin</xsl:when>
            <xsl:when test="$CountryType='BM'">Bermuda</xsl:when>
            <xsl:when test="$CountryType='BY'">Beyaz Rusya</xsl:when>
            <xsl:when test="$CountryType='BT'">Bhutan</xsl:when>
            <xsl:when test="$CountryType='AE'">Birleşik Arap Emirlikleri</xsl:when>
            <xsl:when test="$CountryType='US'">Birleşik Devletler</xsl:when>
            <xsl:when test="$CountryType='GB'">Birleşik Krallık</xsl:when>
            <xsl:when test="$CountryType='BO'">Bolivya</xsl:when>
            <xsl:when test="$CountryType='BA'">Bosna-Hersek</xsl:when>
            <xsl:when test="$CountryType='BW'">Botsvana</xsl:when>
            <xsl:when test="$CountryType='BR'">Brezilya</xsl:when>
            <xsl:when test="$CountryType='BN'">Bruney</xsl:when>
            <xsl:when test="$CountryType='BG'">Bulgaristan</xsl:when>
            <xsl:when test="$CountryType='BF'">Burkina Faso</xsl:when>
            <xsl:when test="$CountryType='BI'">Burundi</xsl:when>
            <xsl:when test="$CountryType='TD'">Çad</xsl:when>
            <xsl:when test="$CountryType='KY'">Cayman Adaları</xsl:when>
            <xsl:when test="$CountryType='GI'">Cebelitarık (GB)</xsl:when>
            <xsl:when test="$CountryType='CZ'">Çek Cumhuriyeti</xsl:when>
            <xsl:when test="$CountryType='DZ'">Cezayir</xsl:when>
            <xsl:when test="$CountryType='DJ'">Cibuti</xsl:when>
            <xsl:when test="$CountryType='CN'">Çin</xsl:when>
            <xsl:when test="$CountryType='DK'">Danimarka</xsl:when>
            <xsl:when test="$CountryType='CD'">Demokratik Kongo Cumhuriyeti</xsl:when>
            <xsl:when test="$CountryType='TL'">Doğu Timor</xsl:when>
            <xsl:when test="$CountryType='DO'">Dominik Cumhuriyeti</xsl:when>
            <xsl:when test="$CountryType='DM'">Dominika</xsl:when>
            <xsl:when test="$CountryType='EC'">Ekvador</xsl:when>
            <xsl:when test="$CountryType='GQ'">Ekvator Ginesi</xsl:when>
            <xsl:when test="$CountryType='SV'">El Salvador</xsl:when>
            <xsl:when test="$CountryType='ID'">Endonezya</xsl:when>
            <xsl:when test="$CountryType='ER'">Eritre</xsl:when>
            <xsl:when test="$CountryType='AM'">Ermenistan</xsl:when>
            <xsl:when test="$CountryType='MF'">Ermiş Martin (FR)</xsl:when>
            <xsl:when test="$CountryType='EE'">Estonya</xsl:when>
            <xsl:when test="$CountryType='ET'">Etiyopya</xsl:when>
            <xsl:when test="$CountryType='FK'">Falkland Adaları</xsl:when>
            <xsl:when test="$CountryType='FO'">Faroe Adaları (DK)</xsl:when>
            <xsl:when test="$CountryType='MA'">Fas</xsl:when>
            <xsl:when test="$CountryType='FJ'">Fiji</xsl:when>
            <xsl:when test="$CountryType='CI'">Fildişi Sahili</xsl:when>
            <xsl:when test="$CountryType='PH'">Filipinler</xsl:when>
            <xsl:when test="$CountryType='FI'">Finlandiya</xsl:when>
            <xsl:when test="$CountryType='FR'">Fransa</xsl:when>
            <xsl:when test="$CountryType='GF'">Fransız Guyanası (FR)</xsl:when>
            <xsl:when test="$CountryType='PF'">Fransız Polinezyası (FR)</xsl:when>
            <xsl:when test="$CountryType='GA'">Gabon</xsl:when>
            <xsl:when test="$CountryType='GM'">Gambiya</xsl:when>
            <xsl:when test="$CountryType='GH'">Gana</xsl:when>
            <xsl:when test="$CountryType='GN'">Gine</xsl:when>
            <xsl:when test="$CountryType='GW'">Gine Bissau</xsl:when>
            <xsl:when test="$CountryType='GD'">Grenada</xsl:when>
            <xsl:when test="$CountryType='GL'">Grönland (DK)</xsl:when>
            <xsl:when test="$CountryType='GP'">Guadeloupe (FR)</xsl:when>
            <xsl:when test="$CountryType='GT'">Guatemala</xsl:when>
            <xsl:when test="$CountryType='GG'">Guernsey (GB)</xsl:when>
            <xsl:when test="$CountryType='ZA'">Güney Afrika</xsl:when>
            <xsl:when test="$CountryType='KR'">Güney Kore</xsl:when>
            <xsl:when test="$CountryType='GE'">Gürcistan</xsl:when>
            <xsl:when test="$CountryType='GY'">Guyana</xsl:when>
            <xsl:when test="$CountryType='HT'">Haiti</xsl:when>
            <xsl:when test="$CountryType='IN'">Hindistan</xsl:when>
            <xsl:when test="$CountryType='HR'">Hırvatistan</xsl:when>
            <xsl:when test="$CountryType='NL'">Hollanda</xsl:when>
            <xsl:when test="$CountryType='HN'">Honduras</xsl:when>
            <xsl:when test="$CountryType='HK'">Hong Kong (CN)</xsl:when>
            <xsl:when test="$CountryType='VG'">İngiliz Virjin Adaları</xsl:when>
            <xsl:when test="$CountryType='IQ'">Irak</xsl:when>
            <xsl:when test="$CountryType='IR'">İran</xsl:when>
            <xsl:when test="$CountryType='IE'">İrlanda</xsl:when>
            <xsl:when test="$CountryType='ES'">İspanya</xsl:when>
            <xsl:when test="$CountryType='IL'">İsrail</xsl:when>
            <xsl:when test="$CountryType='SE'">İsveç</xsl:when>
            <xsl:when test="$CountryType='CH'">İsviçre</xsl:when>
            <xsl:when test="$CountryType='IT'">İtalya</xsl:when>
            <xsl:when test="$CountryType='IS'">İzlanda</xsl:when>
            <xsl:when test="$CountryType='JM'">Jamaika</xsl:when>
            <xsl:when test="$CountryType='JP'">Japonya</xsl:when>
            <xsl:when test="$CountryType='JE'">Jersey (GB)</xsl:when>
            <xsl:when test="$CountryType='KH'">Kamboçya</xsl:when>
            <xsl:when test="$CountryType='CM'">Kamerun</xsl:when>
            <xsl:when test="$CountryType='CA'">Kanada</xsl:when>
            <xsl:when test="$CountryType='ME'">Karadağ</xsl:when>
            <xsl:when test="$CountryType='QA'">Katar</xsl:when>
            <xsl:when test="$CountryType='KZ'">Kazakistan</xsl:when>
            <xsl:when test="$CountryType='KE'">Kenya</xsl:when>
            <xsl:when test="$CountryType='CY'">Kıbrıs</xsl:when>
            <xsl:when test="$CountryType='KG'">Kırgızistan</xsl:when>
            <xsl:when test="$CountryType='KI'">Kiribati</xsl:when>
            <xsl:when test="$CountryType='CO'">Kolombiya</xsl:when>
            <xsl:when test="$CountryType='KM'">Komorlar</xsl:when>
            <xsl:when test="$CountryType='CG'">Kongo Cumhuriyeti</xsl:when>
            <xsl:when test="$CountryType='KV'">Kosova (RS)</xsl:when>
            <xsl:when test="$CountryType='CR'">Kosta Rika</xsl:when>
            <xsl:when test="$CountryType='CU'">Küba</xsl:when>
            <xsl:when test="$CountryType='KW'">Kuveyt</xsl:when>
            <xsl:when test="$CountryType='KP'">Kuzey Kore</xsl:when>
            <xsl:when test="$CountryType='LA'">Laos</xsl:when>
            <xsl:when test="$CountryType='LS'">Lesoto</xsl:when>
            <xsl:when test="$CountryType='LV'">Letonya</xsl:when>
            <xsl:when test="$CountryType='LR'">Liberya</xsl:when>
            <xsl:when test="$CountryType='LY'">Libya</xsl:when>
            <xsl:when test="$CountryType='LI'">Lihtenştayn</xsl:when>
            <xsl:when test="$CountryType='LT'">Litvanya</xsl:when>
            <xsl:when test="$CountryType='LB'">Lübnan</xsl:when>
            <xsl:when test="$CountryType='LU'">Lüksemburg</xsl:when>
            <xsl:when test="$CountryType='HU'">Macaristan</xsl:when>
            <xsl:when test="$CountryType='MG'">Madagaskar</xsl:when>
            <xsl:when test="$CountryType='MO'">Makao (CN)</xsl:when>
            <xsl:when test="$CountryType='MK'">Makedonya</xsl:when>
            <xsl:when test="$CountryType='MW'">Malavi</xsl:when>
            <xsl:when test="$CountryType='MV'">Maldivler</xsl:when>
            <xsl:when test="$CountryType='MY'">Malezya</xsl:when>
            <xsl:when test="$CountryType='ML'">Mali</xsl:when>
            <xsl:when test="$CountryType='MT'">Malta</xsl:when>
            <xsl:when test="$CountryType='IM'">Man Adası (GB)</xsl:when>
            <xsl:when test="$CountryType='MH'">Marshall Adaları</xsl:when>
            <xsl:when test="$CountryType='MQ'">Martinique (FR)</xsl:when>
            <xsl:when test="$CountryType='MU'">Mauritius</xsl:when>
            <xsl:when test="$CountryType='YT'">Mayotte (FR)</xsl:when>
            <xsl:when test="$CountryType='MX'">Meksika</xsl:when>
            <xsl:when test="$CountryType='FM'">Mikronezya</xsl:when>
            <xsl:when test="$CountryType='EG'">Mısır</xsl:when>
            <xsl:when test="$CountryType='MN'">Moğolistan</xsl:when>
            <xsl:when test="$CountryType='MD'">Moldova</xsl:when>
            <xsl:when test="$CountryType='MC'">Monako</xsl:when>
            <xsl:when test="$CountryType='MR'">Moritanya</xsl:when>
            <xsl:when test="$CountryType='MZ'">Mozambik</xsl:when>
            <xsl:when test="$CountryType='MM'">Myanmar</xsl:when>
            <xsl:when test="$CountryType='NA'">Namibya</xsl:when>
            <xsl:when test="$CountryType='NR'">Nauru</xsl:when>
            <xsl:when test="$CountryType='NP'">Nepal</xsl:when>
            <xsl:when test="$CountryType='NE'">Nijer</xsl:when>
            <xsl:when test="$CountryType='NG'">Nijerya</xsl:when>
            <xsl:when test="$CountryType='NI'">Nikaragua</xsl:when>
            <xsl:when test="$CountryType='NO'">Norveç</xsl:when>
            <xsl:when test="$CountryType='CF'">Orta Afrika Cumhuriyeti</xsl:when>
            <xsl:when test="$CountryType='UZ'">Özbekistan</xsl:when>
            <xsl:when test="$CountryType='PK'">Pakistan</xsl:when>
            <xsl:when test="$CountryType='PW'">Palau</xsl:when>
            <xsl:when test="$CountryType='PA'">Panama</xsl:when>
            <xsl:when test="$CountryType='PG'">Papua Yeni Gine</xsl:when>
            <xsl:when test="$CountryType='PY'">Paraguay</xsl:when>
            <xsl:when test="$CountryType='PE'">Peru</xsl:when>
            <xsl:when test="$CountryType='PL'">Polonya</xsl:when>
            <xsl:when test="$CountryType='PT'">Portekiz</xsl:when>
            <xsl:when test="$CountryType='PR'">Porto Riko (US)</xsl:when>
            <xsl:when test="$CountryType='RE'">Réunion (FR)</xsl:when>
            <xsl:when test="$CountryType='RO'">Romanya</xsl:when>
            <xsl:when test="$CountryType='RW'">Ruanda</xsl:when>
            <xsl:when test="$CountryType='RU'">Rusya</xsl:when>
            <xsl:when test="$CountryType='BL'">Saint Barthélemy (FR)</xsl:when>
            <xsl:when test="$CountryType='KN'">Saint Kitts ve Nevis</xsl:when>
            <xsl:when test="$CountryType='LC'">Saint Lucia</xsl:when>
            <xsl:when test="$CountryType='PM'">Saint Pierre ve Miquelon (FR)</xsl:when>
            <xsl:when test="$CountryType='VC'">Saint Vincent ve Grenadinler</xsl:when>
            <xsl:when test="$CountryType='WS'">Samoa</xsl:when>
            <xsl:when test="$CountryType='SM'">San Marino</xsl:when>
            <xsl:when test="$CountryType='ST'">São Tomé ve Príncipe</xsl:when>
            <xsl:when test="$CountryType='SN'">Senegal</xsl:when>
            <xsl:when test="$CountryType='SC'">Seyşeller</xsl:when>
            <xsl:when test="$CountryType='SL'">Sierra Leone</xsl:when>
            <xsl:when test="$CountryType='CL'">Şili</xsl:when>
            <xsl:when test="$CountryType='SG'">Singapur</xsl:when>
            <xsl:when test="$CountryType='RS'">Sırbistan</xsl:when>
            <xsl:when test="$CountryType='SK'">Slovakya Cumhuriyeti</xsl:when>
            <xsl:when test="$CountryType='SI'">Slovenya</xsl:when>
            <xsl:when test="$CountryType='SB'">Solomon Adaları</xsl:when>
            <xsl:when test="$CountryType='SO'">Somali</xsl:when>
            <xsl:when test="$CountryType='SS'">South Sudan</xsl:when>
            <xsl:when test="$CountryType='SJ'">Spitsbergen (NO)</xsl:when>
            <xsl:when test="$CountryType='LK'">Sri Lanka</xsl:when>
            <xsl:when test="$CountryType='SD'">Sudan</xsl:when>
            <xsl:when test="$CountryType='SR'">Surinam</xsl:when>
            <xsl:when test="$CountryType='SY'">Suriye</xsl:when>
            <xsl:when test="$CountryType='SA'">Suudi Arabistan</xsl:when>
            <xsl:when test="$CountryType='SZ'">Svaziland</xsl:when>
            <xsl:when test="$CountryType='TJ'">Tacikistan</xsl:when>
            <xsl:when test="$CountryType='TZ'">Tanzanya</xsl:when>
            <xsl:when test="$CountryType='TH'">Tayland</xsl:when>
            <xsl:when test="$CountryType='TW'">Tayvan</xsl:when>
            <xsl:when test="$CountryType='TG'">Togo</xsl:when>
            <xsl:when test="$CountryType='TO'">Tonga</xsl:when>
            <xsl:when test="$CountryType='TT'">Trinidad ve Tobago</xsl:when>
            <xsl:when test="$CountryType='TN'">Tunus</xsl:when>
            <xsl:when test="$CountryType='TR'">Türkiye</xsl:when>
            <xsl:when test="$CountryType='TM'">Türkmenistan</xsl:when>
            <xsl:when test="$CountryType='TC'">Turks ve Caicos</xsl:when>
            <xsl:when test="$CountryType='TV'">Tuvalu</xsl:when>
            <xsl:when test="$CountryType='UG'">Uganda</xsl:when>
            <xsl:when test="$CountryType='UA'">Ukrayna</xsl:when>
            <xsl:when test="$CountryType='OM'">Umman</xsl:when>
            <xsl:when test="$CountryType='JO'">Ürdün</xsl:when>
            <xsl:when test="$CountryType='UY'">Uruguay</xsl:when>
            <xsl:when test="$CountryType='VU'">Vanuatu</xsl:when>
            <xsl:when test="$CountryType='VA'">Vatikan</xsl:when>
            <xsl:when test="$CountryType='VE'">Venezuela</xsl:when>
            <xsl:when test="$CountryType='VN'">Vietnam</xsl:when>
            <xsl:when test="$CountryType='WF'">Wallis ve Futuna (FR)</xsl:when>
            <xsl:when test="$CountryType='YE'">Yemen</xsl:when>
            <xsl:when test="$CountryType='NC'">Yeni Kaledonya (FR)</xsl:when>
            <xsl:when test="$CountryType='NZ'">Yeni Zelanda</xsl:when>
            <xsl:when test="$CountryType='CV'">Yeşil Burun Adaları</xsl:when>
            <xsl:when test="$CountryType='GR'">Yunanistan</xsl:when>
            <xsl:when test="$CountryType='ZM'">Zambiya</xsl:when>
            <xsl:when test="$CountryType='ZW'">Zimbabve</xsl:when>
            <xsl:otherwise><xsl:value-of select="$CountryType"/></xsl:otherwise>
        </xsl:choose>
        
    </xsl:template>
    <xsl:template name='Party_Other'>
        <xsl:param name="PartyType" />
        <xsl:for-each select="cbc:WebsiteURI">
            <tr align="left">
                <td>
                    <xsl:text>Web Sitesi: </xsl:text>
                    <xsl:value-of select="."/>
                </td>
            </tr>
        </xsl:for-each>
        <xsl:for-each select="cac:Contact/cbc:ElectronicMail">
            <tr align="left">
                <td>
                    <xsl:text>E-Posta: </xsl:text>
                    <xsl:value-of select="."/>
                </td>
            </tr>
        </xsl:for-each> 
        <xsl:for-each select="cac:Contact">
            <xsl:if test="cbc:Telephone or cbc:Telefax">
                <tr align="left">
                    <td style="width:469px; " align="left">
                        <xsl:for-each select="cbc:Telephone">
                            <xsl:text>Tel: </xsl:text>
                            <xsl:apply-templates/>
                        </xsl:for-each>
                        <xsl:for-each select="cbc:Telefax">
                            <xsl:text> Fax: </xsl:text>
                            <xsl:apply-templates/>
                        </xsl:for-each>
                        <xsl:text>&#160;</xsl:text>
                    </td>
                </tr>
            </xsl:if>
        </xsl:for-each>
        <xsl:if test="$PartyType!='TAXFREE' and not(starts-with($PartyType, 'EXPORT'))">
            <xsl:for-each select="cac:PartyTaxScheme/cac:TaxScheme/cbc:Name">
                <tr align="left">
                    <td>
                        <xsl:text>Vergi Dairesi: </xsl:text>
                        <xsl:apply-templates/>
                    </td>
                </tr>
            </xsl:for-each>
            <xsl:for-each select="cac:PartyIdentification">
            <tr align="left">
                <td>
                    <xsl:value-of select="cbc:ID/@schemeID"/>
                    <xsl:text>: </xsl:text>
                    <xsl:value-of select="cbc:ID"/>
                </td>
            </tr>
            </xsl:for-each>
        </xsl:if>
    </xsl:template>
    <xsl:template name="Curr_Type">
        <xsl:value-of select="format-number(., '###.##0,00', 'european')"/>     
        <xsl:if test="@currencyID">
            <xsl:text> </xsl:text>
            <xsl:choose>
                <xsl:when test="@currencyID = 'TRL' or @currencyID = 'TRY'">
                    <xsl:text>TL</xsl:text>                 
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="@currencyID"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:if>       
    </xsl:template>
</xsl:stylesheet>
