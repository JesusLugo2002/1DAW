<ul>
{
for $x in doc("books2.xml")//book/title
order by $x
return <li>{$x}</li>
}
</ul> 