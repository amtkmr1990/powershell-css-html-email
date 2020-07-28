<?xml version="1.0" encoding="ISO-8859-1"?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html"/>

  <xsl:template match="/">
    <html>
      <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
        <title>
          Title Message - <xsl:value-of select="root/row/Column"/>
        </title>
        <style>
          body {
          font-family: Calibri, Arial, Helvetica, sans-serif;
          font-size: 13px;
          }

          table {
          border-collapse: collapse;
          font-family: Calibri, Arial, Helvetica, sans-serif;
          font-size: 13px;
          width: 100%;
          }

          td, th {
          border: 1px solid #ddd;
          padding: 5px;
          }

          tr:nth-child(even) {
          background-color: #f2f2f2;
          }

          tr:hover {
          background-color: #ddd;
          }

          th {
          padding-top: 7px;
          padding-bottom: 7px;
          text-align: left;
          background-color:crimson;
          color: white;
          }
        </style>
      </head>
      <body>
        Hello Team,
        <br />
        <br /> show some value from XML <b>
          <xsl:value-of select="root/row/SrcHost"/>
        </b> Show another value from XML  <b>
          <xsl:value-of select="root/row/Cluster"/>

        <table >
          <tr >
            <th>Header 1 </th>
            <th>Header 2 </th>
            <th>Header 3 </th>
          </tr>
          <xsl:for-each select="root/row">
            <tr>

              <td>
                <xsl:value-of select="Column"/>
              </td>
              <td>
                <xsl:value-of select="Column"/>
              </td>
              <td>
                <xsl:value-of select="Column"/>
              </td>
              <td>
            </tr>
          </xsl:for-each>
        </table>

        <br></br>
        show some value from xml <xsl:value-of select="root/row/ZABBIX_TRIGGER_ID"/>&amp;eventid=<xsl:value-of select="root/row/Zabbix_Event_Id"/>
      </body>
    </html>
  </xsl:template>

</xsl:stylesheet>