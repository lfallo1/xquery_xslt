(: doc("../xml/Books.xml")/books/book[price < 40]/title :)

<ErrorList>
{
for $x in doc("../xml/Books.xml")/books/book
order by $x/price descending
return if($x/price > 30) then 
<ErrorItem>
  <Message>{data($x/title)} {" too expensive: $"} {data($x/price)} </Message>
  <Code>241</Code>
</ErrorItem>
else ""
}
</ErrorList>