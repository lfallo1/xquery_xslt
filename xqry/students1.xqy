(: for $s in distinct-values(doc("../xml/Student.xml")//LastName)
return <LastName>{$s}</LastName> :)

(: Find all books where all authors first name contains Bill :)
(: for $s in doc("../xml/Books.xml")/books/book
where every $fn in $s/author satisfies contains($fn, "Bill")
return $s :)

(: All students whose first name contains the letter 'a' :)
(: for $s in doc("../xml/Student.xml")/StudentScores/Student
where contains($s/FirstName, "a")
return $s :)

(: All book pairs that share an author :)
(: for $b1 in doc("../xml/Books.xml")/books/book
for $b2 in doc("../xml/Books.xml")/books/book
where $b1/author = $b2/author and $b1/title < $b2/title
return
  <PassengerPair>
    <Seat1>{data($b1/title)}</Seat1>
    <Seat2>{data($b2/title)}</Seat2>
  </PassengerPair> :)
  
  
(: Invert Books xml file :)
<Authors>
{
for $nm in distinct-values(doc("../xml/Books.xml")/books/book/author)
return <Author>
  <Name> {$nm} </Name>
  {
    for $book in doc("../xml/Books.xml")/books/book
    where $book/author = $nm
    return <Book>
      <Title> {data($book/title)} </Title>
      {$book/year}
    </Book>
  }
</Author>
}
</Authors>