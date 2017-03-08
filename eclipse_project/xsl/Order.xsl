<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="/">
		<html>
			<body>
				<h2>Order Details: <xsl:value-of select="Order/CustomerName"></xsl:value-of></h2>
				<h3>Order ID: <xsl:value-of select="Order/@id"></xsl:value-of></h3>
				<table>
					<tr>
						<th>Id</th>
						<th>Name</th>
						<th>Price</th>
						<th>Quantity</th>
						<th>Type</th>
					</tr>
					<xsl:for-each select="Order/Item">
						<xsl:sort select="Price" data-type="number" order="ascending" />
						<tr>
							<td><xsl:value-of select="ItemId"></xsl:value-of></td>
							<td><xsl:value-of select="ItemName"></xsl:value-of></td>
							<td><xsl:value-of select="Price"></xsl:value-of></td>
							<td><xsl:value-of select="Quantity"></xsl:value-of></td>
							<td>
								<xsl:choose>
									<xsl:when test="Price >= 500">
										<b>Platinum</b>
									</xsl:when>
									<xsl:otherwise>
										<p>Standard</p>
									</xsl:otherwise>
								</xsl:choose>
							</td>
						</tr>
					</xsl:for-each>
				</table>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>