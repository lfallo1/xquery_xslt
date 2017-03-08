(: Avg cost of all books :)
(:
<Average>
{let $plist := doc("../xml/Books.xml")/books/book/price
return avg($plist) }
</Average>
:)

(: find all books that cost more than the avg price of books :)
<Books>
{
let $plist := avg(doc("../xml/Books.xml")/books/book/price)
for $b in doc("../xml/Books.xml")/books/book
where data($b/price > $plist)
order by data($b/price) descending
return <Book>
  { $b/title }
  <TotalPrice>{data($b/price)}</TotalPrice>
</Book>
}
</Books>