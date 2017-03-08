(: all books in descending order by price :)
<Books>
{
for $book in doc("../xml/Books.xml")/books/book
order by $book/price descending
return <MyBook>
  <Title>{data($book/title)} {": "} {data($book/author)}</Title>
  <ItemCost>{data($book/price) * 1.05}</ItemCost>
</MyBook>
}
</Books>