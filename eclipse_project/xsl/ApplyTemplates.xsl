<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="/">
		<html>
			<body>
				<b>Order ID: <xsl:value-of select="Order/@id"></xsl:value-of></b>
				<xsl:apply-templates />
				
			</body>
		</html>
	</xsl:template>
	
	<xsl:template match="CustomerName">
		<b>Customer name: <xsl:value-of select="." /></b>
	</xsl:template>
	
	<xsl:template match="Item">
		<p>Name: <xsl:value-of select="ItemName" /></p>
		<p>Price: <xsl:value-of select="Price" /></p>
	</xsl:template>
	
</xsl:stylesheet>