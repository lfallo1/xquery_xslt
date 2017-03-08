(: data is optional, if inside a native string function :)

for $x in doc("../xml/Books.xml")/books/book
return if($x/@category="XML") then <XMLBOOK>{upper-case(data($x/title))}</XMLBOOK>
else <NONXML>{substring(data($x/title),1,10)}</NONXML>


