for $item in doc("../xml/OrderSampleLarge.xml")/Order/Items/Item
return if($item/Quantity > 4) then 
<OrderItem>
	<Name>{$item/Model}</Name>
	<UnitPrice>{$item/UnitPrice}</UnitPrice>
	<Quantity>{$item/Quantity}</Quantity>
	<TotalPrice>{$item/UnitPrice * $item/Quantity}</TotalPrice>
</OrderItem>
else ""