(: doc("../xml/Books.xml")/books/book[price < 40]/title :)

<ul>
{
for $x in doc("../xml/Books.xml")/books/book
where $x/price < 60
order by $x/price descending
return <li> {$x/title}
    {$x/price} 
    {$x/year}
</li>
}
</ul>