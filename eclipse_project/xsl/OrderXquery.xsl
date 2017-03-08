<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="/">
		<html>
			<body>
				<h2>Order Information:</h2>
				<xsl:apply-templates />
<!-- 				<xsl:apply-templates select="/Order/Item[@id='3']" /> -->

				<!-- Get total cost using custom recursive function... explicitly starting at first Item element -->
				<xsl:call-template name="sum-items">
					<xsl:with-param name="item" select="/Order/Item[1]" />
					<xsl:with-param name="accumulator" select="0" />
				</xsl:call-template>
				
				<!-- Get total cost using a sum function -->
				<p>Total cost of items = <xsl:value-of select="sum(/Order/Item/Price)"/></p>
				
				<p>Total number of items: <xsl:value-of select="count(/Order/Item)" /></p>

			</body>
		</html>
	</xsl:template>
	
	<xsl:template match="CustomerName">
		<h3>Customer Name: <xsl:value-of select="." /></h3>
		<h3>Customer Name Absolute: <xsl:value-of select="/Order/CustomerName" /></h3>
	</xsl:template>
	
	<xsl:template match="Item">
		Substring: <xsl:value-of select="translate(substring(ItemName,0,5), 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ')" />
		Order ID: <xsl:value-of select="../@id" />
		Price: <xsl:value-of select="ceiling(Price)" />
		<xsl:if test="Price &gt; 600">
			<b>Free shipping</b>
		</xsl:if>
		<xsl:if test="Price &lt;= 600">
			<b>Should be purchased with item whose price is greater than 600</b>
		</xsl:if>
	</xsl:template>
	
	<!-- Sum items function (gt than 400) -->
	<xsl:template name="sum-items">
	  <xsl:param name="item"/>
	  <xsl:param name="accumulator"/>
	
	  <xsl:choose>
	    <xsl:when test="not($item)">
	      <!--* done, return result *-->
	      Total cost of items GT $400: <xsl:value-of select="$accumulator"/>
	    </xsl:when>
	    <xsl:otherwise>
	    	<xsl:choose>
		    	<xsl:when test="$item/Price &gt; 400">
		    		<xsl:variable name="acc" select="$accumulator + ($item/Price)"/>
				      <xsl:call-template name="sum-items">
				        <xsl:with-param name="item" select="$item/following-sibling::Item[1]"/>
				        <xsl:with-param name="accumulator" select="$acc"/>
				      </xsl:call-template>			        	
		    	</xsl:when>
		    	<xsl:otherwise>
			      <xsl:variable name="acc" select="$accumulator"/>
				      <xsl:call-template name="sum-items">
				        <xsl:with-param name="item" select="$item/following-sibling::Item[1]"/>
				        <xsl:with-param name="accumulator" select="$acc"/>
				      </xsl:call-template>		        
			    </xsl:otherwise>
			 </xsl:choose>
	    </xsl:otherwise>
	  </xsl:choose>
	</xsl:template>	
	
</xsl:stylesheet>