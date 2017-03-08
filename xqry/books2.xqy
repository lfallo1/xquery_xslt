(: find all books where atleast one of the authors names is contained in the title of the book :)
<Books>
{
for $book in doc("../xml/Books.xml")/books/book
where some $fn in $book/author satisfies contains($book/title, $fn)
return <Book>
        <Title>{data($book/title)} {": "} {data($book/author)}</Title>
        <ItemCost>{data($book/price) * 1.05}</ItemCost>
        <Author>{data($book/author)}</Author>
      </Book>
}
</Books>